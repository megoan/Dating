import 'package:dating/main.dart';
import 'package:dating/models/person.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:dating/themes/appTheme.dart';
import 'package:dating/themes/colorManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompareScreen extends StatefulWidget {
  Person myPerson;
  Person person;
  final String person1Id;
  final String person2Id;
  CompareScreen({this.myPerson, this.person, this.person1Id, this.person2Id});
  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  ScrollController scrollController;
  double rowHeight = 150;
  double radious = 30;
  bool mainSelected = true;
  bool isLoading = false;
  bool isInit = true;
  Size screenSize;
  PersonProvider personProvider;
  _scrollListener() {}

  Widget avatarPhoto(screenSize, {bool mainSelected: true}) {
    return Container(
      // width: mainSelected? (screenSize.width* 0.333)-8:(screenSize.width * 0.666)-4,
      //   height:  200,
      width: (screenSize.width / 2) - 5,
      height: (screenSize.width / 2) - 5,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: mainSelected ? BorderRadius.only(bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)) : BorderRadius.only(bottomRight: Radius.circular(30), topRight: Radius.circular(30)),
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            mainSelected ? widget.myPerson.profileImages[0] : widget.person.profileImages[0],
          ),
        ),
      ),
    );
  }

  Widget circleIcon(IconData _icon) {
    return new Container(
      //width: 50.0,
      //height: 50.0,
      padding: const EdgeInsets.all(8.0),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.filterBackgroundColor,
      ),
      child: FaIcon(
        _icon,
        color: Colors.white,
        size: 14,
      ),
    );
  }

  Widget personalDetails(screenSize, {bool mainSelected: true}) {
    TextStyle agestyle = TextStyle(fontSize: 17, color: StaticFunctions.getAge(widget.person.birthday) <= widget.myPerson.ageMax && StaticFunctions.getAge(widget.person.birthday) >= widget.myPerson.ageMin ? Colors.green : Colors.red);
    TextStyle heightStyle = TextStyle(fontSize: 17, color: widget.person.height <= widget.myPerson.heightMax && widget.person.height >= widget.myPerson.heightMin ? Colors.green : Colors.red);

    return Container(
      color: Colors.white,
      //width: mainSelected? (screenSize.width* 0.666)-0.5:(screenSize.width * 0.333)-0.5,
      // width: (screenSize.width / 2) - 0.5,

      child: Column(
        children: <Widget>[
          //Age
          Stack(
            children: [
              Container(
                color: Colors.grey[200],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          left: BorderSide(
                            width: 0.5,
                            color: AppTheme.filterBackgroundColor,
                          ),
                        )),
                        child: Padding(
                            padding: const EdgeInsets.only(
                              top: 12.0,
                              bottom: 12.0,
                              left: 10.0,
                              right: 15.0,
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                              Text(
                                StaticFunctions.getAge(widget.myPerson.birthday).toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: 60,
                                child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        widget.myPerson.ageMin.round().toString(),
                                        style: agestyle,
                                      ),
                                      Text("-", style: agestyle),
                                      Text(widget.myPerson.ageMax.round().toString(), style: agestyle)
                                    ],
                                  ),
                                ]),
                              ),
                            ])),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        right: BorderSide(
                          width: 0.5,
                          color: AppTheme.filterBackgroundColor,
                        ),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          left: 5.0,
                          right: 20.0,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                          Text(
                            StaticFunctions.getAge(widget.person.birthday).toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                              width: 60,
                              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Row(
                                  children: <Widget>[
                                    Text(
                                      widget.person.ageMin.round().toString(),
                                      style: agestyle,
                                    ),
                                    Text("-", style: agestyle),
                                    Text(widget.person.ageMax.round().toString(), style: agestyle)
                                  ],
                                )
                              ])),
                        ]),
                      ),
                    ))
                  ],
                ),
              ),
              Positioned.fill(
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        color: AppTheme.filterBackgroundColor,
                        width: 1,
                      ))),
              Positioned.fill(child: Align(alignment: Alignment.center, child: circleIcon(FontAwesomeIcons.birthdayCake))),
            ],
          ),
          //Country
          Stack(children: [
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: AppTheme.filterBackgroundColor,
                        ),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          left: 10.0,
                          right: 15.0,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                          Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.myPerson.country.toString())),
                          SizedBox(
                            width: 60,
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.myPerson.countrys.entries.map((e) => Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: widget.myPerson.countrys[widget.person.country] == true ? Colors.green : Colors.red))).toList()),
                          )
                          // Text(
                          //   widget.myPerson.countrys.map((country) => country)).toList().join('\n'),
                          //   style: TextStyle(color: (widget.myPerson.countrys[widget.person.country])==true? Colors.green : Colors.red),
                          // ),
                        ]),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        width: 0.5,
                        color: AppTheme.filterBackgroundColor,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                        left: 5.0,
                        right: 20.0,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.person.country.toString())), SizedBox(width: 60, child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.person.countrys.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.person.countrys[widget.myPerson.country]) == true ? Colors.green : Colors.red)))).toList()))]),
                    ),
                  ))
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      color: AppTheme.filterBackgroundColor,
                      width: 1,
                    ))),
            Positioned.fill(child: Align(alignment: Alignment.center, child: circleIcon(FontAwesomeIcons.globeAsia))),
          ]),
          //Area
          Stack(children: [
            Container(
              color: Colors.grey[200],
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: AppTheme.filterBackgroundColor,
                        ),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          left: 10.0,
                          right: 15.0,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.myPerson.area.toString())), SizedBox(width: 60, child: (Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.myPerson.areas.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.myPerson.areas[widget.person.areas]) == true ? Colors.green : Colors.red)))).toList())))]),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        width: 0.5,
                        color: AppTheme.filterBackgroundColor,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                        left: 5.0,
                        right: 20.0,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.person.area.toString())), SizedBox(width: 60, child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.person.areas.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.person.areas[widget.myPerson.areas]) == true ? Colors.green : Colors.red)))).toList()))]),
                    ),
                  ))
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      color: AppTheme.filterBackgroundColor,
                      width: 1,
                    ))),
            Positioned.fill(child: Align(alignment: Alignment.center, child: circleIcon(FontAwesomeIcons.city))),
          ]),
          //Status
          Stack(children: [
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: AppTheme.filterBackgroundColor,
                        ),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          left: 10.0,
                          right: 15.0,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                          Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.myPerson.status.toString())),
                          SizedBox(
                            width: 60,
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.myPerson.statuses.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.myPerson.statuses[widget.person.status]) == true ? Colors.green : Colors.red)))).toList()),
                          )
                        ]),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        width: 0.5,
                        color: AppTheme.filterBackgroundColor,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                        left: 5.0,
                        right: 20.0,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.person.status.toString())), SizedBox(width: 60, child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.person.statuses.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.person.statuses[widget.myPerson.status]) == true ? Colors.green : Colors.red)))).toList()))]),
                    ),
                  ))
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      color: AppTheme.filterBackgroundColor,
                      width: 1,
                    ))),
            Positioned.fill(child: Align(alignment: Alignment.center, child: circleIcon(FontAwesomeIcons.userFriends))),
          ]),
          //Religious
          Stack(children: [
            Container(
              color: Colors.grey[200],
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: AppTheme.filterBackgroundColor,
                        ),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          left: 10.0,
                          right: 15.0,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.myPerson.dos.toString())), SizedBox(width: 60, child: (Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.myPerson.doses.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.myPerson.doses[widget.person.dos]) == true ? Colors.green : Colors.red)))).toList())))]),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        width: 0.5,
                        color: AppTheme.filterBackgroundColor,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                        left: 5.0,
                        right: 20.0,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.person.dos.toString())), SizedBox(width: 60, child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.person.doses.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.person.doses[widget.myPerson.dos]) == true ? Colors.green : Colors.red)))).toList()))]),
                    ),
                  ))
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      color: AppTheme.filterBackgroundColor,
                      width: 1,
                    ))),
            Positioned.fill(child: Align(alignment: Alignment.center, child: circleIcon(FontAwesomeIcons.torah))),
          ]),
          //Hashkafa
          Stack(children: [
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: AppTheme.filterBackgroundColor,
                        ),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          left: 10.0,
                          right: 15.0,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.myPerson.hashkafa.toString())), SizedBox(width: 60, child: (Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.myPerson.hashkafas.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.myPerson.hashkafas[widget.person.hashkafa]) == true ? Colors.green : Colors.red)))).toList())))]),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        width: 0.5,
                        color: AppTheme.filterBackgroundColor,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                        left: 5.0,
                        right: 20.0,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.person.hashkafa.toString())), SizedBox(width: 60, child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.person.hashkafas.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.person.hashkafas[widget.myPerson.hashkafa]) == true ? Colors.green : Colors.red)))).toList()))]),
                    ),
                  ))
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      color: AppTheme.filterBackgroundColor,
                      width: 1,
                    ))),
            Positioned.fill(child: Align(alignment: Alignment.center, child: circleIcon(FontAwesomeIcons.starOfDavid))),
          ]),
          //Eda
          Stack(children: [
            Container(
              color: Colors.grey[200],
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: AppTheme.filterBackgroundColor,
                        ),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          left: 10.0,
                          right: 15.0,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.myPerson.eda.toString())), SizedBox(width: 60, child: (Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.myPerson.edas.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.myPerson.edas[widget.person.eda]) == true ? Colors.green : Colors.red)))).toList())))]),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        width: 0.5,
                        color: AppTheme.filterBackgroundColor,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                        left: 5.0,
                        right: 20.0,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.person.eda.toString())), SizedBox(width: 60, child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.person.edas.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.person.edas[widget.myPerson.eda]) == true ? Colors.green : Colors.red)))).toList()))]),
                    ),
                  ))
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      color: AppTheme.filterBackgroundColor,
                      width: 1,
                    ))),
            Positioned.fill(child: Align(alignment: Alignment.center, child: circleIcon(FontAwesomeIcons.synagogue))),
          ]),
          //Smoking
          Stack(children: [
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: AppTheme.filterBackgroundColor,
                        ),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          left: 10.0,
                          right: 15.0,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.myPerson.smoke.toString())), SizedBox(width: 60, child: (Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.myPerson.smoking.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.myPerson.smoking[widget.person.smoke]) == true ? Colors.green : Colors.red)))).toList())))]),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        width: 0.5,
                        color: AppTheme.filterBackgroundColor,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                        left: 5.0,
                        right: 20.0,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), widget.person.smoke.toString())), SizedBox(width: 60, child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: widget.person.smoking.entries.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3, style: TextStyle(color: (widget.person.smoking[widget.myPerson.smoke]) == true ? Colors.green : Colors.red)))).toList()))]),
                    ),
                  ))
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      color: AppTheme.filterBackgroundColor,
                      width: 1,
                    ))),
            Positioned.fill(child: Align(alignment: Alignment.center, child: circleIcon(FontAwesomeIcons.smoking))),
          ]),
          //height
          Stack(children: [
            Container(
              color: Colors.grey[200],
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: AppTheme.filterBackgroundColor,
                        ),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          left: 10.0,
                          right: 15.0,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                          Text(
                            widget.myPerson.height.toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                              width: 60,
                              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Row(
                                  children: <Widget>[
                                    Text(
                                      widget.myPerson.heightMin.toString(),
                                      style: heightStyle,
                                    ),
                                    Text("-", style: heightStyle),
                                    Text(widget.myPerson.heightMax.toString(), style: heightStyle)
                                  ],
                                )
                              ])),
                        ]),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        width: 0.5,
                        color: AppTheme.filterBackgroundColor,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                        left: 5.0,
                        right: 20.0,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Text(
                          widget.person.height.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                            width: 60,
                            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Row(
                                children: <Widget>[
                                  Text(
                                    widget.person.heightMin.toString(),
                                    style: heightStyle,
                                  ),
                                  Text("-", style: heightStyle),
                                  Text(widget.person.heightMax.toString(), style: heightStyle)
                                ],
                              )
                            ])),
                      ]),
                    ),
                  ))
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      color: AppTheme.filterBackgroundColor,
                      width: 1,
                    ))),
            Positioned.fill(child: Align(alignment: Alignment.center, child: circleIcon(FontAwesomeIcons.ruler))),
          ]),
          //sherut
          Stack(children: [
            Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        left: BorderSide(
                          width: 0.5,
                          color: AppTheme.filterBackgroundColor,
                        ),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 12.0,
                          left: 10.0,
                          right: 15.0,
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.myPerson.gender == Gender.MALE ? widget.myPerson.mySherutBoy != null ? widget.myPerson.mySherutBoy.entries.map((e) => Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3)).toList() : [] : widget.myPerson.mySherutGirl != null ? widget.myPerson.mySherutGirl.entries.map((e) => Text(LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()), maxLines: 3)).toList() : [],
                          ),
                          SizedBox(
                              width: 60,
                              child: (Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: widget.myPerson.gender == Gender.MALE
                                    ? widget.myPerson.thereSherutGirl.entries
                                        .map((e) => Text(
                                              LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()),
                                              maxLines: 3,
                                              style: TextStyle(color: (widget.person.thereSherutBoy[e] == true ? Colors.green : Colors.red)),
                                            ))
                                        .toList()
                                    : widget.myPerson.thereSherutBoy.entries
                                        .map((e) => Text(
                                              LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()),
                                              maxLines: 3,
                                              style: TextStyle(color: (widget.person.thereSherutGirl[e] == true ? Colors.green : Colors.red)),
                                            ))
                                        .toList(),
                              )))
                        ]),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      right: BorderSide(
                        width: 0.5,
                        color: AppTheme.filterBackgroundColor,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                        left: 5.0,
                        right: 20.0,
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.person.gender == Gender.MALE
                              ? widget.person.mySherutBoy != null
                                  ? widget.person.mySherutBoy.entries
                                      .map((e) => Text(
                                            LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()),
                                            maxLines: 3,
                                          ))
                                      .toList()
                                  : []
                              : widget.person.mySherutGirl != null
                                  ? widget.person.mySherutGirl.entries
                                      .map((e) => Text(
                                            LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()),
                                            maxLines: 3,
                                          ))
                                      .toList()
                                  : [],
                        ),
                        SizedBox(
                            width: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: widget.person.gender == Gender.MALE
                                  ? widget.person.thereSherutGirl.entries
                                      .map((e) => Text(
                                            LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()),
                                            maxLines: 3,
                                            style: TextStyle(color: (widget.myPerson.thereSherutBoy[e] == true ? Colors.green : Colors.red)),
                                          ))
                                      .toList()
                                  : widget.person.thereSherutBoy.entries
                                      .map((e) => Text(
                                            LocaleText.getLocaleSelectText(MyApp.getLocale(), e.key.toString()),
                                            maxLines: 3,
                                            style: TextStyle(color: (widget.myPerson.thereSherutGirl[e] == true ? Colors.green : Colors.red)),
                                          ))
                                      .toList(),
                            ))
                      ]),
                    ),
                  ))
                ],
              ),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      color: AppTheme.filterBackgroundColor,
                      width: 1,
                    ))),
            Positioned.fill(child: Align(alignment: Alignment.center, child: circleIcon(FontAwesomeIcons.handHoldingHeart))),
          ]),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() async {
    if (isInit) {
      isInit = false;
      List<Future> futures = [];
      personProvider = Provider.of<PersonProvider>(context);
      if (widget.person == null && widget.person1Id != null) {
        setState(() {
          isLoading = true;
        });
        futures.add(personProvider.getPersonById(widget.person1Id));
      }
      if (widget.myPerson == null && widget.person2Id != null) {
        setState(() {
          isLoading = true;
        });
        futures.add(personProvider.getPersonById(widget.person2Id));
      }
      Future.wait(futures).then((value) {
        if (value != null && value.length > 0) {
          widget.myPerson = value[0];
        }
        if (value != null && value.length > 1) {
          widget.person = value[1];
        }
        setState(() {
          isLoading = false;
        });
      });
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager().theme.filterBackgroundColor,
      // appBar: AppBar(
      //   title: Text("compare"),
      // ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    widget.myPerson.profileImages != null && widget.myPerson.profileImages.length > 0 ? avatarPhoto(screenSize, mainSelected: mainSelected) : Container(),
                    widget.person.profileImages != null && widget.person.profileImages.length > 0 ? avatarPhoto(screenSize, mainSelected: !mainSelected) : Container(),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                widget.myPerson.firstName,
                                style: TextStyle(fontSize: 25, color: AppTheme.filterBackgroundColor, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 18.0,
                                  right: 15.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(widget.myPerson.gender == Gender.MALE ? LocaleText.getLocaleText(MyApp.getLocale(), 'Him') : LocaleText.getLocaleText(MyApp.getLocale(), 'Her'), style: TextStyle(fontSize: 18, color: AppTheme.filterBackgroundColor, fontWeight: FontWeight.bold)),
                                    Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Like'), style: TextStyle(fontSize: 18, color: AppTheme.filterBackgroundColor, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(width: 1, color: AppTheme.filterBackgroundColor),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                widget.person.firstName,
                                style: TextStyle(fontSize: 25, color: AppTheme.filterBackgroundColor, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 12.0,
                                  right: 20.0,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(widget.person.gender == Gender.MALE ? LocaleText.getLocaleText(MyApp.getLocale(), 'Him') : LocaleText.getLocaleText(MyApp.getLocale(), 'Her'), style: TextStyle(fontSize: 18, color: AppTheme.filterBackgroundColor, fontWeight: FontWeight.bold)),
                                    Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Like'), style: TextStyle(fontSize: 18, color: AppTheme.filterBackgroundColor, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                  personalDetails(screenSize, mainSelected: mainSelected),

                  //End
                  Row(children: [
                    Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          height: 20,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
                          )),
                    ),
                    Container(width: 1, color: AppTheme.filterBackgroundColor),
                    Expanded(
                      child: Container(
                        height: 20,
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(height: 40),
                ],
              ),
            ),
    );
  }
}
