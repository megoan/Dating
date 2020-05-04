import 'dart:io';
import 'package:dating/models/person.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/themes/appTheme.dart';
import 'package:dating/widgets/photoPickerFlat.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:dating/widgets/selectAndMultiSelectChips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class AddPerson extends StatefulWidget {
  final bool update;
  AddPerson({this.update});
  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormState> _secondFormKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //final GlobalKey<ScaffoldState> _secondScaffoldState = new GlobalKey<ScaffoldState>();
  double personHeight = 1.5;
  double lookingPersonHeightMin = 1;
  double lookingPersonHeightMax = 2.3;

  double personAge = 23;
  double lookingPersonAgeMin = 18;
  double lookingPersonAgeMax = 99;

  String myHeight = "";
  String hisHeight1 = "";
  String hisHeight2 = "";
  String dateString = "";
  RangeValues rangeValues = RangeValues(1, 2.3);
  RangeLabels rangeLabels = RangeLabels('1', '2.3');

  RangeValues rangeValuesAge = RangeValues(18, 99);
  RangeLabels rangeLabelsAge = RangeLabels('18', '99');
  Gender sSelected = Gender.FEMALE;
  File _image1;
  File _image2;
  File _image3;
  File _image4;

  void imageCallBack1(var image) {
    setState(() {
      _image1 = image;
    });
  }

  void imageCallBack2(var image) {
    if (image == null) {
      setState(() {
        _image2 = _image3;
        _image3 = _image4;
        _image4 = null;
      });
    } else {
      setState(() {
        _image2 = image;
      });
    }
  }

  void imageCallBack3(var image) {
    if (image == null) {
      setState(() {
        _image3 = _image4;
        _image4 = null;
      });
    } else {
      if (_image2 == null) {
        setState(() {
          _image2 = image;
        });
      } else {
        setState(() {
          _image3 = image;
        });
      }
    }
  }

  void imageCallBack4(var image) {
    if (image == null) {
      setState(() {
        _image4 = null;
      });
    } else {
      if (_image2 == null) {
        setState(() {
          _image2 = image;
        });
      } else if (_image3 == null) {
        setState(() {
          _image3 = image;
        });
      } else {
        setState(() {
          _image4 = image;
        });
      }
    }
  }

  String dateTimeToStringFormat(_date) {
    DateTime date = _date != null ? _date : DateTime.now();
    var myday = "";
    var myMonth = "";
    if (date.day < 10) {
      myday += "0" + date.day.toString();
    } else {
      myday = "" + date.day.toString();
    }
    if (date.month < 10) {
      myMonth += "0" + date.month.toString();
    } else {
      myMonth = "" + date.month.toString();
    }
    return "$myday/$myMonth/${date.year}";
  }

  void selectedDate(DateTime date) {
    setState(() {
      personProvider.newPerson.birthday = date;
      dateString = dateTimeToStringFormat(date);
    });
  }

  DateTime convertToDate(String input) {
    try {
      var d = new DateFormat.yMd().parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }

  bool isValidDob(dob) {
    if (dob == null) return false;
    DateTime now = new DateTime.now();
    if (dob is String) {
      DateTime currentDate = convertToDate(dob);
      return currentDate != null && currentDate.isBefore(new DateTime(now.year - 18, now.month, now.day));
    } else if (dob is DateTime)
      return dob != null && dob.isBefore(new DateTime(now.year - 18, now.month, now.day));
    else
      return false;
  }

  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return regex.hasMatch(input);
  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  void showMessage(String message, [MaterialColor color = Colors.blue]) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  bool _submitForm() {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      return false;
    } else {
      form.save();
      return true;
    }
  }

  Future<bool> _submitSecondForm() async {
    final FormState form = _secondFormKey.currentState;

    if (!form.validate()) {
      return false;
    } else {
      //This invokes each onSaved event
      form.save();
      if (widget.update != null && widget.update) {
        await personProvider.updatePerson(personProvider.newPerson);
      } else {
        await personProvider.addPerson(personProvider.newPerson);
      }

      return true;
    }
  }

  void showFinishDialog() {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.checkCircle,
                size: 50.0,
                color: Colors.green,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "What's next?",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          children: <Widget>[
            new FlatButton(
              textColor: AppTheme.primary,
              child: Text(
                'Add new Person',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
                Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new AddPerson()));
              },
            ),
            new FlatButton(
              textColor: AppTheme.primary,
              child: Text(
                'Back to Home',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
              },
            ),
          ],
        );
      },
    );
  }

  PersonProvider personProvider;

  bool isInit = true;
  bool isLoading = true;
  bool missingImage = false;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      isInit = false;
      personProvider = Provider.of<PersonProvider>(context);
      print(widget.update);
      if (widget.update == null || !widget.update) {
        personProvider.newPerson = new Person(shadchanID: personProvider.shadchanProvider.myShadchan.id);
        personProvider.newPerson.areas = new Map<Area, bool>();
        personProvider.newPerson.countrys = new Map<Country, bool>();
        personProvider.newPerson.doses = new Map<Dos, bool>();
        personProvider.newPerson.hashkafas = new Map<Hashkafa, bool>();
        personProvider.newPerson.statuses = new Map<Status, bool>();
        personProvider.newPerson.edas = new Map<Eda, bool>();
        personProvider.newPerson.smoking = new Map<Smoke, bool>();
        personProvider.newPerson.mySherutBoy = new Map<SherutBoy, bool>();
        personProvider.newPerson.mySherutGirl = new Map<SherutGirl, bool>();
        personProvider.newPerson.thereSherutBoy = new Map<SherutBoy, bool>();
        personProvider.newPerson.thereSherutGirl = new Map<SherutGirl, bool>();
      } else {
        personHeight = personProvider.newPerson.height;
        lookingPersonHeightMin = personProvider.newPerson.heightMin;
        lookingPersonHeightMax = personProvider.newPerson.heightMax;
        lookingPersonAgeMin = personProvider.newPerson.ageMin;
        lookingPersonAgeMax = personProvider.newPerson.ageMax;
        rangeValuesAge = RangeValues(personProvider.newPerson.ageMin, personProvider.newPerson.ageMax);
        rangeValues = RangeValues(personProvider.newPerson.heightMin, personProvider.newPerson.heightMax);
      }
      sSelected = personProvider.newPerson.gender;
      dateString = dateTimeToStringFormat(personProvider.newPerson.birthday);

      setState(() {});
      // shadchanProvider = Provider.of<ShadchanProvider>(context);

    }

    super.didChangeDependencies();
    //getAllPeople()
  }

  TextFormField tff;
  Map map1 = new Map();
  List lll = new List();
  int _index = 0;

  TextStyle themeTextStyle = new TextStyle(color: AppTheme.textColor);
  TextStyle titles = new TextStyle(color: AppTheme.textColor, fontSize: 20);

  Widget title(title) {
    return Padding(padding: EdgeInsets.all(10), child: Text(title, style: titles));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: AppTheme.filterBackgroundColor,
        appBar: AppBar(
          title: Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Add a candidate')),
        ),
        body: Stepper(
            type: StepperType.horizontal,
            currentStep: _index,
            onStepTapped: (index) {
              if (index == 1) {
                if (_submitForm())
                  setState(() {
                    _index = index;
                  });
                else
                  showMessage(
                    "hey, what are you doing!! 2",
                  );
              } else
                setState(() {
                  _index = index;
                });
            },
            onStepCancel: () {
              Navigator.of(context).pop();
            },
            onStepContinue: () async {
              if (_index == 0) {
                if (_submitForm())
                  setState(() {
                    _index++;
                  });
                else
                  showMessage(
                    "hey, what are you doing!!",
                  );
              } else if (_index == 1) {
                bool formIsFinished = await _submitSecondForm();
                if (formIsFinished) if (widget.update != null && widget.update)
                  Navigator.of(context).pop();
                else
                  showFinishDialog();
                else
                  showMessage(
                    "hey, what are you doing!! 3 ",
                  );
              }
            },
            steps: [
              Step(
                isActive: _index == 0,
                title: Text('פרטי מועמד'),
                content: Container(
                  child: Form(
                    key: _formKey,
                    autovalidate: false,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: FormField(
                                builder: (FormFieldState<dynamic> field) {
                                  return PhotoPickerFlat(
                                    height: 210,
                                    small: false,
                                    imageUrl: personProvider.newPerson != null && personProvider.newPerson.profileImages != null && personProvider.newPerson.profileImages.length > 0
                                        ? personProvider.newPerson.profileImages[0]
                                        : null,
                                    image: _image1,
                                    imageCallBack: imageCallBack1,
                                  );
                                },
                                validator: (val) {
                                  if (_image1 != null || personProvider.newPerson.profileImages != null) {
                                    setState(() {
                                      missingImage = false;
                                    });
                                    return null;
                                  }

                                  setState(() {
                                    missingImage = true;
                                  });
                                  return LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                                },
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                height: 200,
                                child:
                                    //FIRST NAME
                                    Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    TextFormField(
                                      cursorColor: Colors.white,
                                      style: themeTextStyle,
                                      initialValue: personProvider.newPerson != null && personProvider.newPerson.firstName != null ? personProvider.newPerson.firstName : "",
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(15),
                                        filled: true,
                                        fillColor: Colors.black12,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                          borderSide: BorderSide(color: AppTheme.primary, width: 0.6),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                        ),

                                        hintStyle: TextStyle(color: AppTheme.primary[300]),
                                        labelStyle: themeTextStyle, //TextStyle(color: AppTheme.primary),
                                        hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'Plony'),
                                        labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'First name'),
                                      ),
                                      inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                                      validator: (val) => val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') : null,
                                      onSaved: (val) => personProvider.newPerson.firstName = val,
                                    ),
                                    //LAST NAME
                                    TextFormField(
                                      cursorColor: Colors.white,
                                      style: themeTextStyle,
                                      initialValue: personProvider.newPerson != null && personProvider.newPerson.lastName != null ? personProvider.newPerson.lastName : "",
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.black12,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                          borderSide: BorderSide(color: AppTheme.primary, width: 0.6),
                                        ),
                                        contentPadding: EdgeInsets.all(15),
                                        border: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                        ),
                                        hintStyle: TextStyle(color: AppTheme.primary[300]),
                                        labelStyle: themeTextStyle,
                                        hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'Almony'),
                                        labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Last name'),
                                      ),
                                      inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                                      validator: (val) => val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') : null,
                                      onSaved: (val) => personProvider.newPerson.lastName = val,
                                    ),

                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(width: sSelected == Gender.MALE ? 2.0 : 1.5, color: sSelected == Gender.MALE ? AppTheme.primary[300] : AppTheme.primary),
                                          ),
                                          child: IconButton(
                                              icon: FaIcon(FontAwesomeIcons.male),
                                              color: sSelected == Gender.MALE ? AppTheme.primary[300] : AppTheme.primary,
                                              padding: EdgeInsets.all(5.0),
                                              // alignment: Alignment.centerRight,
                                              onPressed: () => setState(() {
                                                    sSelected = Gender.MALE;
                                                  })),
                                        ),
                                        Text(
                                          "  " + LocaleText.getLocaleText(MyApp.getLocale(), 'Boy'),
                                          style: sSelected == Gender.MALE ? themeTextStyle : TextStyle(color: Colors.white60),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            border: Border.all(width: sSelected == Gender.FEMALE ? 2.0 : 1.5, color: sSelected == Gender.FEMALE ? AppTheme.primary[300] : AppTheme.primary),
                                          ),
                                          child: IconButton(
                                              icon: FaIcon(FontAwesomeIcons.female),
                                              color: sSelected == Gender.FEMALE ? AppTheme.primary[300] : AppTheme.primary,
                                              padding: EdgeInsets.all(5.0),
                                              //alignment: Alignment.centerRight,
                                              onPressed: () => setState(() {
                                                    sSelected = Gender.FEMALE;
                                                  })),
                                        ),
                                        Text("  " + LocaleText.getLocaleText(MyApp.getLocale(), 'Girl'), style: sSelected == Gender.FEMALE ? themeTextStyle : TextStyle(color: Colors.white60)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (missingImage)
                          Text(LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required'), style: TextStyle(color: Colors.red, fontSize: 12)),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: PhotoPickerFlat(
                                circle: true,
                                imageUrl: personProvider.newPerson != null && personProvider.newPerson.profileImages != null && personProvider.newPerson.profileImages.length > 1
                                    ? personProvider.newPerson.profileImages[0]
                                    : null,
                                image: _image2,
                                imageCallBack: imageCallBack2,
                                height: 150,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: PhotoPickerFlat(
                              circle: true,
                              imageUrl: personProvider.newPerson != null && personProvider.newPerson.profileImages != null && personProvider.newPerson.profileImages.length > 2
                                  ? personProvider.newPerson.profileImages[0]
                                  : null,
                              image: _image3,
                              imageCallBack: imageCallBack3,
                              height: 150,
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: PhotoPickerFlat(
                              circle: true,
                              imageUrl: personProvider.newPerson != null && personProvider.newPerson.profileImages != null && personProvider.newPerson.profileImages.length > 3
                                  ? personProvider.newPerson.profileImages[0]
                                  : null,
                              image: _image4,
                              imageCallBack: imageCallBack4,
                              height: 150,
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.birthdayCake,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'Date of Birth')),
                          ],
                        ),
                        FormField(
                          builder: (FormFieldState<dynamic> state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                FlatButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: AppTheme.primary)),
                                  color: Colors.black12,
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext builder) {
                                          var now = new DateTime.now();
                                          var initialDate = convertToDate(personProvider.newPerson.birthday != null ? new DateFormat.yMd().format(personProvider.newPerson.birthday) : null) ?? now;
                                          initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);
                                          return Container(
                                              height: MediaQuery.of(context).copyWith().size.height / 2.6,
                                              child: DatePickerWidget(
                                                initialDateTime: initialDate,
                                                minDateTime: new DateTime(1900),
                                                maxDateTime: new DateTime.now(),
                                                onConfirm: (date, arrey) => selectedDate(date),
                                              ));
                                        });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              dateString,
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                                            ),
                                          ],
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.angleDown,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                state.hasError
                                    ? Text(
                                        state.errorText,
                                        style: TextStyle(color: Colors.red, fontSize: 12),
                                      )
                                    : Container()
                              ],
                            );
                          },
                          validator: (val) {
                            if (isValidDob(personProvider.newPerson.birthday)) {
                              return null;
                            } else
                              return LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                          },
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.phone,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'Phone')),
                          ],
                        ),
                        TextFormField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          initialValue: personProvider.newPerson != null && personProvider.newPerson.phone != null ? personProvider.newPerson.phone : "",
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            filled: true,
                            fillColor: Colors.black12,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(color: AppTheme.primary, width: 0.6),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                            ),
                            hintStyle: TextStyle(color: AppTheme.primary[300]),
                            hintText: LocaleText.getLocaleText(MyApp.getLocale(), '000-0000000'),
                          ),
                          validator: (val) => isValidPhoneNumber(val) ?null: LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required')  ,
                          onSaved: (val) => personProvider.newPerson.phone = val,
                        ),

                      SizedBox(
                          height: 10,
                        ),
                        //Country
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.globeEurope,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'Country')),
                          ],
                        ),
                        new FormField<Country>(
                          builder: (FormFieldState<Country> state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SelectChip(Country.values, (country) {
                                  //state.didChange(country);
                                  setState(() {
                                    personProvider.newPerson.country = country;
                                  });
                                }, pickedValue: personProvider.newPerson.country),
                                state.hasError
                                    ? Text(
                                        state.errorText,
                                        style: TextStyle(color: Colors.red, fontSize: 12),
                                      )
                                    : Container()
                              ],
                            );
                          },
                          validator: (val) {
                            return personProvider.newPerson.country != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                          },
                        ),
                        if (personProvider.newPerson.country == Country.ISRAEL)
                          SizedBox(
                            height: 10,
                          ),
                        if (personProvider.newPerson.country == Country.ISRAEL)
                          Row(
                            children: <Widget>[
                              FaIcon(
                                FontAwesomeIcons.city,
                                size: 25.0,
                                color: Colors.white,
                              ),
                              title(LocaleText.getLocaleText(MyApp.getLocale(), 'Area')),
                            ],
                          ),
                        //AREA
                        if (personProvider.newPerson.country == Country.ISRAEL)
                          new FormField<Area>(
                            builder: (FormFieldState<Area> state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SelectChip(Area.values, (area) {
                                    personProvider.newPerson.area = area;
                                    // state.didChange(area);
                                  }, pickedValue: personProvider.newPerson.area),
                                  state.hasError
                                      ? Text(
                                          state.errorText,
                                          style: TextStyle(color: Colors.red, fontSize: 12),
                                        )
                                      : Container()
                                ],
                              );
                            },
                            validator: (val) {
                              return personProvider.newPerson.area != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                            },
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.userFriends,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'Status')),
                          ],
                        ),
                        //STATUS
                        new FormField<Status>(
                          builder: (FormFieldState<Status> state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SelectChip(Status.values, (status) {
                                  personProvider.newPerson.status = status;
                                  //state.didChange(status);
                                }, pickedValue: personProvider.newPerson.status),
                                state.hasError
                                    ? Text(
                                        state.errorText,
                                        style: TextStyle(color: Colors.red, fontSize: 12),
                                      )
                                    : Container()
                              ],
                            );
                          },
                          validator: (val) {
                            return personProvider.newPerson.status != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                          },
                        ),
                        //RELIGIOUS
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.torah,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'Religious')),
                          ],
                        ),
                        new FormField<Dos>(
                          builder: (FormFieldState<Dos> state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SelectChip(Dos.values, (val) {
                                  personProvider.newPerson.dos = val;
                                }, pickedValue: personProvider.newPerson.dos),
                                state.hasError
                                    ? Text(
                                        state.errorText,
                                        style: TextStyle(color: Colors.red, fontSize: 12),
                                      )
                                    : Container()
                              ],
                            );
                          },
                          validator: (val) {
                            return personProvider.newPerson.dos != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                          },
                        ),
                        //HASHKAFA
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.starOfDavid,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'Hashkafa')),
                          ],
                        ),
                        new FormField<Hashkafa>(
                          builder: (FormFieldState<Hashkafa> state) {
                            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                              SelectChip(Hashkafa.values, (val) {
                                personProvider.newPerson.hashkafa = val;
                                //state.didChange(val);
                              }, pickedValue: personProvider.newPerson.hashkafa),
                              state.hasError
                                  ? Text(
                                      state.errorText,
                                      style: TextStyle(color: Colors.red, fontSize: 12),
                                    )
                                  : Container()
                            ]);
                          },
                          validator: (val) {
                            return personProvider.newPerson.hashkafa != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                          },
                        ),
                        //EDA
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.synagogue,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'Eda')),
                          ],
                        ),
                        new FormField<Eda>(
                          builder: (FormFieldState<Eda> state) {
                            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                              SelectChip(Eda.values, (val) {
                                personProvider.newPerson.eda = val;
                                //state.didChange(val);
                              }, pickedValue: personProvider.newPerson.eda),
                              state.hasError
                                  ? Text(
                                      state.errorText,
                                      style: TextStyle(color: Colors.red, fontSize: 12),
                                    )
                                  : Container()
                            ]);
                          },
                          validator: (val) {
                            return personProvider.newPerson.eda != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                          },
                        ),
                        //SMOKE
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.smoking,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'Smoking')),
                          ],
                        ),
                        new FormField<Smoke>(
                          builder: (FormFieldState<Smoke> state) {
                            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                              SelectChip(Smoke.values, (val) {
                                personProvider.newPerson.smoke = val;
                                //state.didChange(val);
                              }, pickedValue: personProvider.newPerson.smoke),
                              state.hasError
                                  ? Text(
                                      state.errorText,
                                      style: TextStyle(color: Colors.red, fontSize: 12),
                                    )
                                  : Container()
                            ]);
                          },
                          validator: (val) {
                            return personProvider.newPerson.smoke != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                          },
                        ),
                        //ABOUT ME SHORT
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.short_text,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'About them short')),
                          ],
                        ),
                        new TextFormField(
                          cursorColor: Colors.white,
                          style: themeTextStyle,
                          initialValue: personProvider.newPerson != null && personProvider.newPerson.short != null ? personProvider.newPerson.short : "",
                          maxLines: null,
                          maxLength: 70,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(color: AppTheme.primary, width: 0.6),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                            ),
                            //icon: const Icon(Icons.short_text),
                            hintStyle: TextStyle(color: AppTheme.primary[300]),

                            hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them short'),
                          ),
                          inputFormatters: [new LengthLimitingTextInputFormatter(70)],
                          validator: (val) => val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') : null,
                          onSaved: (val) => personProvider.newPerson.short = val,
                        ),
                        //ABOUT ME LONG
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.format_align_justify,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'About them long')),
                          ],
                        ),
                        new TextFormField(
                          cursorColor: Colors.white,
                          style: themeTextStyle,
                          initialValue: personProvider.newPerson != null && personProvider.newPerson.long != null ? personProvider.newPerson.long : "",
                          maxLines: null,
                          minLines: 5,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black12,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(color: AppTheme.primary, width: 0.6),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                            ),
                            hintStyle: TextStyle(color: AppTheme.primary[300]),
                            hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them long'),
                          ),
                          // inputFormatters: [
                          //   new LengthLimitingTextInputFormatter(500)
                          // ],
                          //validator: (val) => val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') : null,
                          onSaved: (val) => personProvider.newPerson.long = val,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.ruler,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'Height')),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Slider(
                                activeColor: AppTheme.secondary,
                                min: 1.3,
                                max: 2.3,
                                divisions: 130,
                                label: "" + personHeight.toStringAsFixed(2),
                                value: personHeight,
                                onChanged: ((newValue) {
                                  setState(() {
                                    personHeight = newValue;
                                    personProvider.newPerson.height = newValue;
                                  });
                                }),
                              ),
                            ),
                            Text(
                              "" + personHeight.toStringAsFixed(2) + " " + LocaleText.getLocaleText(MyApp.getLocale(), 'm'),
                              style: themeTextStyle,
                            )
                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            FaIcon(
                              FontAwesomeIcons.handHoldingHeart,
                              size: 25.0,
                              color: Colors.white,
                            ),
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'Sherut')),
                          ],
                        ),

                        if (sSelected == Gender.FEMALE)
                          MultiSelectChip(SherutGirl.values, (selected, val) => personProvider.newPerson.mySherutGirl[selected] = val, pickedChips: personProvider.newPerson.mySherutGirl),

                        if (sSelected == Gender.MALE)
                          MultiSelectChip(
                            SherutBoy.values,
                            (selected, val) => personProvider.newPerson.mySherutBoy[selected] = val,
                            pickedChips: personProvider.newPerson.mySherutBoy,
                          ),

                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Row(
                        //   children: <Widget>[
                        //     title("עוד תמונות"),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     FaIcon(
                        //       FontAwesomeIcons.cameraRetro,
                        //       size: 25.0,
                        //       color: Colors.white,
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     FaIcon(
                        //       FontAwesomeIcons.handPeace,
                        //       size: 25.0,
                        //       color: Colors.white,
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: <Widget>[
                        //     Expanded(
                        //       child: PhotoPickerFlat(
                        //         circle: true,
                        //         imageUrl: personProvider.newPerson != null && personProvider.newPerson.profileImages != null && personProvider.newPerson.profileImages.length > 1
                        //             ? personProvider.newPerson.profileImages[0]
                        //             : null,
                        //         image: _image2,
                        //         imageCallBack: imageCallBack2,
                        //         photoNum: 2,
                        //         height: 150,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     Expanded(

                        //         child: PhotoPickerFlat(
                        //           circle: true,
                        //       imageUrl: personProvider.newPerson != null && personProvider.newPerson.profileImages != null && personProvider.newPerson.profileImages.length > 2
                        //           ? personProvider.newPerson.profileImages[0]
                        //           : null,
                        //       image: _image3,
                        //       imageCallBack: imageCallBack3,
                        //       photoNum: 3,
                        //       height: 150,
                        //     )),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     Expanded(
                        //         child: PhotoPickerFlat(
                        //           circle: true,
                        //       imageUrl: personProvider.newPerson != null && personProvider.newPerson.profileImages != null && personProvider.newPerson.profileImages.length > 3
                        //           ? personProvider.newPerson.profileImages[0]
                        //           : null,
                        //       image: _image4,
                        //       imageCallBack: imageCallBack4,
                        //       photoNum: 4,
                        //       height: 150,
                        //     )),
                        //   ],
                        // ),

                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Step(
                isActive: _index == 1,
                title: Text('הצד השני'),
                content: Container(
                  child: Column(
                    children: <Widget>[
                      Form(
                        key: _secondFormKey,
                        autovalidate: false,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Container(
                                padding: const EdgeInsets.only(top: 14.0),
                                child: Text(
                                  sSelected == Gender.FEMALE
                                      ? LocaleText.getLocaleText(MyApp.getLocale(), 'What are she looking for?')
                                      : LocaleText.getLocaleText(MyApp.getLocale(), 'What are he looking for?'),
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            //Country
                            Row(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.globeEurope,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                title(LocaleText.getLocaleText(MyApp.getLocale(), 'Country')),
                              ],
                            ),
                            MultiSelectChip(Country.values, (select, val) => personProvider.newPerson.countrys[select] = val, pickedChips: personProvider.newPerson.countrys),

                            if (personProvider.newPerson.countrys != null && personProvider.newPerson.countrys[Country.ISRAEL] == true)
                              SizedBox(
                                height: 10,
                              ),
                            if (personProvider.newPerson.countrys != null && personProvider.newPerson.countrys[Country.ISRAEL] == true)
                              Row(
                                children: <Widget>[
                                  FaIcon(
                                    FontAwesomeIcons.city,
                                    size: 25.0,
                                    color: Colors.white,
                                  ),
                                  title(LocaleText.getLocaleText(MyApp.getLocale(), 'Area')),
                                ],
                              ),
                            if (personProvider.newPerson.countrys != null && personProvider.newPerson.countrys[Country.ISRAEL] == true)
                              MultiSelectChip(Area.values, (select, val) => personProvider.newPerson.areas[select] = val, pickedChips: personProvider.newPerson.areas),

                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.userFriends,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                title(LocaleText.getLocaleText(MyApp.getLocale(), 'Status')),
                              ],
                            ),
                            MultiSelectChip(Status.values, (select, val) => personProvider.newPerson.statuses[select] = val, pickedChips: personProvider.newPerson.statuses),

                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.torah,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                title(LocaleText.getLocaleText(MyApp.getLocale(), 'Religious')),
                              ],
                            ),
                            MultiSelectChip(Dos.values, (select, val) => personProvider.newPerson.doses[select] = val, pickedChips: personProvider.newPerson.doses),

                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.starOfDavid,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                title(LocaleText.getLocaleText(MyApp.getLocale(), 'Hashkafa')),
                              ],
                            ),
                            MultiSelectChip(Hashkafa.values, (select, val) => personProvider.newPerson.hashkafas[select] = val, pickedChips: personProvider.newPerson.hashkafas),

                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.synagogue,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                title(LocaleText.getLocaleText(MyApp.getLocale(), 'Eda')),
                              ],
                            ),
                            MultiSelectChip(Eda.values, (select, val) => personProvider.newPerson.edas[select] = val, pickedChips: personProvider.newPerson.edas),

                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.smoking,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                title(LocaleText.getLocaleText(MyApp.getLocale(), 'Smoking')),
                              ],
                            ),

                            MultiSelectChip(Smoke.values, (select, val) => personProvider.newPerson.smoking[select] = val, pickedChips: personProvider.newPerson.smoking),

                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.handHoldingHeart,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                title(LocaleText.getLocaleText(MyApp.getLocale(), 'Sherut')),
                              ],
                            ),

                            if (sSelected == Gender.MALE)
                              MultiSelectChip(SherutGirl.values, (select, val) => personProvider.newPerson.thereSherutGirl[select] = val, pickedChips: personProvider.newPerson.thereSherutGirl),
                            if (sSelected == Gender.FEMALE)
                              MultiSelectChip(SherutBoy.values, (select, val) => personProvider.newPerson.thereSherutBoy[select] = val, pickedChips: personProvider.newPerson.thereSherutBoy),

                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.ruler,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                title(LocaleText.getLocaleText(MyApp.getLocale(), 'Height')),
                              ],
                            ),

                            Row(
                              children: <Widget>[
                                Text("" + lookingPersonHeightMin.toStringAsFixed(2) + " " + LocaleText.getLocaleText(MyApp.getLocale(), 'm'), style: themeTextStyle),
                                Expanded(
                                  child: RangeSlider(
                                    activeColor: AppTheme.secondary,
                                    min: 1.0,
                                    max: 2.3,
                                    divisions: 130,
                                    labels: rangeLabels,
                                    values: rangeValues,
                                    onChanged: ((newValue) {
                                      setState(() {
                                        rangeValues = newValue;
                                        rangeLabels = RangeLabels(newValue.start.toStringAsFixed(2), newValue.end.toStringAsFixed(2));
                                        lookingPersonHeightMax = newValue.end;
                                        lookingPersonHeightMin = newValue.start;
                                        personProvider.newPerson.heightMin = newValue.start;
                                        personProvider.newPerson.heightMax = newValue.end;
                                      });
                                    }),
                                  ),
                                ),
                                Text("" + lookingPersonHeightMax.toStringAsFixed(2) + " " + LocaleText.getLocaleText(MyApp.getLocale(), 'm'), style: themeTextStyle)
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: <Widget>[
                                FaIcon(
                                  FontAwesomeIcons.birthdayCake,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                title(LocaleText.getLocaleText(MyApp.getLocale(), 'Age')),
                              ],
                            ),

                            Row(
                              children: <Widget>[
                                Text("" + lookingPersonAgeMin.toStringAsFixed(1), style: themeTextStyle),
                                Expanded(
                                  child: RangeSlider(
                                    activeColor: AppTheme.secondary,
                                    min: 18,
                                    max: 99,
                                    divisions: 162,
                                    labels: rangeLabelsAge,
                                    values: rangeValuesAge,
                                    onChanged: ((newValue) {
                                      setState(() {
                                        rangeValuesAge = newValue;
                                        rangeLabelsAge = RangeLabels(newValue.start.toStringAsFixed(1), newValue.end.toStringAsFixed(1));
                                        lookingPersonAgeMax = newValue.end;
                                        lookingPersonAgeMin = newValue.start;
                                        personProvider.newPerson.ageMin = newValue.start;
                                        personProvider.newPerson.ageMax = newValue.end;
                                      });
                                    }),
                                  ),
                                ),
                                Text("" + lookingPersonAgeMax.toStringAsFixed(1), style: themeTextStyle)
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.format_align_justify,
                            size: 25.0,
                            color: Colors.white,
                          ),
                          title(LocaleText.getLocaleText(MyApp.getLocale(), 'More info')),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      new TextFormField(
                        initialValue: personProvider.newPerson != null && personProvider.newPerson.moreInfo != null ? personProvider.newPerson.moreInfo : "",
                        maxLines: null,
                        style: themeTextStyle,
                        minLines: 5,
                        onChanged: (value) {
                          personProvider.newPerson.moreInfo = value;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black12,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: AppTheme.primary, width: 0.6),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                          ),
                          hintStyle: TextStyle(color: AppTheme.primary[300]),
                          hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'More info'),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
