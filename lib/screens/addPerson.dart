import 'dart:io';

import 'package:dating/models/person.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:dating/themes/appTheme.dart';
import 'package:dating/widgets/photoPickerFlat.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:dating/widgets/photoPicker.dart';
import 'package:dating/widgets/selectAndMultiSelectChips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class AddPerson extends StatefulWidget {
  final bool update;
  AddPerson({this.update});
  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  Area _area;
  Country _country;
  Dos _religious;
  Hashkafa _hashkafa;
  Status _status;
  Eda _eda;
  Smoke _smoke;

  double personHeight = 1.5;
  double lookingPersonHeightMin = 1;
  double lookingPersonHeightMax = 2.3;

  double personAge = 23;
  double lookingPersonAgeMin = 18;
  double lookingPersonAgeMax = 99;

  String myHeight = "";
  String hisHeight1 = "";
  String hisHeight2 = "";
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
    if (image == null) {
      setState(() {
        _image1 = _image2;
        _image2 = _image3;
        _image3 = _image4;
        _image4 = null;
      });
    } else {
      setState(() {
        _image1 = image;
      });
    }
  }

  void imageCallBack2(var image) {
    if (image == null) {
      setState(() {
        _image2 = _image3;
        _image3 = _image4;
        _image4 = null;
      });
    } else {
      if (_image1 == null) {
        setState(() {
          _image1 = image;
        });
      } else {
        setState(() {
          _image2 = image;
        });
      }
    }
  }

  void imageCallBack3(var image) {
    if (image == null) {
      setState(() {
        _image3 = _image4;
        _image4 = null;
      });
    } else {
      if (_image1 == null) {
        setState(() {
          _image1 = image;
        });
      } else if (_image2 == null) {
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
      if (_image1 == null) {
        setState(() {
          _image1 = image;
        });
      } else if (_image2 == null) {
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

  final TextEditingController _controller = new TextEditingController();
  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = new DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now) ? initialDate : now);

    var result = await showDatePicker(context: context, initialDate: initialDate, firstDate: new DateTime(1900), lastDate: new DateTime.now());

    if (result == null) return;

    setState(() {
      _controller.text = new DateFormat.yMd().format(result);
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

  bool isValidDob(String dob) {
    if (dob.isEmpty) return false;
    var d = convertToDate(dob);
    return d != null && d.isBefore(new DateTime.now());
  }

  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return regex.hasMatch(input);
  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  void _submitForm() async {
    final FormState form = _formKey.currentState;

    setState(() {
      areaState.didChange(areaValue);
      countryState.didChange(countryValue);
      statusState.didChange(statusValue);
      religiosState.didChange(religiosValue);
      edaState.didChange(edaValue);
      hashkafaState.didChange(hashkafaValue);
      smokeState.didChange(smokeValue);
    });
//LocaleText.getLocaleText(MyApp.getLocale(), "Female") ;
    if (!form.validate()) {
      showMessage(LocaleText.getLocaleText(MyApp.getLocale(), "Form is not valid!  Please review and correct!"));
    } else {
      //This invokes each onSaved event
      form.save();
      if (widget.update) {
        await personProvider.updatePerson(personProvider.newPerson);
      } else {
        await personProvider.addPerson(personProvider.newPerson);
      }

      Navigator.pop(context);
    }
  }

  PersonProvider personProvider;

  // ShadchanProvider shadchanProvider;

  bool isInit = true;
  bool isLoading = true;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      isInit = false;
      personProvider = Provider.of<PersonProvider>(context);
      print(widget.update);
      if (widget.update == null || !widget.update) {
        personProvider.newPerson = new Person(shadchanID: personProvider.shadchanProvider.myShadchan.id);
      } else {
        personHeight = personProvider.newPerson.height;
        lookingPersonHeightMin = personProvider.newPerson.heightMin;
        lookingPersonHeightMax = personProvider.newPerson.heightMax;
        lookingPersonAgeMin = personProvider.newPerson.ageMin;
        lookingPersonAgeMax = personProvider.newPerson.ageMax;
        rangeValuesAge = RangeValues(personProvider.newPerson.ageMin, personProvider.newPerson.ageMax);
        rangeValues = RangeValues(personProvider.newPerson.heightMin, personProvider.newPerson.heightMax);
      }
      _area = personProvider.newPerson.area;
      _country = personProvider.newPerson.country;
      _religious = personProvider.newPerson.dos;
      _hashkafa = personProvider.newPerson.hashkafa;
      _status = personProvider.newPerson.status;
      _eda = personProvider.newPerson.eda;
      _smoke = personProvider.newPerson.smoke;
      sSelected = personProvider.newPerson.gender;
      areaValue = personProvider.newPerson.area;
      countryValue = personProvider.newPerson.country;
      statusValue = personProvider.newPerson.status;
      religiosValue = personProvider.newPerson.dos;
      hashkafaValue = personProvider.newPerson.hashkafa;
      edaValue = personProvider.newPerson.eda;
      smokeValue = personProvider.newPerson.smoke;

      _controller.text = personProvider.newPerson.birthday != null ? new DateFormat.yMd().format(personProvider.newPerson.birthday) : null;
      setState(() {});
      // shadchanProvider = Provider.of<ShadchanProvider>(context);

    }

    super.didChangeDependencies();
    //getAllPeople()
  }

  Area areaValue;
  var areaState;

  Country countryValue;
  var countryState;

  Status statusValue;
  var statusState;

  Dos religiosValue;
  var religiosState;

  Hashkafa hashkafaValue;
  var hashkafaState;

  Eda edaValue;
  var edaState;

  Smoke smokeValue;
  var smokeState;

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
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTheme.filterBackgroundColor,
      appBar: AppBar(
        title: Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Add a candidate')),
      ),
      body: SizedBox(
          height: double.infinity,
          child: Stepper(
              type: StepperType.horizontal,
              currentStep: _index,
              onStepTapped: (index) {
                setState(() {
                  _index = index;
                });
              },
              onStepCancel: () {
                Navigator.of(context).pop();
              },
              onStepContinue: () {
                if (_index == 0)
                  setState(() {
                    _index++;
                  });
                else if (_index == 1) {
                  _submitForm();
                }
              },
              steps: [
                Step(
                  isActive: _index == 0,
                  title: Text('פרטי מועמד'),
                  content: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            autovalidate: false,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Align(
                                    //       alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft, child: Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Add at least one image!'))),
                                    // ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          child: PhotoPickerFlat(
                                            height: 210,
                                            imageUrl: personProvider.newPerson != null && personProvider.newPerson.profileImages != null && personProvider.newPerson.profileImages.length > 0
                                                ? personProvider.newPerson.profileImages[0]
                                                : null,
                                            image: _image1,
                                            imageCallBack: imageCallBack1,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Expanded(
                                          child: Container(
                                            height: 190,
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

                                                    border: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                                    ),
                                                    // icon: const Icon(Icons.person),
                                                    hintStyle: themeTextStyle,
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
                                                    contentPadding: EdgeInsets.all(15),
                                                    border: OutlineInputBorder(
                                                      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                                    ),
                                                    //icon: const Icon(Icons.person),
                                                    hintStyle: themeTextStyle,
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
                                                        border: Border.all(width: sSelected == Gender.MALE ? 2.0 : 1.5, color: sSelected == Gender.MALE ? AppTheme.secondary : AppTheme.primary),
                                                      ),
                                                      child: IconButton(
                                                          icon: FaIcon(FontAwesomeIcons.male),
                                                          color: sSelected == Gender.MALE ? AppTheme.secondary : AppTheme.primary,
                                                          padding: EdgeInsets.all(5.0),
                                                          // alignment: Alignment.centerRight,
                                                          onPressed: () => setState(() {
                                                                sSelected = Gender.MALE;
                                                              })),
                                                    ),
                                                    Text(
                                                      "  Boy",
                                                      style: themeTextStyle,
                                                    ),
                                                    Spacer(),
                                                    Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(50),
                                                        border: Border.all(width: sSelected == Gender.FEMALE ? 2.0 : 1.5, color: sSelected == Gender.FEMALE ? AppTheme.secondary : AppTheme.primary),
                                                      ),
                                                      child: IconButton(
                                                          icon: FaIcon(FontAwesomeIcons.female),
                                                          color: sSelected == Gender.FEMALE ? AppTheme.secondary : AppTheme.primary,
                                                          padding: EdgeInsets.all(5.0),
                                                          //alignment: Alignment.centerRight,
                                                          onPressed: () => setState(() {
                                                                sSelected = Gender.FEMALE;
                                                              })),
                                                    ),
                                                    Text("  Girl", style: themeTextStyle),
                                                  ],
                                                ),
                                                //        Stack(
                                                //   alignment: Alignment.center,
                                                //   children: <Widget>[
                                                //     Container(
                                                //       width: width * 0.3,
                                                //       height: 100,
                                                //       child: Row(
                                                //           children: <Widget>[
                                                //             Expanded(
                                                //               child: GestureDetector(
                                                //                 onTap: () {
                                                //                   print("male");
                                                //                   setState(() {
                                                //                     sSelected = Gender.MALE;
                                                //                   });
                                                //                   personProvider.newPerson.gender = Gender.MALE;
                                                //                 },
                                                //                 child: Container(
                                                //                   color: Colors.transparent,
                                                //                 ),
                                                //               ),
                                                //             ),
                                                //             Expanded(
                                                //               child: GestureDetector(
                                                //                   onTap: () {
                                                //                     print("female");
                                                //                     setState(() {
                                                //                       sSelected = Gender.FEMALE;
                                                //                     });
                                                //                     personProvider.newPerson.gender = Gender.FEMALE;
                                                //                   },
                                                //                   child: Container(
                                                //                     color: Colors.transparent,
                                                //                   )),
                                                //             )
                                                //           ],
                                                //       ),
                                                //     ),
                                                //     IgnorePointer(
                                                //       ignoring: true,
                                                //       child: Container(
                                                //           width: width * 0.3,
                                                //           child: sSelected == Gender.FEMALE ? Image.asset("assets/images/girlpressed.png") : Image.asset("assets/images/boy_pressed.png"),
                                                //       ),
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 20,
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    //   children: <Widget>[
                                    //     // PhotoPicker(
                                    //     //   imageUrl: personProvider.newPerson != null && personProvider.newPerson.profileImages != null && personProvider.newPerson.profileImages.length > 1
                                    //     //       ? personProvider.newPerson.profileImages[0]
                                    //     //       : null,
                                    //     //   image: _image2,
                                    //     //   imageCallBack: imageCallBack2,
                                    //     //   photoNum: 2,
                                    //     //   small: true,
                                    //     // ),
                                    //     PhotoPicker(
                                    //       imageUrl: personProvider.newPerson != null && personProvider.newPerson.profileImages != null && personProvider.newPerson.profileImages.length > 2
                                    //           ? personProvider.newPerson.profileImages[0]
                                    //           : null,
                                    //       image: _image3,
                                    //       imageCallBack: imageCallBack3,
                                    //       photoNum: 3,
                                    //       small: true,
                                    //     ),
                                    //     PhotoPicker(
                                    //       imageUrl: personProvider.newPerson != null && personProvider.newPerson.profileImages != null && personProvider.newPerson.profileImages.length > 3
                                    //           ? personProvider.newPerson.profileImages[0]
                                    //           : null,
                                    //       image: _image4,
                                    //       imageCallBack: imageCallBack4,
                                    //       photoNum: 4,
                                    //       small: true,
                                    //     ),
                                    //   ],
                                    // ),
                                    // SizedBox(
                                    //   height: 40,
                                    // )
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range,
                                      size: 25.0,
                                      color: Colors.white,
                                    ),
                                    title(LocaleText.getLocaleText(MyApp.getLocale(), 'Date of Birth')),
                                  ],
                                ),
                                FlatButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0), side: BorderSide(color: AppTheme.primary)),
                                  color: Colors.black12,
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext builder) {
                                          return Container(
                                            height: MediaQuery.of(context).copyWith().size.height / 2.8,
                                            child: DatePickerWidget(),
                                          );
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
                                              " 18-02-2020",
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

                                //BIRTH DAY
                                // new Row(children: <Widget>[
                                //   new Expanded(
                                //       child: new TextFormField(
                                //     decoration: new InputDecoration(
                                //       icon: const Icon(Icons.calendar_today),
                                //       hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'Please enter a valid date'),
                                //       labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Date of Birth'),
                                //     ),
                                //     controller: _controller,
                                //     keyboardType: TextInputType.datetime,
                                //     validator: (val) {
                                //       if (isValidDob(val)) return null;
                                //       return LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                                //     },
                                //     onSaved: (val) => personProvider.newPerson.birthday = convertToDate(val),
                                //   )),
                                //   new IconButton(
                                //     icon: new Icon(Icons.more_horiz),
                                //     tooltip: LocaleText.getLocaleText(MyApp.getLocale(), 'choose date'),
                                //     onPressed: (() async {
                                //       await _chooseDate(context, _controller.text);
                                //     }),
                                //   )
                                // ]),
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
                                    countryState = state;
                                    return SelectChip(Country.values, (country) => _country = country, pickedValue: _country);
                                  },
                                  validator: (val) {
                                    return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                //Country
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
                                if (countryValue == Country.ISRAEL)
                                  new FormField<Area>(
                                    builder: (FormFieldState<Area> state) {
                                      areaState = state;
                                      return SelectChip(Area.values, (area) => _area = area, pickedValue: _area);
                                    },
                                    validator: (val) {
                                      return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
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
                                    statusState = state;
                                    return SelectChip(Status.values, (status) => _status = status, pickedValue: _status);
                                  },
                                  validator: (val) {
                                    return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                                  },
                                ),
                                //RELIGIOUS
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    FaIcon(
                                      FontAwesomeIcons.pray,
                                      size: 25.0,
                                      color: Colors.white,
                                    ),
                                    title(LocaleText.getLocaleText(MyApp.getLocale(), 'Religious')),
                                  ],
                                ),
                                new FormField<Dos>(
                                  builder: (FormFieldState<Dos> state) {
                                    religiosState = state;
                                    return SelectChip(Dos.values, (val) => _religious = val, pickedValue: _religious);
                                  },
                                  validator: (val) {
                                    return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                                  },
                                ),
                                //HASHKAFA
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
                                    title(LocaleText.getLocaleText(MyApp.getLocale(), 'Hashkafa')),
                                  ],
                                ),
                                new FormField<Hashkafa>(
                                  builder: (FormFieldState<Hashkafa> state) {
                                    hashkafaState = state;
                                    return SelectChip(Hashkafa.values, (val) => _hashkafa = val, pickedValue: _hashkafa);
                                  },
                                  validator: (val) {
                                    return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                                  },
                                ),
                                //EDA
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
                                    title(LocaleText.getLocaleText(MyApp.getLocale(), 'Eda')),
                                  ],
                                ),
                                new FormField<Eda>(
                                  builder: (FormFieldState<Eda> state) {
                                    edaState = state;
                                    return SelectChip(Eda.values, (val) => _eda = val, pickedValue: _eda);
                                  },
                                  validator: (val) {
                                    return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
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
                                    smokeState = state;
                                    return SelectChip(Smoke.values, (val) => _smoke = val, pickedValue: _smoke);
                                  },
                                  validator: (val) {
                                    return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
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
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                    ),
                                    //icon: const Icon(Icons.short_text),
                                    hintStyle: TextStyle(color: AppTheme.primary),
                                                    labelStyle: themeTextStyle,
                                    hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them short'),
                                    labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them short'),
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
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                    ),
                                    //icon: const Icon(Icons.format_align_justify),
                                    hintStyle: TextStyle(color: AppTheme.primary),
                                                    labelStyle: themeTextStyle,
                                    hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them long'),
                                    labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them long'),
                                  ),
                                  // inputFormatters: [
                                  //   new LengthLimitingTextInputFormatter(500)
                                  // ],
                                  validator: (val) => val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') : null,
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
                                  MultiSelectChip(SherutGirl.values, (val) => print(val)),
                                // Container(
                                //   child: Column(
                                //     children: <Widget>[

                                //       CheckboxGroup(
                                //         checked: personProvider.newPerson != null && personProvider.newPerson.mySherutGirl != null
                                //             ? personProvider.newPerson.mySherutGirl.map((e) => StaticFunctions.getSherutGirl(e)).toList()
                                //             : null,
                                //         labels: SherutGirl.values.map((e) => StaticFunctions.getSherutGirl(e)).toList(),
                                //         onChange: (bool isChecked, String label, int index) {
                                //           if (isChecked) {
                                //             if (personProvider.newPerson.mySherutGirl == null) {
                                //               personProvider.newPerson.mySherutGirl = [];
                                //             }
                                //             personProvider.newPerson.mySherutGirl.add(SherutGirl.values[index]);
                                //           } else {
                                //             personProvider.newPerson.mySherutGirl.remove(SherutGirl.values[index]);
                                //           }
                                //           print("isChecked: $isChecked   label: $label  index: $index");
                                //           setState(() {});
                                //         },
                                //         onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                                //       ),
                                //       SizedBox(
                                //         height: 20,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                if (sSelected == Gender.MALE)
                                  MultiSelectChip(SherutBoy.values, (val) => print(val)),
                                // Container(
                                //   child: Column(
                                //     children: <Widget>[
                                //       CheckboxGroup(
                                //         checked: personProvider.newPerson != null && personProvider.newPerson.mySherutBoy != null
                                //             ? personProvider.newPerson.mySherutBoy.map((e) => StaticFunctions.getSherutBoy(e)).toList()
                                //             : null,
                                //         labels: SherutBoy.values.map((e) => StaticFunctions.getSherutBoy(e)).toList(),
                                //         onChange: (bool isChecked, String label, int index) {
                                //           if (isChecked) {
                                //             if (personProvider.newPerson.mySherutBoy == null) {
                                //               personProvider.newPerson.mySherutBoy = [];
                                //             }
                                //             personProvider.newPerson.mySherutBoy.add(SherutBoy.values[index]);
                                //           } else {
                                //             personProvider.newPerson.mySherutBoy.remove(SherutBoy.values[index]);
                                //           }
                                //           print("isChecked: $isChecked   label: $label  index: $index");
                                //           setState(() {});
                                //         },
                                //         onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                                //       ),
                                //       SizedBox(
                                //         height: 20,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Step(
                  isActive: _index == 1,
                  title: Text('הצד השני'),
                  content: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            autovalidate: false,
                            child: new Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.only(top: 14.0),
                                  child: Text(
                                    LocaleText.getLocaleText(MyApp.getLocale(), 'What are they looking for?'),
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                  ),
                                ),
                                Align(
                                  alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 14.0),
                                    child: Text(
                                      LocaleText.getLocaleText(MyApp.getLocale(), 'Country'),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                    ),
                                  ),
                                ),
                                CheckboxGroup(
                                  checked: personProvider.newPerson != null && personProvider.newPerson.countrys != null
                                      ? personProvider.newPerson.countrys.map((e) => StaticFunctions.getCountry(e)).toList()
                                      : null,
                                  labels: Country.values.map((e) => StaticFunctions.getCountry(e)).toList(),
                                  onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                      if (personProvider.newPerson.countrys == null) {
                                        personProvider.newPerson.countrys = [];
                                      }
                                      personProvider.newPerson.countrys.add(Country.values[index]);
                                    } else {
                                      personProvider.newPerson.countrys.remove(Country.values[index]);
                                    }
                                    print("isChecked: $isChecked   label: $label  index: $index");
                                    setState(() {});
                                  },
                                  onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                if (personProvider.newPerson.countrys != null && personProvider.newPerson.countrys.contains(Country.ISRAEL))
                                  Align(
                                    alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 14.0),
                                      child: Text(
                                        LocaleText.getLocaleText(MyApp.getLocale(), 'Area'),
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                      ),
                                    ),
                                  ),
                                if (personProvider.newPerson.countrys != null && personProvider.newPerson.countrys.contains(Country.ISRAEL))
                                  CheckboxGroup(
                                    checked: personProvider.newPerson != null && personProvider.newPerson.areas != null
                                        ? personProvider.newPerson.areas.map((e) => StaticFunctions.getArea(e)).toList()
                                        : null,
                                    labels: Area.values.map((e) => StaticFunctions.getArea(e)).toList(),
                                    onChange: (bool isChecked, String label, int index) {
                                      if (isChecked) {
                                        if (personProvider.newPerson.areas == null) {
                                          personProvider.newPerson.areas = [];
                                        }
                                        personProvider.newPerson.areas.add(Area.values[index]);
                                      } else {
                                        personProvider.newPerson.areas.remove(Area.values[index]);
                                      }
                                      print("isChecked: $isChecked   label: $label  index: $index");
                                      setState(() {});
                                    },
                                    onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                                  ),
                                if (personProvider.newPerson.countrys != null && personProvider.newPerson.countrys.contains(Country.ISRAEL))
                                  SizedBox(
                                    height: 20,
                                  ),
                                Align(
                                  alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 14.0),
                                    child: Text(
                                      LocaleText.getLocaleText(MyApp.getLocale(), 'Status'),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                    ),
                                  ),
                                ),
                                CheckboxGroup(
                                  checked: personProvider.newPerson != null && personProvider.newPerson.statuses != null
                                      ? personProvider.newPerson.statuses.map((e) => StaticFunctions.getStatus(e)).toList()
                                      : null,
                                  labels: Status.values.map((e) => StaticFunctions.getStatus(e)).toList(),
                                  onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                      if (personProvider.newPerson.statuses == null) {
                                        personProvider.newPerson.statuses = [];
                                      }
                                      personProvider.newPerson.statuses.add(Status.values[index]);
                                    } else {
                                      personProvider.newPerson.statuses.remove(Status.values[index]);
                                    }
                                    print("isChecked: $isChecked   label: $label  index: $index");
                                    setState(() {});
                                  },
                                  onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 14.0),
                                    child: Text(
                                      LocaleText.getLocaleText(MyApp.getLocale(), 'Religious'),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                    ),
                                  ),
                                ),
                                CheckboxGroup(
                                  checked:
                                      personProvider.newPerson != null && personProvider.newPerson.doses != null ? personProvider.newPerson.doses.map((e) => StaticFunctions.getDos(e)).toList() : null,
                                  labels: Dos.values.map((e) => StaticFunctions.getDos(e)).toList(),
                                  onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                      if (personProvider.newPerson.doses == null) {
                                        personProvider.newPerson.doses = [];
                                      }
                                      personProvider.newPerson.doses.add(Dos.values[index]);
                                    } else {
                                      personProvider.newPerson.doses.remove(Dos.values[index]);
                                    }
                                    print("isChecked: $isChecked   label: $label  index: $index");
                                    setState(() {});
                                  },
                                  onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 14.0),
                                    child: Text(
                                      LocaleText.getLocaleText(MyApp.getLocale(), 'Hashkafa'),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                    ),
                                  ),
                                ),
                                CheckboxGroup(
                                  checked: personProvider.newPerson != null && personProvider.newPerson.hashkafas != null
                                      ? personProvider.newPerson.hashkafas.map((e) => StaticFunctions.getHashkafa(e)).toList()
                                      : null,
                                  labels: Hashkafa.values.map((e) => StaticFunctions.getHashkafa(e)).toList(),
                                  onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                      if (personProvider.newPerson.hashkafas == null) {
                                        personProvider.newPerson.hashkafas = [];
                                      }
                                      personProvider.newPerson.hashkafas.add(Hashkafa.values[index]);
                                    } else {
                                      personProvider.newPerson.hashkafas.remove(Hashkafa.values[index]);
                                    }
                                    print("isChecked: $isChecked   label: $label  index: $index");
                                    setState(() {});
                                  },
                                  onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 14.0),
                                    child: Text(
                                      LocaleText.getLocaleText(MyApp.getLocale(), 'Eda'),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                    ),
                                  ),
                                ),
                                CheckboxGroup(
                                  checked:
                                      personProvider.newPerson != null && personProvider.newPerson.edas != null ? personProvider.newPerson.edas.map((e) => StaticFunctions.getEda(e)).toList() : null,
                                  labels: Eda.values.map((e) => StaticFunctions.getEda(e)).toList(),
                                  onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                      if (personProvider.newPerson.edas == null) {
                                        personProvider.newPerson.edas = [];
                                      }
                                      personProvider.newPerson.edas.add(Eda.values[index]);
                                    } else {
                                      personProvider.newPerson.edas.remove(Eda.values[index]);
                                    }
                                    print("isChecked: $isChecked   label: $label  index: $index");
                                    setState(() {});
                                  },
                                  onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 14.0),
                                    child: Text(
                                      LocaleText.getLocaleText(MyApp.getLocale(), 'Smoking'),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                    ),
                                  ),
                                ),
                                CheckboxGroup(
                                  checked: personProvider.newPerson != null && personProvider.newPerson.smoking != null
                                      ? personProvider.newPerson.smoking.map((e) => StaticFunctions.getSmoke(e)).toList()
                                      : null,
                                  labels: Smoke.values.map((e) => StaticFunctions.getSmoke(e)).toList(),
                                  onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                      if (personProvider.newPerson.smoking == null) {
                                        personProvider.newPerson.smoking = [];
                                      }
                                      personProvider.newPerson.smoking.add(Smoke.values[index]);
                                    } else {
                                      personProvider.newPerson.smoking.remove(Smoke.values[index]);
                                    }
                                    print("isChecked: $isChecked   label: $label  index: $index");
                                    setState(() {});
                                  },
                                  onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                if (sSelected == Gender.MALE)
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Align(
                                          alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                          child: Container(
                                            padding: const EdgeInsets.only(top: 14.0),
                                            child: Text(
                                              LocaleText.getLocaleText(MyApp.getLocale(), 'Sherut'),
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                            ),
                                          ),
                                        ),
                                        CheckboxGroup(
                                          checked: personProvider.newPerson != null && personProvider.newPerson.thereSherutGirl != null
                                              ? personProvider.newPerson.thereSherutGirl.map((e) => StaticFunctions.getSherutGirl(e)).toList()
                                              : null,
                                          labels: SherutGirl.values.map((e) => StaticFunctions.getSherutGirl(e)).toList(),
                                          onChange: (bool isChecked, String label, int index) {
                                            if (isChecked) {
                                              if (personProvider.newPerson.thereSherutGirl == null) {
                                                personProvider.newPerson.thereSherutGirl = [];
                                              }
                                              personProvider.newPerson.thereSherutGirl.add(SherutGirl.values[index]);
                                            } else {
                                              personProvider.newPerson.thereSherutGirl.remove(SherutGirl.values[index]);
                                            }
                                            print("isChecked: $isChecked   label: $label  index: $index");
                                            setState(() {});
                                          },
                                          onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                if (sSelected == Gender.FEMALE)
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Align(
                                          alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                          child: Container(
                                            padding: const EdgeInsets.only(top: 14.0),
                                            child: Text(
                                              LocaleText.getLocaleText(MyApp.getLocale(), 'Sherut'),
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                            ),
                                          ),
                                        ),
                                        CheckboxGroup(
                                          checked: personProvider.newPerson != null && personProvider.newPerson.thereSherutBoy != null
                                              ? personProvider.newPerson.thereSherutBoy.map((e) => StaticFunctions.getSherutBoy(e)).toList()
                                              : null,
                                          labels: SherutBoy.values.map((e) => StaticFunctions.getSherutBoy(e)).toList(),
                                          onChange: (bool isChecked, String label, int index) {
                                            if (isChecked) {
                                              if (personProvider.newPerson.thereSherutBoy == null) {
                                                personProvider.newPerson.thereSherutBoy = [];
                                              }
                                              personProvider.newPerson.thereSherutBoy.add(SherutBoy.values[index]);
                                            } else {
                                              personProvider.newPerson.thereSherutBoy.remove(SherutBoy.values[index]);
                                            }
                                            print("isChecked: $isChecked   label: $label  index: $index");
                                            setState(() {});
                                          },
                                          onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                        child: Container(
                                          padding: const EdgeInsets.only(top: 14.0),
                                          child: Text(
                                            LocaleText.getLocaleText(MyApp.getLocale(), 'Height'),
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "" + lookingPersonHeightMin.toStringAsFixed(2) + " " + LocaleText.getLocaleText(MyApp.getLocale(), 'm'),
                                          ),
                                          Expanded(
                                            child: RangeSlider(
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
                                          Text("" + lookingPersonHeightMax.toStringAsFixed(2) + " " + LocaleText.getLocaleText(MyApp.getLocale(), 'm'))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                        child: Container(
                                          padding: const EdgeInsets.only(top: 14.0),
                                          child: Text(
                                            LocaleText.getLocaleText(MyApp.getLocale(), 'Age'),
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "" + lookingPersonAgeMin.toStringAsFixed(1),
                                          ),
                                          Expanded(
                                            child: RangeSlider(
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
                                          Text("" + lookingPersonAgeMax.toStringAsFixed(1))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                new TextFormField(
                                  initialValue: personProvider.newPerson != null && personProvider.newPerson.moreInfo != null ? personProvider.newPerson.moreInfo : "",
                                  maxLines: null,
                                  onChanged: (value) {
                                    personProvider.newPerson.moreInfo = value;
                                  },
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.wb_sunny),
                                    hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'More info'),
                                    labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'More info'),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ])),
    );
  }
}
