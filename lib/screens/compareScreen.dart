import 'package:dating/main.dart';
import 'package:dating/models/person.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CompareScreen extends StatefulWidget {
  final Person myPerson;
  final Person person;
  CompareScreen(this.myPerson, this.person);
  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  ScrollController scrollController;
  double rowHeight = 150;
  double radious = 30;
  _scrollListener() {
    // if (scrollController.position.pixels<200 && scrollController.position.userScrollDirection==ScrollDirection.reverse && rowHeight>=100) {
    //   setState(() {
    //     rowHeight-=1;
    //     radious-=0.3;
    //   });
    // }
    // else if(scrollController.position.pixels<200 && scrollController.position.userScrollDirection==ScrollDirection.forward && rowHeight<200){
    //    setState(() {
    //     rowHeight+=1;
    //     radious+=0.3;
    //   });
    // }
    // print(scrollController.position.pixels.toString());
    //print("row height:"+rowHeight.toString()+" radious: "+radious.toString());
  }
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    print("object");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("compare"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        offset: new Offset(0.0, -10.0),
                        blurRadius: 10.0,
                      )
                    ],
                  ),
                  child: DataTable(
                    dataRowHeight: 150,
                    columns: [
                      DataColumn(label: Text("")),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                CircleAvatar(
                                    radius: radious,
                                    backgroundImage:widget.myPerson.profileImages!=null&&widget.myPerson.profileImages.length>0? NetworkImage(
                                      widget.myPerson.profileImages[0],
                                      //fit: BoxFit.fill,
                                    ):Container()),
                                Text(
                                  widget.myPerson.firstName,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                CircleAvatar(
                                    radius: radious,
                                    backgroundImage:widget.person.profileImages!=null&&widget.person.profileImages.length>0?  NetworkImage(
                                        widget.person.profileImages[0],
                                      //fit: BoxFit.fill,
                                    ):Container()),
                                Text(
                                   widget.person.firstName,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataRowHeight: rowHeight,
                      columns: [
                        //LocaleText.getLocaleText(MyApp.getLocale(), "Form is not valid!  Please review and correct!")
                        DataColumn(
                            label: Text(LocaleText.getLocaleText(MyApp.getLocale(), "Age"),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))),
                        DataColumn(
                            label: Text(LocaleText.getLocaleText(MyApp.getLocale(), "Area"),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))),
                        DataColumn(
                            label: Text(LocaleText.getLocaleText(MyApp.getLocale(), "Status"),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))),
                        DataColumn(
                            label: Text(LocaleText.getLocaleText(MyApp.getLocale(), "Religious"),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))),
                        DataColumn(
                            label: Text(LocaleText.getLocaleText(MyApp.getLocale(), "Hashkafa"),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))),
                        DataColumn(
                            label: Text(LocaleText.getLocaleText(MyApp.getLocale(), "Eda"),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))),
                        DataColumn(
                            label: Text(LocaleText.getLocaleText(MyApp.getLocale(), "Smoking"),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))),
                        DataColumn(
                            label: Text(LocaleText.getLocaleText(MyApp.getLocale(), "About them short"),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))),
                        DataColumn(
                            label: Text(LocaleText.getLocaleText(MyApp.getLocale(), "About them long"),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))),
                        DataColumn(
                            label: Text(LocaleText.getLocaleText(MyApp.getLocale(), "Height"),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))),
                        DataColumn(
                            label: Text(LocaleText.getLocaleText(MyApp.getLocale(), "Sherut"),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ))),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text(StaticFunctions.getAge(widget.myPerson.birthday).toString())),
                          DataCell(Text(StaticFunctions.getArea(widget.myPerson.area))),
                          DataCell(Text(StaticFunctions.getStatus(widget.myPerson.status))),
                          DataCell(Text(StaticFunctions.getDos(widget.myPerson.dos))),
                          DataCell(Text(StaticFunctions.getHashkafa(widget.myPerson.hashkafa))),
                          DataCell(Text(StaticFunctions.getEda(widget.myPerson.eda))),
                          DataCell(Text(StaticFunctions.getSmoke(widget.myPerson.smoke))),
                          DataCell(Text(widget.myPerson.short)),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 200,
                                child: SingleChildScrollView(
                                    child: Text(
                                 widget.myPerson.lastName,
                                  maxLines: null,
                                ))),
                          )),
                          DataCell(Text(widget.myPerson.height.toString())),
                          DataCell(Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:widget.myPerson.gender==Gender.MALE? widget.myPerson.mySherutBoy.map((e) => Text(StaticFunctions.getSherutBoy(e))).toList():
                            widget.myPerson.mySherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList(),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(StaticFunctions.getAge(widget.person.birthday).toString())),
                          DataCell(Text(StaticFunctions.getArea(widget.person.area))),
                          DataCell(Text(StaticFunctions.getStatus(widget.person.status))),
                          DataCell(Text(StaticFunctions.getDos(widget.person.dos))),
                          DataCell(Text(StaticFunctions.getHashkafa(widget.person.hashkafa))),
                          DataCell(Text(StaticFunctions.getEda(widget.person.eda))),
                          DataCell(Text(StaticFunctions.getSmoke(widget.person.smoke))),
                          DataCell(Text(widget.person.short)),
                          DataCell(Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 200,
                                child: SingleChildScrollView(
                                    child: Text(
                                 widget.person.lastName,
                                  maxLines: null,
                                ))),
                          )),
                          DataCell(Text(widget.person.height.toString())),
                          DataCell(Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:widget.person.gender==Gender.MALE? widget.person.mySherutBoy.map((e) => Text(StaticFunctions.getSherutBoy(e))).toList():
                            widget.person.mySherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList(),
                          )),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "looking for compare",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DataTable(
              dataRowHeight: 100,
              columns: [
                DataColumn(label: Text("")),
                DataColumn(
                    label: Text(
                  widget.myPerson.firstName,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                )),
                DataColumn(
                    label: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.person.firstName),
                    ],
                  ),
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text(LocaleText.getLocaleText(MyApp.getLocale(), "Age"))),
                  DataCell(Center(child: Row(children:<Widget>[Text(widget.myPerson.ageMin.round().toString()),Text("-"),Text(widget.myPerson.ageMax.round().toString())]))),
                  DataCell(Center(
                      child: Text(
                 StaticFunctions.getAge(widget.person.birthday).toString(),
                    style: TextStyle(color: StaticFunctions.getAge(widget.person.birthday)<=widget.myPerson.ageMax && StaticFunctions.getAge(widget.person.birthday)>=widget.myPerson.ageMin? Colors.green:Colors.red),
                  ))),
                ]),
                 DataRow(cells: [
                  DataCell(Text(LocaleText.getLocaleText(MyApp.getLocale(), "Area"),)),
                  DataCell(Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children:widget.myPerson.areas.map((e) => (Text(StaticFunctions.getArea(e)))).toList()))),
                  DataCell(Center(
                      child: Text(
                  StaticFunctions.getArea(widget.person.area),
                    style: TextStyle(color: (widget.myPerson.areas.contains(widget.person.area))? Colors.green:Colors.red),
                  ))),
                ]),
                 DataRow(cells: [
                  DataCell(Text(LocaleText.getLocaleText(MyApp.getLocale(), "Status"))),
                  DataCell(Center(child:  Column(mainAxisAlignment: MainAxisAlignment.center, children:widget.myPerson.statuses.map((e) => (Text(StaticFunctions.getStatus(e)))).toList()))),
                  DataCell(Center(
                      child: Text(
                     StaticFunctions.getStatus(widget.person.status),
                    style: TextStyle(color: (widget.myPerson.statuses.contains(widget.person.status))? Colors.green:Colors.red),
                  ))),
                ]),
                 DataRow(cells: [
                  DataCell(Text(LocaleText.getLocaleText(MyApp.getLocale(), "Religious"),)),
                  DataCell(Center(child: Text("25-28"))),
                  DataCell(Center(
                      child: Text(
                    "29",
                    style: TextStyle(color: Colors.red),
                  ))),
                ]),
                DataRow(cells: [
                  DataCell(Text(LocaleText.getLocaleText(MyApp.getLocale(), "Hashkafa"),)),
                  DataCell(Center(child: Text("160 - 170"))),
                  DataCell(Center(
                      child: Text(
                    "168",
                    style: TextStyle(color: Colors.green),
                  ))),
                ]),
                DataRow(cells: [
                  DataCell(Text(LocaleText.getLocaleText(MyApp.getLocale(), "Eda"),)),
                  DataCell(Center(
                      child: Column(
                    children: <Widget>[
                      Spacer(),
                      Text("Jerusalem"),
                      Text("negev"),
                      Spacer(),
                    ],
                  ))),
                  DataCell(Center(
                      child: Text(
                    "Jerusalem",
                    style: TextStyle(color: Colors.green),
                  ))),
                ]),
                DataRow(cells: [
                  DataCell(Text(LocaleText.getLocaleText(MyApp.getLocale(), "Smoking"),)),
                  DataCell(Center(
                      child: Column(
                    children: <Widget>[
                      Spacer(),
                      Text("very"),
                      Spacer(),
                    ],
                  ))),
                  DataCell(Center(
                      child: Text(
                    "not so",
                    style: TextStyle(color: Colors.red),
                  ))),
                ]),
                DataRow(cells: [
                  DataCell(Text(LocaleText.getLocaleText(MyApp.getLocale(), "Height"),)),
                  DataCell(Center(
                      child: Column(
                    children: <Widget>[
                      Spacer(),
                      Text("chabad"),
                      Text("leumi"),
                      Spacer(),
                    ],
                  ))),
                  DataCell(Center(
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Text("chabad", style: TextStyle(color: Colors.green)),
                        Text("charedi", style: TextStyle(color: Colors.red)),
                        Spacer(),
                      ],
                    ),
                  )),
                ]),
                DataRow(cells: [
                  DataCell(Text(LocaleText.getLocaleText(MyApp.getLocale(), "Sherut"),)),
                  DataCell(Center(
                      child: Column(
                    children: <Widget>[
                      Spacer(),
                      Text("ravak"),
                      Spacer(),
                    ],
                  ))),
                  DataCell(Center(
                      child: Text(
                    "ravak",
                    style: TextStyle(color: Colors.green),
                  ))),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
