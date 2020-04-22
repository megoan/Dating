import 'package:dating/main.dart';
import 'package:dating/models/person.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

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

  Widget avatarPhoto(screenSize, {bool mainSelected: true}) {
    return Container(
      // width: mainSelected? (screenSize.width* 0.333)-8:(screenSize.width * 0.666)-4,
      //   height:  200,
        width: (screenSize.width / 2)-5,
        height: (screenSize.width / 2)-5,
        decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius:
                mainSelected ? BorderRadius.only(bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)) : BorderRadius.only(bottomRight: Radius.circular(30), topRight: Radius.circular(30)),
            image: new DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  mainSelected ? widget.myPerson.profileImages[0] : widget.person.profileImages[0],
                ))));
  }

  Widget personalDetails(screenSize, {bool mainSelected: true}) {
    Person currentPerson = mainSelected ? widget.myPerson : widget.person;
    Person otherPerson = mainSelected ? widget.person : widget.myPerson;
    TextStyle agestyle = TextStyle(
        fontSize: 17, color: StaticFunctions.getAge(otherPerson.birthday) <= currentPerson.ageMax && StaticFunctions.getAge(otherPerson.birthday) >= currentPerson.ageMin ? Colors.green : Colors.red);
    TextStyle heightStyle = TextStyle(fontSize: 17, color: otherPerson.height <= currentPerson.heightMax && otherPerson.height >= currentPerson.heightMin ? Colors.green : Colors.red);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
       width: mainSelected? (screenSize.width* 0.666)-0.5:(screenSize.width * 0.333)-0.5,
      //width: (screenSize.width / 2) - 0.5,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius:
            mainSelected ? BorderRadius.only(bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)) : BorderRadius.only(bottomRight: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 25),
            child: Text(
              currentPerson.firstName,
              style: TextStyle(fontSize: 25, color: Colors.deepPurple, fontWeight: FontWeight.bold),
            ),
          ),
          //Age
          Stack(
                      children:[ Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                width: double.infinity,
                color: Colors.grey[200],
                child: 
                mainSelected?
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  Text(
                    StaticFunctions.getAge(currentPerson.birthday).toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        currentPerson.ageMin.round().toString(),
                        style: agestyle,
                      ),
                      Text("-", style: agestyle),
                      Text(currentPerson.ageMax.round().toString(), style: agestyle)
                    ],
                  ),
                ])
                :  Center(
                  child: Text(
                      StaticFunctions.getAge(currentPerson.birthday).toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                ),
                ),
                // if(mainSelected)
                // Positioned(
                //  left: -10,
                  
                //   child: Icon(Icons.check_circle),
                // )
                ]

          ),
          //Country
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: 
            mainSelected?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(StaticFunctions.getCountry(currentPerson.country)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: currentPerson.countrys
                        .map((e) => (Text(StaticFunctions.getCountry(e), style: TextStyle(color: (currentPerson.countrys.contains(otherPerson.country)) ? Colors.green : Colors.red))))
                        .toList())
                // Text(
                //   currentPerson.countrys.map((country) => StaticFunctions.getCountry(country)).toList().join('\n'),
                //   style: TextStyle(color: (currentPerson.countrys.contains(otherPerson.country)) ? Colors.green : Colors.red),
                // ),
              ],
            )
            :Center(child: Text(StaticFunctions.getCountry(currentPerson.country)) ,),
          ),
          //Area
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            color: Colors.grey[200],
            child:
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(StaticFunctions.getArea(currentPerson.area)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: currentPerson.areas
                        .map((e) => (Text(StaticFunctions.getArea(e), style: TextStyle(color: (currentPerson.countrys.contains(otherPerson.country)) ? Colors.green : Colors.red))))
                        .toList())
              ],
            ),
          ),
          //Status
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(StaticFunctions.getStatus(currentPerson.status)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: currentPerson.statuses
                        .map((e) => (Text(StaticFunctions.getStatus(e), style: TextStyle(color: (currentPerson.statuses.contains(otherPerson.status)) ? Colors.green : Colors.red))))
                        .toList())
              ],
            ),
          ),
          //Religious
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(StaticFunctions.getDos(currentPerson.dos)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: currentPerson.doses
                        .map((e) => (Text(StaticFunctions.getDos(e), style: TextStyle(color: (currentPerson.doses.contains(otherPerson.dos)) ? Colors.green : Colors.red))))
                        .toList())
              ],
            ),
          ),
          //Hashkafa
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(StaticFunctions.getHashkafa(currentPerson.hashkafa)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: currentPerson.hashkafas
                        .map((e) => (Text(StaticFunctions.getHashkafa(e), style: TextStyle(color: (currentPerson.hashkafas.contains(otherPerson.hashkafa)) ? Colors.green : Colors.red))))
                        .toList())
              ],
            ),
          ),
          //Eda
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(StaticFunctions.getEda(currentPerson.eda)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                        currentPerson.edas.map((e) => (Text(StaticFunctions.getEda(e), style: TextStyle(color: (currentPerson.edas.contains(otherPerson.eda)) ? Colors.green : Colors.red)))).toList())
              ],
            ),
          ),
          //Smoking
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(StaticFunctions.getSmoke(currentPerson.smoke)),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: currentPerson.smoking
                        .map((e) => (Text(StaticFunctions.getSmoke(e), style: TextStyle(color: (currentPerson.smoking.contains(otherPerson.smoke)) ? Colors.green : Colors.red))))
                        .toList())
              ],
            ),
          ),
          //Sherut
          Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              color: Colors.grey[200],
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                Text(
                  currentPerson.height.toString(),
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      currentPerson.heightMin.toString(),
                      style: heightStyle,
                    ),
                    Text("-", style: heightStyle),
                    Text(currentPerson.heightMax.toString(), style: heightStyle)
                  ],
                ),
              ])),
          //sherut
          Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  //currentPerson.thereSherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList()
                  currentPerson.gender == Gender.MALE
                      ?currentPerson.mySherutBoy!=null?
                      currentPerson.mySherutBoy.map((e) => Text(StaticFunctions.getSherutBoy(e))).toList():
                      []
                      :
                      currentPerson.mySherutGirl!=null?
                      currentPerson.mySherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList():
                     []
                       ,
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: currentPerson.gender == Gender.MALE
                          ?currentPerson.thereSherutGirl
                              .map((e) => Text(
                                    StaticFunctions.getSherutGirl(e),
                                    style: TextStyle(color: (otherPerson.thereSherutBoy.contains(e) ? Colors.green : Colors.red)),
                                  ))
                              .toList()
                          : currentPerson.thereSherutBoy
                              .map((e) => Text(
                                    StaticFunctions.getSherutBoy(e),
                                    style: TextStyle(color: (otherPerson.thereSherutGirl.contains(e) ? Colors.green : Colors.red)),
                                  ))
                              .toList(),
                    ),
                  ],
                ),
              ])),
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
      backgroundColor: Colors.deepPurple[500],
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
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    personalDetails(screenSize, mainSelected: mainSelected),
                    personalDetails(screenSize, mainSelected: !mainSelected),
                  ]),
                   SizedBox(height: 40),
                  // Container(
                  //   color: Colors.white,
                  //   child: DataTable(
                  //     dataRowHeight: 100,
                  //     columns: [
                  //       DataColumn(label: Text("")),
                  //       DataColumn(
                  //         onSort: (columnIndex, ascending) {
                  //           setState(() {
                  //             mainSelected = true;
                  //           });
                  //         },
                  //         label: Container(
                  //           child: Text(
                  //             widget.myPerson.firstName,
                  //             style: TextStyle(fontWeight: mainSelected ? FontWeight.bold : FontWeight.normal, color: Colors.black),
                  //           ),
                  //         ),
                  //       ),
                  //       DataColumn(
                  //         onSort: (columnIndex, ascending) {
                  //           setState(() {
                  //             mainSelected = false;
                  //           });
                  //         },
                  //         label: Container(child: Text(widget.person.firstName, style: TextStyle(fontWeight: !mainSelected ? FontWeight.bold : FontWeight.normal, color: Colors.black))),
                  //       ),
                  //     ],
                  //     rows: [
                  //       DataRow(selected: true, cells: [
                  //         DataCell(Text(
                  //           LocaleText.getLocaleText(MyApp.getLocale(), "Sherut"),
                  //         )),
                  //         (mainSelected)
                  //             ? DataCell(Container(
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: widget.myPerson.gender == Gender.MALE
                  //                       ? widget.myPerson.thereSherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList()
                  //                       : widget.myPerson.thereSherutBoy.map((e) => Text(StaticFunctions.getSherutBoy(e))).toList(),
                  //                 ),
                  //               ))
                  //             : DataCell(Container(
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: widget.myPerson.gender == Gender.MALE
                  //                       ? widget.person.mySherutBoy
                  //                           .map((e) => Text(
                  //                                 StaticFunctions.getSherutBoy(e),
                  //                                 style: TextStyle(color: (widget.person.thereSherutBoy.contains(e) ? Colors.green : Colors.red)),
                  //                               ))
                  //                           .toList()
                  //                       : widget.myPerson.mySherutGirl
                  //                           .map((e) => Text(
                  //                                 StaticFunctions.getSherutGirl(e),
                  //                                 style: TextStyle(color: (widget.person.thereSherutGirl.contains(e) ? Colors.green : Colors.red)),
                  //                               ))
                  //                           .toList(),
                  //                 ),
                  //               )),
                  //         (mainSelected)
                  //             ? DataCell(Container(
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: widget.person.gender == Gender.MALE
                  //                       ? widget.myPerson.mySherutBoy
                  //                           .map((e) => Text(
                  //                                 StaticFunctions.getSherutBoy(e),
                  //                                 style: TextStyle(color: (widget.myPerson.thereSherutBoy.contains(e) ? Colors.green : Colors.red)),
                  //                               ))
                  //                           .toList()
                  //                       : widget.person.mySherutGirl
                  //                           .map((e) => Text(
                  //                                 StaticFunctions.getSherutGirl(e),
                  //                                 style: TextStyle(color: (widget.myPerson.thereSherutGirl.contains(e) ? Colors.green : Colors.red)),
                  //                               ))
                  //                           .toList(),
                  //                 ),
                  //               ))
                  //             : DataCell(Container(
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: widget.person.gender == Gender.MALE
                  //                       ? widget.person.thereSherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList()
                  //                       : widget.person.thereSherutBoy.map((e) => Text(StaticFunctions.getSherutBoy(e))).toList(),
                  //                 ),
                  //               )),
                  //       ]),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
    );
  }
}
