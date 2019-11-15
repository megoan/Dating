import 'dart:collection';
import 'dart:io';

import 'package:dating/providers/langText.dart';
import 'package:dating/themes/lightTheme.dart';
import 'package:dating/widgets/DateText.dart';
import 'package:dating/widgets/photoPicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import '../main.dart';

class Contact {
  String fName;
  String lName;
  DateTime dob;
  String name;
  String phone = '';
  String email = '';
  String aboutMeShort = '';
  String aboutMeLong = '';
  String favoriteColor = '';
  String area = '';
  String religious = '';
  String hashkafa = '';
  String smoke = '';
  String eda = '';
  String status = '';
  String body = '';
}

class AddPerson extends StatefulWidget {
  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Contact newContact = new Contact();
  List<String> _areas = <String>['', 'גוש דן והמרכז' , 'השרון והסביבה', 'ירושלים והסביבה','באר שבע והדרום','חיפה והצפון','חו"ל'];
  //List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  List<String> _howReligios = <String>['', 'מסורתי', 'לייט', 'רגיל', 'מאוד','דוס'];
  List<String> _whatHashkafa = <String>['', 'לאומי', 'חרדי', 'חבד', 'ברסלב','חוזר בתשובה','יהודי'];
  List<String> _statuses = <String>['', 'רווק', 'אלמן', 'גרוש'];
  List<String> _edas = <String>['', 'אשכנזי', 'ספרדי', 'תימני', 'אתיופי','צרפתי','מעורב'];
  List<String> _smokes = <String>['', 'לא מעשן', 'מעשן', 'לפעמים', 'משתדל להפסיק'];

  List<String> _FemaleSheruts = <String>[ 'צבא', 'מכינה','שנה שירות', 'שנתיים שירות', 'מדרשה','שליחות','גורנישט'];
  List<String> _MaleSheruts = <String>[ 'צבא קרבי', "צבא ג'וב", 'מכינה', 'הסדר','גבוהה','שירות לאומי','שליחות','גורנישט'];

  String _color = '';
  String _area = '';
  String _religious = '';
  String _hashkafa = '';
  String _status = '';
  String _eda = '';
  String _smoke = '';
  String _FemaleSherut;
  String _MaleSherut;

  double personHeight = 1.5;
  double lookingPersonHeightMin = 1.4;
  double lookingPersonHeightMax = 1.85;

   double personAge = 23;
  double lookingPersonAgeMin = 18;
  double lookingPersonAgeMax = 99;

  String myHeight = "";
  String hisHeight1 = "";
  String hisHeight2 = "";
  RangeValues rangeValues = RangeValues(1, 2.3);
  RangeLabels rangeLabels = RangeLabels('1','2.3');

  RangeValues rangeValuesAge = RangeValues(18, 99);
  RangeLabels rangeLabelsAge = RangeLabels('18','99');
  String sSelected = LocaleText.getLocaleText(MyApp.getLocale(), "Female") ;
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
    initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

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
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;

