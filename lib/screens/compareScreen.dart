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
  bool mainSelected = true;
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
                                    backgroundImage: widget.myPerson.profileImages != null && widget.myPerson.profileImages.length > 0
                                        ? NetworkImage(
                                            widget.myPerson.profileImages[0],
                                            //fit: BoxFit.fill,
                                          )
                                        : Container()),
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
                                    backgroundImage: widget.person.profileImages != null && widget.person.profileImages.length > 0
                                        ? NetworkImage(
                                            widget.person.profileImages[0],
                                            //fit: BoxFit.fill,
                                          )
                                        : Container()),
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
                          DataCell(
                            Row(
                          children: <Widget>[
                               if(widget.myPerson.area!=null) Text(StaticFunctions.getArea(widget.myPerson.area),),
                          if(widget.myPerson.area!=null)Text(", "),
                                Text(StaticFunctions.getCountry(widget.myPerson.country),),
                            // Text(
                            //   StaticFunctions.getArea(person.area),
                            // ),
                            Icon(Icons.location_on, color: Colors.purple),
                          ],
                        ),),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.myPerson.gender == Gender.MALE
                                ? widget.myPerson.mySherutBoy.map((e) => Text(StaticFunctions.getSherutBoy(e))).toList()
                                : widget.myPerson.mySherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList(),
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text(StaticFunctions.getAge(widget.person.birthday).toString())),
                          DataCell(   Row(
                          children: <Widget>[
                               if(widget.person.area!=null) Text(StaticFunctions.getArea(widget.person.area),),
                          if(widget.person.area!=null)Text(", "),
                                Text(StaticFunctions.getCountry(widget.person.country),),

                            // Text(
                            //   StaticFunctions.getArea(person.area),
                            // ),
                            Icon(Icons.location_on, color: Colors.purple),
                          ],
                        )),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.person.gender == Gender.MALE
                                ? widget.person.mySherutBoy.map((e) => Text(StaticFunctions.getSherutBoy(e))).toList()
                                : widget.person.mySherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList(),
                          )),
                        ]),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Container(
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
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      mainSelected = true;
                    });
                  },
                  label: Container(
                    child: Text(
                      widget.myPerson.firstName,
                      style: TextStyle(fontWeight: mainSelected ? FontWeight.bold : FontWeight.normal, color: Colors.black),
                    ),
                  ),
                ),
                DataColumn(
                  onSort: (columnIndex, ascending) {
                    setState(() {
                      mainSelected = false;
                    });
                  },
                  label: Container(child: Text(widget.person.firstName, style: TextStyle(fontWeight: !mainSelected ? FontWeight.bold : FontWeight.normal, color: Colors.black))),
                ),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text(LocaleText.getLocaleText(MyApp.getLocale(), "Age"))),
                (mainSelected)?  
                DataCell(Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[Text(widget.myPerson.ageMin.round().toString()), Text("-"), Text(widget.myPerson.ageMax.round().toString())]))):
                          DataCell(Container(
                      child: Text(
                    StaticFunctions.getAge(widget.myPerson.birthday).toString(),
                    style: TextStyle(
                        color: StaticFunctions.getAge(widget.myPerson.birthday) <= widget.person.ageMax && StaticFunctions.getAge(widget.myPerson.birthday) >= widget.person.ageMin
                            ? Colors.green
                            : Colors.red),
                  )))
                          ,
                (mainSelected)?  DataCell(Container(
                      child: Text(
                    StaticFunctions.getAge(widget.person.birthday).toString(),
                    style: TextStyle(
                        color: StaticFunctions.getAge(widget.person.birthday) <= widget.myPerson.ageMax && StaticFunctions.getAge(widget.person.birthday) >= widget.myPerson.ageMin
                            ? Colors.green
                            : Colors.red),
                  ))):
                   DataCell(Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[Text(widget.person.ageMin.round().toString()), Text("-"), Text(widget.person.ageMax.round().toString())])))
                  ,
                ]),
                 DataRow(cells: [
                  DataCell(Text(
                    LocaleText.getLocaleText(MyApp.getLocale(), "Country"),
                  )),
                (mainSelected)?  DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.myPerson.countrys.map((e) => (Text(StaticFunctions.getCountry(e)))).toList()))):
                           DataCell(Container(
                      child: Text(
                    StaticFunctions.getCountry(widget.myPerson.country),
                    style: TextStyle(color: (widget.person.countrys.contains(widget.myPerson.country)) ? Colors.green : Colors.red),
                  ))),
                (mainSelected)?  DataCell(Container(
                      child: Text(
                    StaticFunctions.getCountry(widget.person.country),
                    style: TextStyle(color: (widget.myPerson.countrys.contains(widget.person.country)) ? Colors.green : Colors.red),
                  ))):
                  DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.person.countrys.map((e) => (Text(StaticFunctions.getCountry(e)))).toList())))
                  ,
                ]),

                DataRow(cells: [
                  DataCell(Text(
                    LocaleText.getLocaleText(MyApp.getLocale(), "Area"),
                  )),
                (mainSelected)?  DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.myPerson.areas.map((e) => (Text(StaticFunctions.getArea(e)))).toList()))):
                           DataCell(Container(
                      child: Text(
                    StaticFunctions.getArea(widget.myPerson.area),
                    style: TextStyle(color: (widget.person.areas.contains(widget.myPerson.area)) ? Colors.green : Colors.red),
                  ))),
                (mainSelected)?  DataCell(Container(
                      child: Text(
                    StaticFunctions.getArea(widget.person.area),
                    style: TextStyle(color: (widget.myPerson.areas.contains(widget.person.area)) ? Colors.green : Colors.red),
                  ))):
                  DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.person.areas.map((e) => (Text(StaticFunctions.getArea(e)))).toList())))
                  ,
                ]),
                DataRow(cells: [
                  DataCell(Text(LocaleText.getLocaleText(MyApp.getLocale(), "Status"))),
                (mainSelected)?  DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.myPerson.statuses.map((e) => (Text(StaticFunctions.getStatus(e)))).toList()))):
                          DataCell(Container(
                      child: Text(
                    StaticFunctions.getStatus(widget.myPerson.status),
                    style: TextStyle(color: (widget.person.statuses.contains(widget.myPerson.status)) ? Colors.green : Colors.red),
                  ))),
                (mainSelected)?  DataCell(Container(
                      child: Text(
                    StaticFunctions.getStatus(widget.person.status),
                    style: TextStyle(color: (widget.myPerson.statuses.contains(widget.person.status)) ? Colors.green : Colors.red),
                  ))):
                  DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.person.statuses.map((e) => (Text(StaticFunctions.getStatus(e)))).toList()))),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    LocaleText.getLocaleText(MyApp.getLocale(), "Religious"),
                  )),
                (mainSelected)?  DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.myPerson.doses.map((e) => (Text(StaticFunctions.getDos(e)))).toList()))):
                          DataCell(Container(
                      child: Text(
                    StaticFunctions.getDos(widget.myPerson.dos),
                    style: TextStyle(color: (widget.person.doses.contains(widget.myPerson.dos)) ? Colors.green : Colors.red),
                  ))),
                (mainSelected)?  DataCell(Container(
                      child: Text(
                    StaticFunctions.getDos(widget.person.dos),
                    style: TextStyle(color: (widget.myPerson.doses.contains(widget.person.dos)) ? Colors.green : Colors.red),
                  ))):
                   DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.person.doses.map((e) => (Text(StaticFunctions.getDos(e)))).toList()))),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    LocaleText.getLocaleText(MyApp.getLocale(), "Hashkafa"),
                  )),
                (mainSelected)?  DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.myPerson.hashkafas.map((e) => (Text(StaticFunctions.getHashkafa(e)))).toList()))):
                          DataCell(Container(
                      child: Text(
                    StaticFunctions.getHashkafa(widget.myPerson.hashkafa),
                    style: TextStyle(color: (widget.person.hashkafas.contains(widget.myPerson.hashkafa)) ? Colors.green : Colors.red),
                  ))),
                (mainSelected)?  DataCell(Container(
                      child: Text(
                    StaticFunctions.getHashkafa(widget.person.hashkafa),
                    style: TextStyle(color: (widget.myPerson.hashkafas.contains(widget.person.hashkafa)) ? Colors.green : Colors.red),
                  ))):DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.person.hashkafas.map((e) => (Text(StaticFunctions.getHashkafa(e)))).toList()))),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    LocaleText.getLocaleText(MyApp.getLocale(), "Eda"),
                  )),
                (mainSelected)?  DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.myPerson.edas.map((e) => (Text(StaticFunctions.getEda(e)))).toList()))):DataCell(Container(
                      child: Text(
                    StaticFunctions.getEda(widget.myPerson.eda),
                    style: TextStyle(color: (widget.person.edas.contains(widget.myPerson.eda)) ? Colors.green : Colors.red),
                  ))),
                (mainSelected)?  DataCell(Container(
                      child: Text(
                    StaticFunctions.getEda(widget.person.eda),
                    style: TextStyle(color: (widget.myPerson.edas.contains(widget.person.eda)) ? Colors.green : Colors.red),
                  ))):DataCell(Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.person.edas.map((e) => (Text(StaticFunctions.getEda(e)))).toList()))),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    LocaleText.getLocaleText(MyApp.getLocale(), "Smoking"),
                  )),
                (mainSelected)?  DataCell(Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.myPerson.smoking.map((e) => (Text(StaticFunctions.getSmoke(e)))).toList()))): DataCell(Container(
                      child: Text(
                    StaticFunctions.getSmoke(widget.myPerson.smoke),
                    style: TextStyle(color: (widget.person.smoking.contains(widget.myPerson.smoke)) ? Colors.green : Colors.red),
                  ))),
                (mainSelected)?  DataCell(Container(
                      child: Text(
                    StaticFunctions.getSmoke(widget.person.smoke),
                    style: TextStyle(color: (widget.myPerson.smoking.contains(widget.person.smoke)) ? Colors.green : Colors.red),
                  ))):
                  DataCell(Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widget.person.smoking.map((e) => (Text(StaticFunctions.getSmoke(e)))).toList()))),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    LocaleText.getLocaleText(MyApp.getLocale(), "Height"),
                  )),
                (mainSelected)?  DataCell(Container(
                      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[Text(widget.myPerson.heightMin.toString()), Text("-"), Text(widget.myPerson.heightMax.toString())]))):
                      DataCell(Container(
                      child: Text(
                    widget.myPerson.height.toString(),
                    style: TextStyle(color: widget.myPerson.height <= widget.person.heightMax && widget.myPerson.height >= widget.person.heightMin ? Colors.green : Colors.red),
                  ))),
                (mainSelected)?  DataCell(Container(
                      child: Text(
                    widget.person.height.toString(),
                    style: TextStyle(color: widget.person.height <= widget.myPerson.heightMax && widget.person.height >= widget.myPerson.heightMin ? Colors.green : Colors.red),
                  ))):
                  DataCell(Container(
                      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[Text(widget.person.heightMin.toString()), Text("-"), Text(widget.person.heightMax.toString())]))),
                ]),
                DataRow(cells: [
                  DataCell(Text(
                    LocaleText.getLocaleText(MyApp.getLocale(), "Sherut"),
                  )),
                (mainSelected)?  DataCell(Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.myPerson.gender == Gender.MALE
                          ? widget.myPerson.thereSherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList()
                          : widget.myPerson.thereSherutBoy.map((e) => Text(StaticFunctions.getSherutBoy(e))).toList(),
                    ),
                  )):DataCell(Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.myPerson.gender == Gender.MALE
                          ? widget.person.mySherutBoy
                              .map((e) => Text(
                                    StaticFunctions.getSherutBoy(e),
                                    style: TextStyle(color: (widget.person.thereSherutBoy.contains(e) ? Colors.green : Colors.red)),
                                  ))
                              .toList()
                          : widget.myPerson.mySherutGirl
                              .map((e) => Text(
                                    StaticFunctions.getSherutGirl(e),
                                    style: TextStyle(color: (widget.person.thereSherutGirl.contains(e) ? Colors.green : Colors.red)),
                                  ))
                              .toList(),
                    ),
                  )),
                (mainSelected)?  DataCell(Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.person.gender == Gender.MALE
                          ? widget.myPerson.mySherutBoy
                              .map((e) => Text(
                                    StaticFunctions.getSherutBoy(e),
                                    style: TextStyle(color: (widget.myPerson.thereSherutBoy.contains(e) ? Colors.green : Colors.red)),
                                  ))
                              .toList()
                          : widget.person.mySherutGirl
                              .map((e) => Text(
                                    StaticFunctions.getSherutGirl(e),
                                    style: TextStyle(color: (widget.myPerson.thereSherutGirl.contains(e) ? Colors.green : Colors.red)),
                                  ))
                              .toList(),
                    ),
                  )):DataCell(Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.person.gender == Gender.MALE
                          ? widget.person.thereSherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList()
                          : widget.person.thereSherutBoy.map((e) => Text(StaticFunctions.getSherutBoy(e))).toList(),
                    ),
                  )),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
