import 'package:dating/screens/moreMeBirthday.dart';
import 'package:dating/widgets/gradientButton.dart';
import 'package:dating/widgets/gradientSwitcher.dart';
import 'package:dating/widgets/themeSwitcherButton.dart';
import 'package:flutter/material.dart';
class AddGender extends StatefulWidget {
  @override
  _AddGenderState createState() => _AddGenderState();
}

class _AddGenderState extends State<AddGender> {
  BuildContext context2;
  bool verifyEnabled = false;
  bool genderMale;
  bool genderWoman;
  GradientSwitcher gradientButtonMan;
  GradientSwitcher gradientButtonWoman;
   void selectWoman(){
    setState(() {
        genderMale=false;
    genderWoman = true;
    verifyEnabled=true;
    });
  
  }
  void selectMan(){
    setState(() {
          genderMale=true;
          genderWoman = false;
          verifyEnabled=true;
    }); 
  }

  @override
  Widget build(BuildContext context) {
     context2 = context;
    gradientButtonMan =    GradientSwitcher.getGradiantButton(context, selectMan, 'MAN', 20,genderMale==null?false:genderMale);
    gradientButtonWoman =  GradientSwitcher.getGradiantButton(context, selectWoman, 'WOMAN', 20,genderWoman==null?false:genderWoman);
    return Scaffold(
      //  appBar: AppBar(
      //   title: Text('Gender'),
      // ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top:150),
        child: FancyFab(
          context: context,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('I am a',style: TextStyle(fontSize: 35,color: Theme.of(context).primaryColor),),
                      Text('Viewed by all',style: TextStyle(fontSize: 14,color: Theme.of(context).primaryColor),),
                  ],
                ),
                Column(children: <Widget>[
                    gradientButtonMan,
                    SizedBox(height: 10,),
                    gradientButtonWoman,
                ],),
                GradientButton.getGradiantButton(context, addUserGender,
                    'CONTINUE', Colors.black, 20, verifyEnabled),
              ],
            ),
          ),
        
     
    );
  }

  void addUserGender() {
    Navigator.of(context2).push( new MaterialPageRoute( builder: (context) => new MoreMeBirthday()));
  }
}