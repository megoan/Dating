import 'dart:collection';
import 'dart:io';

import 'package:dating/models/person.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:dating/themes/lightTheme.dart';
import 'package:dating/widgets/DateText.dart';
import 'package:dating/widgets/photoPicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';

import '../main.dart';



class AddPerson extends StatefulWidget {
  @override
  _AddPersonState createState() => _AddPersonState();
}

class _AddPersonState extends State<AddPerson> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  Person person = new Person();

  Area _area;
  Dos _religious;
  Hashkafa _hashkafa;
  Status _status;
  Eda _eda;
  Smoke _smoke;


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
  RangeLabels rangeLabels = RangeLabels('1', '2.3');

  RangeValues rangeValuesAge = RangeValues(18, 99);
  RangeLabels rangeLabelsAge = RangeLabels('18', '99');
  String sSelected = LocaleText.getLocaleText(MyApp.getLocale(), "Female");
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

  void _submitForm()async {
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
      showMessage(LocaleText.getLocaleText(MyApp.getLocale(), "Form is not valid!  Please review and correct!"));
    } else {
      form.save(); //This invokes each onSaved event
    await  personProvider.addPerson(person);
    Navigator.pop(context);
     
    }
  }
   PersonProvider personProvider;

 // ShadchanProvider shadchanProvider;

  bool isInit=true;
  bool isLoading = true;
  @override
  void didChangeDependencies() async{
    if (isInit) {
      isInit=false;
      personProvider = Provider.of<PersonProvider>(context);
     // shadchanProvider = Provider.of<ShadchanProvider>(context);
     
    }
   
    super.didChangeDependencies();
    //getAllPeople()
  }

  Area areaValue;
  var areaState;

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

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Add a candidate')),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              // Align(
              // alignment: Alignment.topLeft,
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Text(
              //     LocaleText.getLocaleText(MyApp.getLocale(), 'Required fields'),
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //   ),
              // ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  autovalidate: false,
                  child: new Column(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          
                          Container(
                            width: width * 0.5,
                            height: 100,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      print("male");
                                      setState(() {
                                        sSelected = LocaleText.getLocaleText(MyApp.getLocale(), 'Male');
                                      });
                                      person.gender=Gender.MALE;
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                         print("female");
                                        setState(() {
                                          sSelected = LocaleText.getLocaleText(MyApp.getLocale(), 'Female');
                                        });
                                        person.gender=Gender.FEMALE;
                                      },
                                      child: Container(
                                         color: Colors.transparent,
                                      )),
                                )
                              ],
                            ),
                          ),
                          IgnorePointer(
                              ignoring: true,
                                                          child: Container(
                              width: width * 0.5,
                              child: sSelected == LocaleText.getLocaleText(MyApp.getLocale(), 'Female') ? Image.asset("assets/images/girlpressed.png") : Image.asset("assets/images/boy_pressed.png"),
                          ),
                            ),
                        ],
                      ),
                    
                      Column(
                        children: <Widget>[
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Align(
                          //       alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft, child: Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Add at least one image!'))),
                          // ),
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
                          )
                        ],
                      ),

                      //FIRST NAME
                      new TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'Plony'),
                          labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'First name'),
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                        validator: (val) => val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') : null,
                        onSaved: (val) => person.firstName = val,
                      ),
                      //LAST NAME
                      new TextFormField(
                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'Almony'),
                          labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Last name'),
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(30)],
                        validator: (val) => val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') : null,
                        onSaved: (val) => person.lastName = val,
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
                            return LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                          },
                          onSaved: (val) => person.birthday = convertToDate(val),
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
                      new FormField<Area>(
                        builder: (FormFieldState<Area> state) {
                          areaState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.location_on),
                              labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Area'),
                              errorText: state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _area == null,
                            child: new DropdownButtonHideUnderline(
                              child: Listener(
                                onPointerDown: (_) => FocusScope.of(context).unfocus(),
                                child: new DropdownButton<Area>(
                                  value: _area,
                                  isDense: true,
                                  onChanged: (Area newValue) {
                                    // map1["date"]= {newValue.toString():state};
                                    //lll.add(state);
                                    areaValue = newValue;
                                    map1.putIfAbsent(newValue, () => state);
                                    setState(() {
                                      person.area = newValue;
                                      _area = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: Area.values.map((Area value) {
                                    return new DropdownMenuItem<Area>(
                                      value: value,
                                      child: new Text(StaticFunctions.getArea(value)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                        },
                      ),
                      //STATUS
                      new FormField<Status>(
                        builder: (FormFieldState<Status> state) {
                          statusState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.people),
                              labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Status'),
                              errorText: state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _status == null,
                            child: new DropdownButtonHideUnderline(
                              child: Listener(
                                onPointerDown: (_) => FocusScope.of(context).unfocus(),
                                child: new DropdownButton<Status>(
                                  value: _status,
                                  isDense: true,
                                  onChanged: (Status newValue) {
                                    statusValue = newValue;
                                    setState(() {
                                      person.status = newValue;
                                      _status = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: Status.values.map((Status value) {
                                    return new DropdownMenuItem<Status>(
                                      value: value,
                                      child: new Text(StaticFunctions.getStatus(value)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                        },
                      ),
                      //RELIGIOUS
                      new FormField<Dos>(
                        builder: (FormFieldState<Dos> state) {
                          religiosState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.call_split),
                              labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Religious'),
                              errorText: state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _religious == null,
                            child: new DropdownButtonHideUnderline(
                              child: Listener(
                                onPointerDown: (_) => FocusScope.of(context).unfocus(),
                                child: new DropdownButton<Dos>(
                                  value: _religious,
                                  isDense: true,
                                  onChanged: (Dos newValue) {
                                    religiosValue = newValue;
                                    setState(() {
                                      person.dos = newValue;
                                      _religious = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: Dos.values.map((Dos value) {
                                    return new DropdownMenuItem<Dos>(
                                      value: value,
                                      child: new Text(StaticFunctions.getDos(value)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                        },
                      ),
                      //HASHKAFA
                      new FormField<Hashkafa>(
                        builder: (FormFieldState<Hashkafa> state) {
                          hashkafaState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.group_work),
                              labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Hashkafa'),
                              errorText: state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _hashkafa == null,
                            child: new DropdownButtonHideUnderline(
                              child: Listener(
                                onPointerDown: (_) => FocusScope.of(context).unfocus(),
                                child: new DropdownButton<Hashkafa>(
                                  value: _hashkafa,
                                  isDense: true,
                                  onChanged: (Hashkafa newValue) {
                                    hashkafaValue = newValue;
                                    setState(() {
                                      person.hashkafa = newValue;
                                      _hashkafa = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: Hashkafa.values.map((Hashkafa value) {
                                    return new DropdownMenuItem<Hashkafa>(
                                      value: value,
                                      child: new Text(StaticFunctions.getHashkafa(value)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                        },
                      ),
                      //EDA
                      new FormField<Eda>(
                        builder: (FormFieldState<Eda> state) {
                          edaState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.fastfood),
                              labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Eda'),
                              errorText: state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _eda == null,
                            child: new DropdownButtonHideUnderline(
                              child: Listener(
                                onPointerDown: (_) => FocusScope.of(context).unfocus(),
                                child: new DropdownButton<Eda>(
                                  value: _eda,
                                  isDense: true,
                                  onChanged: (Eda newValue) {
                                    edaValue = newValue;
                                    setState(() {
                                      person.eda = newValue;
                                      _eda = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: Eda.values.map((Eda value) {
                                    return new DropdownMenuItem<Eda>(
                                      value: value,
                                      child: new Text(StaticFunctions.getEda(value)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                        },
                      ),
                      //SMOKE
                      new FormField<Smoke>(
                        builder: (FormFieldState<Smoke> state) {
                          smokeState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.smoke_free),
                              labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Smoking'),
                              errorText: state.hasError ? state.errorText : null,
                            ),
                            isEmpty: _smoke == null,
                            child: new DropdownButtonHideUnderline(
                              child: Listener(
                                onPointerDown: (_) => FocusScope.of(context).unfocus(),
                                child: new DropdownButton<Smoke>(
                                  value: _smoke,
                                  isDense: true,
                                  onChanged: (Smoke newValue) {
                                    smokeValue = newValue;
                                    setState(() {
                                      person.smoke = newValue;
                                      _smoke = newValue;
                                      state.didChange(newValue);
                                    });
                                  },
                                  items: Smoke.values.map((Smoke value) {
                                    return new DropdownMenuItem<Smoke>(
                                      value: value,
                                      child: new Text(StaticFunctions.getSmoke(value)),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        },
                        validator: (val) {
                          return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                        },
                      ),

                      //ABOUT ME SHORT
                      new TextFormField(
                        maxLines: null,
                        maxLength: 70,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.short_text),
                          hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them short'),
                          labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them short'),
                        ),
                        inputFormatters: [new LengthLimitingTextInputFormatter(70)],
                        validator: (val) => val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') : null,
                        onSaved: (val) => person.short = val,
                      ),
                      //ABOUT ME LONG
                      new TextFormField(
                        maxLines: null,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.format_align_justify),
                          hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them long'),
                          labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'About them long'),
                        ),
                        // inputFormatters: [
                        //   new LengthLimitingTextInputFormatter(500)
                        // ],
                        validator: (val) => val.isEmpty ? LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required') : null,
                        onSaved: (val) => person.long = val,
                      ),
                       SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              LocaleText.getLocaleText(MyApp.getLocale(), 'Height'),
                            ),
                            Expanded(
                              child: Slider(
                                min: 1.3,
                                max: 2.3,
                                divisions: 130,
                                label: "" + personHeight.toStringAsFixed(2),
                                value: personHeight,
                                onChanged: ((newValue) {
                                  setState(() {
                                    personHeight = newValue;
                                    person.height=newValue;
                                  });
                                }),
                              ),
                            ),
                            Text(
                              "" + personHeight.toStringAsFixed(2) + " " + LocaleText.getLocaleText(MyApp.getLocale(), 'm'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (sSelected == LocaleText.getLocaleText(MyApp.getLocale(), 'Female'))
                        Container(
                          child: Column(
                            children: <Widget>[
                              // MyApp.getLocale()=="he"? const Alignment.topLeft:const Alignment.topRight,
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
                                labels: SherutGirl.values.map((e) => StaticFunctions.getSherutGirl(e)).toList(),
                                onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                      if ( person.mySherutGirl==null) {
                                         person.mySherutGirl=[];
                                      }
                                      person.mySherutGirl.add(SherutGirl.values[index]);
                                    }
                                    else{
                                      person.mySherutGirl.remove(SherutGirl.values[index]);
                                    }
                                   print("isChecked: $isChecked   label: $label  index: $index");
                                   },
                                onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      if (sSelected == LocaleText.getLocaleText(MyApp.getLocale(), 'Male'))
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
                                labels: SherutBoy.values.map((e) => StaticFunctions.getSherutBoy(e)).toList(),
                                onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                       if ( person.mySherutBoy==null) {
                                         person.mySherutBoy=[];
                                      }
                                      person.mySherutBoy.add(SherutBoy.values[index]);
                                    }
                                    else{
                                      person.mySherutBoy.remove(SherutBoy.values[index]);
                                    }
                                   print("isChecked: $isChecked   label: $label  index: $index");
                                   },
                                onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
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
                            LocaleText.getLocaleText(MyApp.getLocale(), 'Area'),
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels: Area.values.map((e) => StaticFunctions.getArea(e)).toList(),
                        onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                       if ( person.areas==null) {
                                         person.areas=[];
                                      }
                                      person.areas.add(Area.values[index]);
                                    }
                                    else{
                                      person.areas.remove(Area.values[index]);
                                    }
                                   print("isChecked: $isChecked   label: $label  index: $index");
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
                            LocaleText.getLocaleText(MyApp.getLocale(), 'Status'),
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ),
                      ),
                      CheckboxGroup(
                        labels: Status.values.map((e) => StaticFunctions.getStatus(e)).toList(),
                        onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                      if ( person.statuses==null) {
                                         person.statuses=[];
                                      }
                                      person.statuses.add(Status.values[index]);
                                    }
                                    else{
                                      person.statuses.remove(Status.values[index]);
                                    }
                                   print("isChecked: $isChecked   label: $label  index: $index");
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
                        labels: Dos.values.map((e) => StaticFunctions.getDos(e)).toList(),
                        onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                       if ( person.doses==null) {
                                         person.doses=[];
                                      }
                                      person.doses.add(Dos.values[index]);
                                    }
                                    else{
                                      person.doses.remove(Dos.values[index]);
                                    }
                                   print("isChecked: $isChecked   label: $label  index: $index");
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
                        labels: Hashkafa.values.map((e) => StaticFunctions.getHashkafa(e)).toList(),
                        onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                       if ( person.hashkafas==null) {
                                         person.hashkafas=[];
                                      }
                                      person.hashkafas.add(Hashkafa.values[index]);
                                    }
                                    else{
                                      person.hashkafas.remove(Hashkafa.values[index]);
                                    }
                                   print("isChecked: $isChecked   label: $label  index: $index");
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
                        labels: Eda.values.map((e) => StaticFunctions.getEda(e)).toList(),
                        onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                       if ( person.edas==null) {
                                         person.edas=[];
                                      }
                                      person.edas.add(Eda.values[index]);
                                    }
                                    else{
                                      person.edas.remove(Eda.values[index]);
                                    }
                                   print("isChecked: $isChecked   label: $label  index: $index");
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
                        labels: Smoke.values.map((e) => StaticFunctions.getSmoke(e)).toList(),
                        onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                       if ( person.smoking==null) {
                                         person.smoking=[];
                                      }
                                      person.smoking.add(Smoke.values[index]);
                                    }
                                    else{
                                      person.smoking.remove(Smoke.values[index]);
                                    }
                                   print("isChecked: $isChecked   label: $label  index: $index");
                                   },
                        onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (sSelected == LocaleText.getLocaleText(MyApp.getLocale(), 'Male'))
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
                                labels: SherutGirl.values.map((e) => StaticFunctions.getSherutGirl(e)).toList(),
                                onChange: (bool isChecked, String label, int index) {
                                    if (isChecked) {
                                       if ( person.thereSherutGirl==null) {
                                         person.thereSherutGirl=[];
                                      }
                                      person.thereSherutGirl.add(SherutGirl.values[index]);
                                    }
                                    else{
                                      person.thereSherutGirl.remove(SherutGirl.values[index]);
                                    }
                                   print("isChecked: $isChecked   label: $label  index: $index");
                                   },
                                onSelected: (List<String> checked) => print("checked: ${checked.toString()}"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      if (sSelected == LocaleText.getLocaleText(MyApp.getLocale(), 'Female'))
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
                                labels: SherutBoy.values.map((e) => StaticFunctions.getSherutBoy(e)).toList(), 
                                onChange:(bool isChecked, String label, int index) {
                                    if (isChecked) {
                                      if ( person.thereSherutBoy==null) {
                                         person.thereSherutBoy=[];
                                      }
                                      person.thereSherutBoy.add(SherutBoy.values[index]);
                                    }
                                    else{
                                      person.thereSherutBoy.remove(SherutBoy.values[index]);
                                    }
                                   print("isChecked: $isChecked   label: $label  index: $index");
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
                                        person.heightMin= newValue.start;
                                        person.heightMax= newValue.end;
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
                                        person.ageMin = newValue.start;
                                        person.ageMax = newValue.end;
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
                      new TextField(
                        maxLines: null, 
                        onChanged: (value)  {person.moreInfo=value;},
                        decoration: InputDecoration(
                          icon: const Icon(Icons.wb_sunny),
                          hintText: LocaleText.getLocaleText(MyApp.getLocale(), 'More info'),
                          labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'More info'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
