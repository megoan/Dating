import 'package:dating/landingpage.dart';
import 'package:dating/providers/chatProvider.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/shadchanProvider.dart';
import 'package:dating/screens/shadchanSignUpScrenn.dart';
import 'package:dating/splash-screen.dart';
import 'package:dating/themes/appTheme.dart';
import 'package:dating/themes/colorManager.dart';
import 'package:dating/widgets/OutLineButtonMy.dart';
import 'package:dating/widgets/gradientSwitcher.dart';
import 'package:dating/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

Locale local;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ColorManager.mYTHEME = MYTHEME.DARK;

  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   static void setTheme(BuildContext context){
     if (ColorManager.mYTHEME == MYTHEME.DARK) {
        ColorManager.mYTHEME = MYTHEME.LIGHT;
     }
     else{
        ColorManager.mYTHEME = MYTHEME.DARK;
     }
   
     _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setState(() {});
  }
  MyApp() {
    local = Locale('he');
  }
  static String getLocale() {
    try {
      if (locale != null) {
        return locale.languageCode;
      } else
        return ui.window.locale.languageCode;
    } catch (error) {
      print("error in get locale $error");
      return "en";
    }
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ChatProvider>(create: (_) => ChatProvider()),
          Provider<ShadchanProvider>(create: (_) => ShadchanProvider()),
          // Provider<PersonProvider>(create: (_) => PersonProvider()),
          ProxyProvider<ShadchanProvider, PersonProvider>(
            update: (_, shadchanProvider, __) => PersonProvider(shadchanProvider),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: ColorManager().theme.primary,
            accentColor: ColorManager().theme.secondary,
            //primarySwatch:  Colors.blue,
          ),
          localizationsDelegates: [
            // ... app-specific localization delegate[s] here
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en'), // English
            const Locale('he'), // Hebrew
            // ... other locales the app supports
          ],
          locale: local,
          title: 'Flutter Demo',
          routes: <String, WidgetBuilder>{'/homepage': (BuildContext context) => ShadchanSignUpScreen(), '/landingpage': (BuildContext context) => LandingPage()},
          home: FutureBuilder(
            future: FirebaseAuth.instance.currentUser(),
            builder: (ctx, authResultSnapshot) => authResultSnapshot.connectionState == ConnectionState.waiting
                ? SplashScreen()
                : authResultSnapshot.data != null
                    ? ShadchanSignUpScreen()
                    : MyHomePage(
                        title: "Verify your phone",
                      ),
          ),
        ));
  }
}
//}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String phoneNo;
  String smsCode;
  String verificationId;
  bool genderMale;
  bool genderWoman;
  bool verifyEnabled = false;
  GradientSwitcher gradientButtonMan;
  GradientSwitcher gradientButtonWoman;
  TextEditingController phoneCode = TextEditingController(text: "+972");
  bool isLoading = false;

  Future<void> verifyPhone() async {
    setState(() {
      isLoading = true;
    });
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialog(context).then((onValue) {
        print('Signed in');
      });
    };
    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential phoneCredentials) {
      // setState(() {
      //  isLoading=false;
      // });
      print("verified");
      FirebaseAuth.instance.currentUser().then((user) {
        if (user != null) {
          Navigator.pop(context);
          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new ShadchanSignUpScreen()));
        }
      });
    };
    final PhoneVerificationFailed verifiedFailed = (AuthException exception) {
      print('${exception.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: this.phoneCode.text + " " + this.phoneNo, codeAutoRetrievalTimeout: autoRetrieve, codeSent: smsCodeSent, timeout: const Duration(seconds: 5), verificationCompleted: verifiedSuccess, verificationFailed: verifiedFailed);
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('enter sms code'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                child: Text('done'),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      Navigator.pop(context);
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new ShadchanSignUpScreen()));
                    } else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }

  signIn() {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShadchanSignUpScreen()));
    }).catchError((e) {
      print(e);
    });
  }

  var isInit = false;
  @override
  void didChangeDependencies() {
    if (!isInit) {}
    isInit = true;

    super.didChangeDependencies();
  }

  void selectWoman() {
    setState(() {
      genderMale = false;
      genderWoman = true;
      verifyEnabled = true;
    });
  }

  void selectMan() {
    setState(() {
      genderMale = true;
      genderWoman = false;
      verifyEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    gradientButtonMan = GradientSwitcher.getGradiantButton(context, selectMan, 'MAN', 20, genderMale == null ? false : genderMale);
    gradientButtonWoman = GradientSwitcher.getGradiantButton(context, selectWoman, 'WOMAN', 20, genderWoman == null ? false : genderWoman);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.indigo[800],
              Colors.purple[700],
              Colors.pink[600],
              Colors.pink[800],
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Text("Varify phone number", style: TextStyle(fontSize: 20)),
                ),
                Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CountryCodePicker(
                            onChanged: (value) {
                              phoneCode.text = value.toString();
                            },
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'IL',
                            favorite: ['+39', 'FR'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.

                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                  child: Container(
                                width: 40,
                                child: TextField(
                                  enabled: false,
                                  controller: phoneCode,
                                ),
                              )),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                  child: TextField(
                                decoration: InputDecoration(hintText: 'enter phone number'),
                                onChanged: (value) {
                                  this.phoneNo = value;
                                  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                  RegExp regExp = new RegExp(patttern);
                                  if (regExp.hasMatch(value)) {
                                    setState(() {
                                      verifyEnabled = true;
                                    });
                                  } else {
                                    setState(() {
                                      verifyEnabled = false;
                                    });
                                  }
                                },
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          // gradientButtonMan,

                          //SizedBox(height: 10,),
                          //  gradientButtonWoman,
                          // SizedBox(height: 10,),
                          OutLineButtonMy(
                            verifyEnabled: verifyEnabled,
                            callBackFunction: verifyPhone,
                            text: 'verify',
                          ),
                          //GradientButton.getGradiantButton(context, verifyPhone, 'verify', Colors.black, 20,verifyEnabled),
                          //   CircularProgressIndicator(strokeWidth: 10,),
                          (isLoading) ? Loader() : Container(),
                          // RaisedButton(
                          //   onPressed: (){
                          //     ThemeController.switchTheme(context);
                          //       // DynamicTheme.of(context).setThemeData(ThemeSwitcher.getTheme(context));
                          //   },
                          //   child: Text('change theme'),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
