import 'package:dating/widgets/gradientButton.dart';
import 'package:dating/widgets/gradientSwitcher.dart';
import 'package:dating/widgets/themeSwitcherButton.dart';
import 'package:flutter/material.dart';

import 'momeMeShort.dart';
class MoreMeArea extends StatefulWidget {
  @override
  _MoreMeAreaState createState() => _MoreMeAreaState();
}

class _MoreMeAreaState extends State<MoreMeArea> {
  BuildContext context2;
  bool gushDan;
  bool sharon;
  bool jerusalem;
  bool beerSheva;
  bool hifaNorth;
  bool other;
  bool areaVerified = false;
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
        context, selectOther, 'חו"ל', 20, other == null ? false : other);
    // DateTime a = new DateTime(0,4,31);
    // int b=5;
    context2 = context;
    return Scaffold(
       floatingActionButton: Padding(
        padding: const EdgeInsets.only(top:150),
        child: FancyFab(
          context: context,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body:  Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
                  //mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('More About Me',  style: TextStyle( fontSize: 35, color: Theme.of(context).primaryColor),                  
                        ),
                         Text('Viewed by all',style: TextStyle(fontSize: 14,color: Theme.of(context).primaryColor),),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                    
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
                        areaVerified),
                  ],
                ),
      ),
    );
  }
  void addUserMoreMe() {
    Navigator.of(context2).push( new MaterialPageRoute( builder: (context) => new MoreMeShort()));
  }
}