    setState(() {
      areaState.didChange(areaValue);
      statusState.didChange(statusValue);
      religiosState.didChange(religiosValue);
      edaState.didChange(edaValue);
      hashkafaState.didChange(hashkafaValue);
      smokeState.didChange(smokeValue);
    });
//LocaleText.getLocaleText(MyApp.getLocale(), "Female") ;
    if (!form.validate()) {
      showMessage(LocaleText.getLocaleText(MyApp.getLocale(), "Form is not valid!  Please review and correct!") );
    } else {
      form.save(); //This invokes each onSaved event

      print('Form save called, newContact is now up to date...');
      print('First Name: ${newContact.fName}');
      print('Last Name: ${newContact.lName}');
      print('Dob: ${newContact.dob}');
      print('Phone: ${newContact.phone}');
      print('Email: ${newContact.email}');
      print('Favorite Color: ${newContact.favoriteColor}');
      print('========================================');
      print('Submitting to back end...');
      print('TODO - we will write the submission part next...');
    }
  }

  String areaValue = "";
  var areaState;

  String statusValue = "";
  var statusState;

  String religiosValue = "";
  var religiosState;

  String hashkafaValue = "";
  var hashkafaState;

  String edaValue = "";
  var edaState;

  String smokeValue = "";
  var smokeState;

  TextFormField tff;
  Map map1 = new Map();
  List lll = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Add a candidate') ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
             // Align(
               // alignment: Alignment.topLeft,
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    LocaleText.getLocaleText(MyApp.getLocale(), 'Required fields') ,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
             // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  autovalidate: true,
                  child: new Column(
                    children: <Widget>[
                      RadioButtonGroup(orientation: GroupedButtonsOrientation.HORIZONTAL,
                    
  labels: <String>[
      LocaleText.getLocaleText(MyApp.getLocale(), 'Female'),
      LocaleText.getLocaleText(MyApp.getLocale(), 'Male'),
  ],
  picked:sSelected ,
  onSelected: (String selected) {
    setState(() {
      sSelected = selected;
    });
  }
),
                      //FIRST NAME
                      new TextFormField(
                        decoration:  InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'Plony'),
                          labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'First name'),
                        ),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(30)
                        ],
                        validator: (val) =>
                            val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') : null,
                        onSaved: (val) => newContact.fName = val,
                      ),
                      //LAST NAME
                      new TextFormField(
                        decoration:  InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'Almony'),
                          labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Last name'),
                        ),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(30)
                        ],
                        validator: (val) =>
                            val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required')  : null,
                        onSaved: (val) => newContact.lName = val,
                      ),
                      //BIRTH DAY
                      new Row(children: <Widget>[
                        new Expanded(
                            child: new TextFormField(
                          decoration: new InputDecoration(
                            icon: const Icon(Icons.calendar_today),
                            hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'Please enter a valid date'),
                            labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Date of Birth'),
                          ),
                          controller: _controller,
                          keyboardType: TextInputType.datetime,
                          validator: (val) {
                            if (isValidDob(val)) return null;
                            return LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') ;
                          },
                          onSaved: (val) => newContact.dob = convertToDate(val),
                        )),
                        new IconButton(
                          icon: new Icon(Icons.more_horiz),
                          tooltip: LocaleText.getLocaleText(MyApp.getLocale(), 'choose date'),
                          onPressed: (() async {
                            await _chooseDate(context, _controller.text);
                          }),
                        )
                      ]),
                      //AREA
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          areaState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.location_on),
                              labelText:  LocaleText.getLocaleText(MyApp.getLocale(), 'Area'),
                              errorText:
                                  state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _area == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                value: _area,
                                isDense: true,
                                onChanged: (String newValue) {
                                  // map1["date"]= {newValue.toString():state};
                                  //lll.add(state);
                                  areaValue = newValue;
                                  map1.putIfAbsent(newValue, () => state);
                                  setState(() {
                                    newContact.area = newValue;
                                    _area = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _areas.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != '' ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') ;
                        },
                      ),
                      //STATUS
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          statusState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.people),
                              labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Status'),
                              errorText:
                                  state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _status == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                value: _status,
                                isDense: true,
                                onChanged: (String newValue) {
                                  statusValue = newValue;
                                  setState(() {
                                    newContact.status = newValue;
                                    _status = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _statuses.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != '' ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') ;
                        },
                      ),
                      //RELIGIOUS
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          religiosState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.call_split),
                              labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Religious'),
                              errorText:
                                  state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _religious == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                value: _religious,
                                isDense: true,
                                onChanged: (String newValue) {
                                  religiosValue = newValue;
                                  setState(() {
                                    newContact.status = newValue;
                                    _religious = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _howReligios.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != ''
                              ? null
                              : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') ;
                        },
                      ),
                      //HASHKAFA
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          hashkafaState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.group_work),
                              labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Hashkafa'),
                              errorText:
                                  state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _hashkafa == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                value: _hashkafa,
                                isDense: true,
                                onChanged: (String newValue) {
                                  hashkafaValue = newValue;
                                  setState(() {
                                    newContact.status = newValue;
                                    _hashkafa = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _whatHashkafa.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != ''
                              ? null
                              : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') ;
                        },
                      ),
                      //EDA
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          edaState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.fastfood),
                              labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Eda'),
                              errorText:
                                  state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _eda == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                value: _eda,
                                isDense: true,
                                onChanged: (String newValue) {
                                  edaValue = newValue;
                                  setState(() {
                                    newContact.status = newValue;
                                    _eda = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _edas.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != '' ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') ;
                        },
                      ),
                      //SMOKE
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          smokeState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.smoke_free),
                              labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Smoking'),
                              errorText:
                                  state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _smoke == '',
                            child: new DropdownButtonHideUnderline(
                              child: new DropdownButton<String>(
                                value: _smoke,
                                isDense: true,
                                onChanged: (String newValue) {
                                  smokeValue = newValue;
                                  setState(() {
                                    newContact.status = newValue;
                                    _smoke = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                items: _smokes.map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != '' ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') ;
                        },
                      ),

                      //ABOUT ME SHORT
                      new TextFormField(
                        maxLines: null,
                        maxLength: 70,
                        decoration:  InputDecoration(
                          icon: const Icon(Icons.short_text),
                          hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them short'),
                          labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them short'),
                        ),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(70)
                        ],
                        validator: (val) =>
                            val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required')  : null,
                        onSaved: (val) => newContact.aboutMeShort = val,
                      ),
                      //ABOUT ME LONG
                      new TextFormField(
                        maxLines: null,
                        decoration:  InputDecoration(
                          icon: const Icon(Icons.format_align_justify),
                          hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them long'),
                          labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them long'),
                        ),
                        // inputFormatters: [
                        //   new LengthLimitingTextInputFormatter(500)
                        // ],
                        validator: (val) =>
                            val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required')  : null,
                        onSaved: (val) => newContact.aboutMeLong = val,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Height'),),
                            Expanded(
                              child: Slider(
                                min: 1.0,
                                max: 2.3,
                                divisions: 130,
                                label: "" + personHeight.toStringAsFixed(2),
                                value: personHeight,
                                onChanged: ((newValue) {
                                  setState(() {
                                    personHeight = newValue;
                                  });
                                }),
                              ),
                            ),
                            Text("" + personHeight.toStringAsFixed(2) +" " + LocaleText.getLocaleText(MyApp.getLocale(), 'm'),)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                        if(sSelected==LocaleText.getLocaleText(MyApp.getLocale(), 'Female'))  Container(
                        child: Column(
                          children: <Widget>[
                            // MyApp.getLocale()=="he"? const Alignment.topLeft:const Alignment.topRight,
                              Align(
                        alignment: MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                              child: Container(
                          padding: const EdgeInsets.only( top: 14.0),
                          child: Text(
                            LocaleText.getLocaleText(MyApp.getLocale(), 'Sherut'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels: _FemaleSheruts,
                  
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List<String> checked) =>
                            print("checked: ${checked.toString()}"),
                      ),
                      SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    if(sSelected==LocaleText.getLocaleText(MyApp.getLocale(), 'Male'))  Container(
                        child: Column(
                          children: <Widget>[
                              Align(
                        alignment: MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                              child: Container(
                          padding: const EdgeInsets.only( top: 14.0),
                          child: Text(
                            LocaleText.getLocaleText(MyApp.getLocale(), 'Sherut'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels: _MaleSheruts,
                  
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List<String> checked) =>
                            print("checked: ${checked.toString()}"),
                      ),
                      SizedBox(height: 20,),
                          ],
                        ),
                      ),
                        
                     
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                            child: Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Add at least one image!'))),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: PhotoPicker(
                          image: _image1,
                          imageCallBack: imageCallBack1,
                          photoNum: 1,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          PhotoPicker(
                            image: _image2,
                            imageCallBack: imageCallBack2,
                            photoNum: 2,
                            small: true,
                          ),
                          PhotoPicker(
                            image: _image3,
                            imageCallBack: imageCallBack3,
                            photoNum: 3,
                            small: true,
                          ),
                          PhotoPicker(
                            image: _image4,
                            imageCallBack: imageCallBack4,
                            photoNum: 4,
                            small: true,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Text(
                      //       "Optional Fields - only viewed by you",
                      //       style: TextStyle(
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.bold,
                      //           color: Colors.grey[600]),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // //PHONE NUMBER
                      // TextFormField(
                      //   decoration: const InputDecoration(
                      //     icon: const Icon(Icons.phone),
                      //     hintText: 'Enter a phone number',
                      //     labelText: 'Phone',
                      //   ),
                      //   keyboardType: TextInputType.phone,
                      //   inputFormatters: [
                      //     new WhitelistingTextInputFormatter(
                      //         new RegExp(r'^[()\d -]{1,15}$')),
                      //   ],
                      //   validator: (value) => isValidPhoneNumber(value)
                      //       ? null
                      //       : 'Phone number must be entered as (###)###-####',
                      //   onSaved: (val) => newContact.phone = val,
                      // ),
                      // //EMAIL ADDRESS
                      // new TextFormField(
                      //   decoration: const InputDecoration(
                      //     icon: const Icon(Icons.email),
                      //     hintText: 'Enter a email address',
                      //     labelText: 'Email',
                      //   ),
                      //   keyboardType: TextInputType.emailAddress,
                      //   validator: (value) => isValidEmail(value)
                      //       ? null
                      //       : 'Please enter a valid email address',
                      //   onSaved: (val) => newContact.email = val,
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Container(
                        padding: const EdgeInsets.only( top: 14.0),
                        child: Text(
                          LocaleText.getLocaleText(MyApp.getLocale(), 'What are they looking for?'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Align(
                        alignment:  MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                              child: Container(
                          padding: const EdgeInsets.only( top: 14.0),
                          child: Text(
                             LocaleText.getLocaleText(MyApp.getLocale(), 'Area'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels: _areas.skip(1).toList(),
                  
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List<String> checked) =>
                            print("checked: ${checked.toString()}"),
                      ),
                      SizedBox(height: 20,),
                          Align(
                        alignment:  MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                              child: Container(
                          padding: const EdgeInsets.only( top: 14.0),
                          child: Text(
                             LocaleText.getLocaleText(MyApp.getLocale(), 'Status'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels: _statuses.skip(1).toList(),
                  
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List<String> checked) =>
                            print("checked: ${checked.toString()}"),
                      ),
                      SizedBox(height: 20,),
                          Align(
                        alignment: MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                              child: Container(
                          padding: const EdgeInsets.only( top: 14.0),
                          child: Text(
                            LocaleText.getLocaleText(MyApp.getLocale(), 'Religious'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels: _howReligios.skip(1).toList(),
                  
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List<String> checked) =>
                            print("checked: ${checked.toString()}"),
                      ),
                      SizedBox(height: 20,),
                          Align(
                        alignment:  MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                              child: Container(
                          padding: const EdgeInsets.only( top: 14.0),
                          child: Text(
                            LocaleText.getLocaleText(MyApp.getLocale(), 'Hashkafa'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels:_whatHashkafa.skip(1).toList(),
                  
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List<String> checked) =>
                            print("checked: ${checked.toString()}"),
                      ),
                      SizedBox(height: 20,),
                          Align(
                        alignment:  MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                              child: Container(
                          padding: const EdgeInsets.only( top: 14.0),
                          child: Text(
                            LocaleText.getLocaleText(MyApp.getLocale(), 'Eda'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels:_edas.skip(1).toList(),
                  
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List<String> checked) =>
                            print("checked: ${checked.toString()}"),
                      ),
                      SizedBox(height: 20,),
                          Align(
                        alignment: MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                              child: Container(
                          padding: const EdgeInsets.only( top: 14.0),
                          child: Text(
                             LocaleText.getLocaleText(MyApp.getLocale(), 'Smoking'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels: _smokes.skip(1).toList(),
                  
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List<String> checked) =>
                            print("checked: ${checked.toString()}"),
                      ),
                      SizedBox(height: 20,),
                    if(sSelected== LocaleText.getLocaleText(MyApp.getLocale(), 'Male'))  Container(
                        child: Column(
                          children: <Widget>[
                              Align(
                        alignment:  MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                              child: Container(
                          padding: const EdgeInsets.only( top: 14.0),
                          child: Text(
                             LocaleText.getLocaleText(MyApp.getLocale(), 'Sherut'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels: _FemaleSheruts,
                  
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List<String> checked) =>
                            print("checked: ${checked.toString()}"),
                      ),
                      SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    if(sSelected== LocaleText.getLocaleText(MyApp.getLocale(), 'Female'))  Container(
                        child: Column(
                          children: <Widget>[
                              Align(
                        alignment:  MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                              child: Container(
                          padding: const EdgeInsets.only( top: 14.0),
                          child: Text(
                             LocaleText.getLocaleText(MyApp.getLocale(), 'Sherut'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels: _MaleSheruts,
                  
                        onChange: (bool isChecked, String label, int index) =>
                            print(
                                "isChecked: $isChecked   label: $label  index: $index"),
                        onSelected: (List<String> checked) =>
                            print("checked: ${checked.toString()}"),
                      ),
                      SizedBox(height: 20,),
                          ],
                        ),
                      ),
                        
                         Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                             Align(
                               alignment: MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                                            child: Container(
                                  padding: const EdgeInsets.only( top: 14.0),
                                 child: Text( LocaleText.getLocaleText(MyApp.getLocale(), 'Height'), style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14.0),),
                               ),
                             ),
                            Row(
                              children: <Widget>[
                                Text("" + lookingPersonHeightMin.toStringAsFixed(2) + " " + LocaleText.getLocaleText(MyApp.getLocale(), 'm'),),
                                Expanded(
                                  child: RangeSlider(
                                    min: 1.0,
                                    max: 2.3,
                                    divisions: 130,
                                    
                                    labels:rangeLabels,
                                    values: rangeValues,
                                    onChanged: ((newValue) {
                                      setState(() {
                                        rangeValues = newValue;
                                        rangeLabels = RangeLabels(newValue.start.toStringAsFixed(2),newValue.end.toStringAsFixed(2));
                                        lookingPersonHeightMax = newValue.end;
                                        lookingPersonHeightMin = newValue.start;
                                      });
                                    }),
                                  ),
                                ),
                                Text("" + lookingPersonHeightMax.toStringAsFixed(2) + " " +LocaleText.getLocaleText(MyApp.getLocale(), 'm'))
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
                               alignment: MyApp.getLocale()=="he"?  Alignment.topRight: Alignment.topLeft,
                                                            child: Container(
                                  padding: const EdgeInsets.only( top: 14.0),
                                 child: Text( LocaleText.getLocaleText(MyApp.getLocale(), 'Age'), style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14.0),),
                               ),
                             ),
                            Row(
                              children: <Widget>[
                                Text("" + lookingPersonAgeMin.toStringAsFixed(1),),
                                Expanded(
                                  child: RangeSlider(
                                    min: 18,
                                    max: 99,
                                    divisions: 162,
                                    
                                    labels:rangeLabelsAge,
                                    values: rangeValuesAge,
                                    onChanged: ((newValue) {
                                      setState(() {
                                        rangeValuesAge = newValue;
                                        rangeLabelsAge = RangeLabels(newValue.start.toStringAsFixed(1),newValue.end.toStringAsFixed(1));
                                        lookingPersonAgeMax = newValue.end;
                                        lookingPersonAgeMin = newValue.start;
                                      });
                                    }),
                                  ),
                                ),
                                Text("" + lookingPersonAgeMax.toStringAsFixed(1) )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                        new TextField(
                          maxLines: null,
                        decoration:  InputDecoration(
                          icon: const Icon(Icons.wb_sunny),
                          hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'More info'),
                          labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'More info'),
                        ),
                        
                       
                       
                      ),
                      SizedBox(height: 20,),
                      new Container(
                        // padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                        child: new RaisedButton(
                          child: const Text('Submit'),
                          onPressed: _submitForm,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
