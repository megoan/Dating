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
  _scrollListener() {}

  Widget avatarPhoto(screenSize, {bool mainSelected: true}) {
    return Container(
        // width: mainSelected? (screenSize.width* 0.333)-8:(screenSize.width * 0.666)-4,
        //   height:  200,
        width: (screenSize.width / 2) - 5,
        height: (screenSize.width / 2) - 5,
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
    TextStyle agestyle = TextStyle(
        fontSize: 17,
        color: StaticFunctions.getAge(widget.person.birthday) <= widget.myPerson.ageMax && StaticFunctions.getAge(widget.person.birthday) >= widget.myPerson.ageMin ? Colors.green : Colors.red);
    TextStyle heightStyle = TextStyle(fontSize: 17, color: widget.person.height <= widget.myPerson.heightMax && widget.person.height >= widget.myPerson.heightMin ? Colors.green : Colors.red);

    return Container(
      color: Colors.white,
      //width: mainSelected? (screenSize.width* 0.666)-0.5:(screenSize.width * 0.333)-0.5,
      // width: (screenSize.width / 2) - 0.5,

      child: Column(
        children: <Widget>[
          //Age
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
                        color: Colors.purple,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Text(
                          StaticFunctions.getAge(widget.myPerson.birthday).toString(),
                          style: TextStyle(fontSize: 18),
                        ),
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
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    right: BorderSide(
                      width: 0.5,
                      color: Colors.purple,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text(
                        StaticFunctions.getAge(widget.person.birthday).toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            widget.person.ageMin.round().toString(),
                            style: agestyle,
                          ),
                          Text("-", style: agestyle),
                          Text(widget.person.ageMax.round().toString(), style: agestyle)
                        ],
                      ),
                    ]),
                  ),
                ))
              ],
            ),
          ),
          //Country
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
                        color: Colors.purple,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Text(StaticFunctions.getCountry(widget.myPerson.country)),
                        SizedBox(
                          width: 60,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: widget.myPerson.countrys
                                  .map((e) => (Text(StaticFunctions.getCountry(e),
                                      maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.myPerson.countrys.contains(widget.person.country)) ? Colors.green : Colors.red))))
                                  .toList()),
                        )
                        // Text(
                        //   widget.myPerson.countrys.map((country) => StaticFunctions.getCountry(country)).toList().join('\n'),
                        //   style: TextStyle(color: (widget.myPerson.countrys.contains(widget.person.country)) ? Colors.green : Colors.red),
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
                      color: Colors.purple,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text(StaticFunctions.getCountry(widget.person.country)),
                      SizedBox(
                          width: 60,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: widget.person.countrys
                                  .map((e) => (Text(StaticFunctions.getCountry(e),
                                      maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.person.countrys.contains(widget.myPerson.country)) ? Colors.green : Colors.red))))
                                  .toList()))
                    ]),
                  ),
                ))
              ],
            ),
          ),
          //Area
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
                        color: Colors.purple,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Text(StaticFunctions.getArea(widget.myPerson.area)),
                        SizedBox(
                            width: 60,
                            child: (Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: widget.myPerson.areas
                                    .map((e) => (Text(StaticFunctions.getArea(e),
                                        maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.myPerson.countrys.contains(widget.person.country)) ? Colors.green : Colors.red))))
                                    .toList())))
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
                      color: Colors.purple,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text(StaticFunctions.getArea(widget.person.area)),
                      SizedBox(
                          width: 60,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: widget.person.areas
                                  .map((e) => (Text(StaticFunctions.getArea(e),
                                      maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.person.countrys.contains(widget.myPerson.country)) ? Colors.green : Colors.red))))
                                  .toList()))
                    ]),
                  ),
                ))
              ],
            ),
          ),
          //Status
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
                        color: Colors.purple,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Text(StaticFunctions.getStatus(widget.myPerson.status)),
                        SizedBox(
                          width: 60,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: widget.myPerson.statuses
                                  .map((e) => (Text(StaticFunctions.getStatus(e),
                                      maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.myPerson.statuses.contains(widget.person.status)) ? Colors.green : Colors.red))))
                                  .toList()),
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
                      color: Colors.purple,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text(StaticFunctions.getStatus(widget.person.status)),
                      SizedBox(
                          width: 60,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: widget.person.statuses
                                  .map((e) => (Text(StaticFunctions.getStatus(e),
                                      maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.person.statuses.contains(widget.myPerson.status)) ? Colors.green : Colors.red))))
                                  .toList()))
                    ]),
                  ),
                ))
              ],
            ),
          ),
          //Religious
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
                        color: Colors.purple,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Text(StaticFunctions.getDos(widget.myPerson.dos)),
                        SizedBox(
                            width: 60,
                            child: (Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: widget.myPerson.doses
                                    .map((e) => (Text(StaticFunctions.getDos(e),
                                        maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.myPerson.doses.contains(widget.person.dos)) ? Colors.green : Colors.red))))
                                    .toList())))
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
                      color: Colors.purple,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text(StaticFunctions.getDos(widget.person.dos)),
                      SizedBox(
                          width: 60,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: widget.person.doses
                                  .map((e) => (Text(StaticFunctions.getDos(e),
                                      maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.person.doses.contains(widget.myPerson.dos)) ? Colors.green : Colors.red))))
                                  .toList()))
                    ]),
                  ),
                ))
              ],
            ),
          ),
          //Hashkafa
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
                        color: Colors.purple,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Text(StaticFunctions.getHashkafa(widget.myPerson.hashkafa)),
                        SizedBox(
                            width: 60,
                            child: (Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: widget.myPerson.hashkafas
                                    .map((e) => (Text(StaticFunctions.getHashkafa(e),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: (widget.myPerson.hashkafas.contains(widget.person.hashkafa)) ? Colors.green : Colors.red))))
                                    .toList())))
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
                      color: Colors.purple,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text(StaticFunctions.getHashkafa(widget.person.hashkafa)),
                      SizedBox(
                          width: 60,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: widget.person.hashkafas
                                  .map((e) => (Text(StaticFunctions.getHashkafa(e),
                                      maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.person.hashkafas.contains(widget.myPerson.hashkafa)) ? Colors.green : Colors.red))))
                                  .toList()))
                    ]),
                  ),
                ))
              ],
            ),
          ),
          //Eda
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
                        color: Colors.purple,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Text(StaticFunctions.getEda(widget.myPerson.eda)),
                        SizedBox(
                            width: 60,
                            child: (Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: widget.myPerson.edas
                                    .map((e) => (Text(StaticFunctions.getEda(e),
                                        maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.myPerson.edas.contains(widget.person.eda)) ? Colors.green : Colors.red))))
                                    .toList())))
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
                      color: Colors.purple,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text(StaticFunctions.getEda(widget.person.eda)),
                      SizedBox(
                          width: 60,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: widget.person.edas
                                  .map((e) => (Text(StaticFunctions.getEda(e),
                                      maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.person.edas.contains(widget.myPerson.eda)) ? Colors.green : Colors.red))))
                                  .toList()))
                    ]),
                  ),
                ))
              ],
            ),
          ),
          //Smoking
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
                        color: Colors.purple,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Text(StaticFunctions.getSmoke(widget.myPerson.smoke)),
                        SizedBox(
                            width: 60,
                            child: (Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: widget.myPerson.smoking
                                    .map((e) => (Text(StaticFunctions.getSmoke(e),
                                        maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.myPerson.smoking.contains(widget.person.smoke)) ? Colors.green : Colors.red))))
                                    .toList())))
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
                      color: Colors.purple,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text(StaticFunctions.getSmoke(widget.person.smoke)),
                      SizedBox(
                          width: 60,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: widget.person.smoking
                                  .map((e) => (Text(StaticFunctions.getSmoke(e),
                                      maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: (widget.person.smoking.contains(widget.myPerson.smoke)) ? Colors.green : Colors.red))))
                                  .toList()))
                    ]),
                  ),
                ))
              ],
            ),
          ),
          //height
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
                        color: Colors.purple,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Text(
                          widget.myPerson.height.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              widget.myPerson.heightMin.toString(),
                              style: heightStyle,
                            ),
                            Text("-", style: heightStyle),
                            Text(widget.myPerson.heightMax.toString(), style: heightStyle)
                          ],
                        ),
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
                      color: Colors.purple,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      Text(
                        widget.person.height.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            widget.person.heightMin.toString(),
                            style: heightStyle,
                          ),
                          Text("-", style: heightStyle),
                          Text(widget.person.heightMax.toString(), style: heightStyle)
                        ],
                      ),
                    ]),
                  ),
                ))
              ],
            ),
          ),
          //sherut
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
                        color: Colors.purple,
                      ),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        SizedBox(
                            width: 60,
                            child: (Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: widget.myPerson.gender == Gender.MALE
                                  ? widget.myPerson.mySherutBoy != null ? widget.myPerson.mySherutBoy.map((e) => Text(StaticFunctions.getSherutBoy(e))).toList() : []
                                  : widget.myPerson.mySherutGirl != null ? widget.myPerson.mySherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList() : [],
                            ))),
                        SizedBox(
                            width: 60,
                            child: (Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: widget.myPerson.gender == Gender.MALE
                                  ? widget.myPerson.thereSherutGirl
                                      .map((e) => Text(
                                            StaticFunctions.getSherutGirl(e),
                                            style: TextStyle(color: (widget.person.thereSherutBoy.contains(e) ? Colors.green : Colors.red)),
                                          ))
                                      .toList()
                                  : widget.myPerson.thereSherutBoy
                                      .map((e) => Text(
                                            StaticFunctions.getSherutBoy(e),
                                            style: TextStyle(color: (widget.person.thereSherutGirl.contains(e) ? Colors.green : Colors.red)),
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
                      color: Colors.purple,
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      SizedBox(
                          width: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.person.gender == Gender.MALE
                                ? widget.person.mySherutBoy != null ? widget.person.mySherutBoy.map((e) => Text(StaticFunctions.getSherutBoy(e))).toList() : []
                                : widget.person.mySherutGirl != null ? widget.person.mySherutGirl.map((e) => Text(StaticFunctions.getSherutGirl(e))).toList() : [],
                          )),
                      SizedBox(
                          width: 60,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: widget.person.gender == Gender.MALE
                                ? widget.person.thereSherutGirl
                                    .map((e) => Text(
                                          StaticFunctions.getSherutGirl(e),
                                          style: TextStyle(color: (widget.myPerson.thereSherutBoy.contains(e) ? Colors.green : Colors.red)),
                                        ))
                                    .toList()
                                : widget.person.thereSherutBoy
                                    .map((e) => Text(
                                          StaticFunctions.getSherutBoy(e),
                                          style: TextStyle(color: (widget.myPerson.thereSherutGirl.contains(e) ? Colors.green : Colors.red)),
                                        ))
                                    .toList(),
                          ))
                    ]),
                  ),
                ))
              ],
            ),
          ),
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
                  Row(children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 25),
                          child: Text(
                            widget.myPerson.firstName,
                            style: TextStyle(fontSize: 25, color: Colors.deepPurple, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(width: 1, color: Colors.purple),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 25),
                          child: Text(
                            widget.person.firstName,
                            style: TextStyle(fontSize: 25, color: Colors.deepPurple, fontWeight: FontWeight.bold),
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
                     Container(width: 1, color: Colors.purple),
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
