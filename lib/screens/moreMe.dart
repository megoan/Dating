import 'package:dating/widgets/DateText.dart';
import 'package:dating/widgets/gradientButton.dart';
import 'package:dating/widgets/gradientSwitcher.dart';
import 'package:dating/widgets/themeSwitcherButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MoreMe extends StatefulWidget {
  @override
  _MoreMeState createState() => _MoreMeState();
}

class OldText {
  String old = "";
}

class _MoreMeState extends State<MoreMe> {
  bool badDate = false;
  String textError = "Please Enter Valid Date!";
  BuildContext context2;
  TextEditingController monthText1 = TextEditingController();
  TextEditingController monthText2 = TextEditingController();
  TextEditingController dayText1 = TextEditingController();
  TextEditingController dayText2 = TextEditingController();
  TextEditingController yearText1 = TextEditingController();
  TextEditingController yearText2 = TextEditingController();
  TextEditingController yearText3 = TextEditingController();
  TextEditingController yearText4 = TextEditingController();
  bool verifyEnabled = false;
  bool areaVerified = false;
  bool dateVarified = false;
  bool gushDan;
  bool sharon;
  bool jerusalem;
  bool beerSheva;
  bool hifaNorth;
  bool other;
  GradientSwitcher gradientButtonGushDan;
  GradientSwitcher gradientButtonSharon;
  GradientSwitcher gradientButtonJerusalem;
  GradientSwitcher gradientButtonBeerSheva;
  GradientSwitcher gradientButtonHifaNorth;
  GradientSwitcher gradientButtonOther;

  void selectGushDan() {
    setState(() {
      gushDan = true;
      sharon = false;
      jerusalem = false;
      beerSheva = false;
      hifaNorth = false;
      other = false;
      areaVerified = true;
    });
  }

  void selectSharon() {
    setState(() {
      gushDan = false;
      sharon = true;
      jerusalem = false;
      beerSheva = false;
      hifaNorth = false;
      other = false;
      areaVerified = true;
    });
  }

  void selectJerusalem() {
    setState(() {
      gushDan = false;
      sharon = false;
      jerusalem = true;
      beerSheva = false;
      hifaNorth = false;
      other = false;
      areaVerified = true;
    });
  }

  void selectBeerSheva() {
    setState(() {
      gushDan = false;
      sharon = false;
      jerusalem = false;
      beerSheva = true;
      hifaNorth = false;
      other = false;
      areaVerified = true;
    });
  }

  void selectHifaNorth() {
    setState(() {
      gushDan = false;
      sharon = false;
      jerusalem = false;
      beerSheva = false;
      hifaNorth = true;
      other = false;
      areaVerified = true;
    });
  }

  void selectOther() {
    setState(() {
      gushDan = false;
      sharon = false;
      jerusalem = false;
      beerSheva = false;
      hifaNorth = false;
      other = true;
      areaVerified = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    gradientButtonGushDan = GradientSwitcher.getGradiantButton(context,
        selectGushDan, 'גוש דן והמרכז', 20, gushDan == null ? false : gushDan);
    gradientButtonSharon = GradientSwitcher.getGradiantButton(context,
        selectSharon, 'השרון והסביבה', 20, sharon == null ? false : sharon);
    gradientButtonJerusalem = GradientSwitcher.getGradiantButton(
        context,
        selectJerusalem,
        'ירושלים והסביבה',
        20,
        jerusalem == null ? false : jerusalem);
    gradientButtonBeerSheva = GradientSwitcher.getGradiantButton(
        context,
        selectBeerSheva,
        'באר שבע והדרום',
        20,
        beerSheva == null ? false : beerSheva);
    gradientButtonHifaNorth = GradientSwitcher.getGradiantButton(
        context,
        selectHifaNorth,
        'חיפה והצפון',
        20,
        hifaNorth == null ? false : hifaNorth);
    gradientButtonOther = GradientSwitcher.getGradiantButton(
        context, selectOther, 'אחר', 20, other == null ? false : other);
    // DateTime a = new DateTime(0,4,31);
    // int b=5;
    context2 = context;
    return Scaffold(
      //  appBar: AppBar(
      //   title: Text('Add Email'),
      // ),
      floatingActionButton: FancyFab(
        context: context,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'More About Me',
                    style: TextStyle(
                        fontSize: 35, color: Theme.of(context).primaryColor),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'My birthday is',
                            style: TextStyle(
                                fontSize: 25,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DateText(
                            dayText1: dayText1,
                            dayText2: dayText2,
                            monthText1: monthText1,
                            monthText2: monthText2,
                            yearText1: yearText1,
                            yearText2: yearText2,
                            yearText3: yearText3,
                            yearText4: yearText4,
                            validateDate: validateDate,
                          ),
                          if (badDate)
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 5,
                                ),
                                Text(textError)
                              ],
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'I live In',
                            style: TextStyle(
                                fontSize: 25,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    gradientButtonGushDan,
                                    SizedBox(
                                      height: 8,
                                    ),
                                    gradientButtonSharon,
                                    SizedBox(
                                      height: 8,
                                    ),
                                    gradientButtonJerusalem
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    gradientButtonBeerSheva,
                                    SizedBox(
                                      height: 8,
                                    ),
                                    gradientButtonHifaNorth,
                                    SizedBox(
                                      height: 8,
                                    ),
                                    gradientButtonOther
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  GradientButton.getGradiantButton(
                      context,
                      addUserMoreMe,
                      'CONTINUE',
                      Colors.black,
                      20,
                      areaVerified && dateVarified),
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }

  void validateDate() {
    String d1 = dayText1.text.toString();
    String d2 = dayText2.text.toString();
    String m1 = monthText1.text.toString();
    String m2 = monthText2.text.toString();
    String y1 = yearText1.text.toString();
    String y2 = yearText2.text.toString();
    String y3 = yearText3.text.toString();
    String y4 = yearText4.text.toString();
    if (d1 != "" &&
        d2 != "" &&
        m1 != "" &&
        m2 != "" &&
        y1 != "" &&
        y2 != "" &&
        y3 != "" &&
        y4 != "") {
      int day = int.parse(d1) * 10 + int.parse(d2);
      int month = int.parse(m1) * 10 + int.parse(m2);
      int year = int.parse(y1) * 1000 +
          int.parse(y2) * 100 +
          int.parse(y3) * 10 +
          int.parse(y4);
      DateTime date = new DateTime(year, month, day);
      if (date.year != year ||
          date.month != month ||
          date.day != day ||
          date.isAfter(DateTime.now())) {
        setState(() {
          dateVarified = false;
          badDate = true;
          textError = "Please Enter Valid Date!";
        });
      } else if (DateTime.now().difference(date).inDays / 365 < 18) {
        setState(() {
          dateVarified = false;
          badDate = true;
          textError = "Your too young!";
        });
      } else if (DateTime.now().difference(date).inDays / 365 > 100) {
        setState(() {
          dateVarified = false;
          badDate = true;
          textError = "Your too old! better luck next time...";
        });
      } else {
        setState(() {
          dateVarified = true;
        });
      }
    } else {
      setState(() {
        dateVarified = false;
        badDate = false;
        textError = "";
      });
    }
  }

  void addUserMoreMe() {
    //Navigator.of(context2).push( new MaterialPageRoute( builder: (context) => new AddGender()));
  }
}
