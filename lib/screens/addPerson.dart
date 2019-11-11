import 'dart:collection';
import 'dart:io';

import 'package:dating/themes/lightTheme.dart';
import 'package:dating/widgets/DateText.dart';
import 'package:dating/widgets/photoPicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:intl/intl.dart';

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
  List<String> _areas = <String>['', 'red', 'green', 'blue', 'orange'];
  //List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  List<String> _howReligios = <String>['', 'red', 'green', 'blue', 'orange'];
  List<String> _whatHashkafa = <String>['', 'red', 'green', 'blue', 'orange'];
  List<String> _statuses = <String>['', 'red', 'green', 'blue', 'orange'];
  List<String> _edas = <String>['', 'red', 'green', 'blue', 'orange'];
  List<String> _smokes = <String>['', 'red', 'green', 'blue', 'orange'];

  String _color = '';
  String _area = '';
  String _religious = '';
  String _hashkafa = '';
  String _status = '';
  String _eda = '';
  String _smoke = '';
  double personHeight = 1.5;
  String myHeight = "";

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
    // map1.forEach((k,v)=>{
    //   v.forEach((k2,v2)=>{
    //     v2.didChange(k2)
    //   })
    // });
    // state.didChange(newValue);
    setState(() {
      areaState.didChange(areaValue);
      statusState.didChange(statusValue);
      religiosState.didChange(religiosValue);
      edaState.didChange(edaValue);
      smokeState.didChange(smokeValue);
    });

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
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
        title: Text("add Person"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Required Fields",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  autovalidate: true,
                  child: new Column(
                    children: <Widget>[
                      //FIRST NAME
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'Enter your first name',
                          labelText: 'First Name',
                        ),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(30)
                        ],
                        validator: (val) =>
                            val.isEmpty ? 'First name is required' : null,
                        onSaved: (val) => newContact.fName = val,
                      ),
                      //LAST NAME
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'Enter your last name',
                          labelText: 'Last Name',
                        ),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(30)
                        ],
                        validator: (val) =>
                            val.isEmpty ? 'Last name is required' : null,
                        onSaved: (val) => newContact.lName = val,
                      ),
                      //BIRTH DAY
                      new Row(children: <Widget>[
                        new Expanded(
                            child: new TextFormField(
                          decoration: new InputDecoration(
                            icon: const Icon(Icons.calendar_today),
                            hintText: 'Enter your date of birth',
                            labelText: 'Date Of Birth',
                          ),
                          controller: _controller,
                          keyboardType: TextInputType.datetime,
                          validator: (val) {
                            if (isValidDob(val)) return null;
                            return 'Not a valid date';
                          },
                          onSaved: (val) => newContact.dob = convertToDate(val),
                        )),
                        new IconButton(
                          icon: new Icon(Icons.more_horiz),
                          tooltip: 'Choose date',
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
                              labelText: 'Area',
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
                          return val != '' ? null : 'Please select an area';
                        },
                      ),
                      //STATUS
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          statusState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.people),
                              labelText: 'Status',
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
                          return val != '' ? null : 'Please select a status';
                        },
                      ),
                      //RELIGIOUS
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          religiosState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.call_split),
                              labelText: 'how religious',
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
                              : 'Please select how religious';
                        },
                      ),
                      //HASHKAFA
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          hashkafaState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.group_work),
                              labelText: 'what hashkafa',
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
                              : 'Please select what hashkafa';
                        },
                      ),
                      //EDA
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          edaState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.fastfood),
                              labelText: 'what eda',
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
                          return val != '' ? null : 'Please select what eda';
                        },
                      ),
                      //SMOKE
                      new FormField<String>(
                        builder: (FormFieldState<String> state) {
                          smokeState = state;
                          return InputDecorator(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.smoke_free),
                              labelText: 'smoking',
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
                          return val != '' ? null : 'Please select if smokes';
                        },
                      ),

                      //ABOUT ME SHORT
                      new TextFormField(
                        maxLines: null,
                        maxLength: 70,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.short_text),
                          hintText: 'About me',
                          labelText: 'About me short',
                        ),
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(70)
                        ],
                        validator: (val) =>
                            val.isEmpty ? 'About me is requierd' : null,
                        onSaved: (val) => newContact.aboutMeShort = val,
                      ),
                      //ABOUT ME LONG
                      new TextFormField(
                        maxLines: null,
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.format_align_justify),
                          hintText: 'About me',
                          labelText: 'About me long',
                        ),
                        // inputFormatters: [
                        //   new LengthLimitingTextInputFormatter(500)
                        // ],
                        validator: (val) =>
                            val.isEmpty ? 'About me is requierd' : null,
                        onSaved: (val) => newContact.aboutMeLong = val,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text("height"),
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
                            Text("" + personHeight.toStringAsFixed(2) + " m")
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Add at least one image!")),
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Optional Fields",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //PHONE NUMBER
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.phone),
                          hintText: 'Enter a phone number',
                          labelText: 'Phone',
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          new WhitelistingTextInputFormatter(
                              new RegExp(r'^[()\d -]{1,15}$')),
                        ],
                        validator: (value) => isValidPhoneNumber(value)
                            ? null
                            : 'Phone number must be entered as (###)###-####',
                        onSaved: (val) => newContact.phone = val,
                      ),
                      //EMAIL ADDRESS
                      new TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.email),
                          hintText: 'Enter a email address',
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => isValidEmail(value)
                            ? null
                            : 'Please enter a valid email address',
                        onSaved: (val) => newContact.email = val,
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
