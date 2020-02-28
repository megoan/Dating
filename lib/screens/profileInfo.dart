import 'package:dating/models/person.dart';
import 'package:dating/models/shadchan.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:dating/widgets/shadchanDialog.dart';
import 'package:dating/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/widgets/loader.dart';

import '../main.dart';
import 'compareThemList.dart';

class ProfileInfo extends StatefulWidget {
  Person person;
  Shadchan shadchan;
  ProfileInfo({this.person,this.shadchan});
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.person.firstName),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                      bottom: 0,
                      left: 20,
                      child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                shadchan: widget.shadchan,
                              ),
                            );
                          },
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: <Widget>[
                                    Hero(
                                      tag: "shadchanImage",
                                      child: Stack(
                                        alignment: AlignmentDirectional.center,
                                        children: <Widget>[
                                          Container(
                                            width: 70,
                                            height: 70,
                                            child: CircleAvatar(
                                              radius: 70,
                                              backgroundColor: Theme.of(context).primaryColor,
                                            ),
                                          ),
                                          Container(
                                            width: 65,
                                            height: 65,
                                            child: ClipOval(
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: widget.shadchan.image,
                                                placeholder: (context, url) => Loader(),
                                                errorWidget: (context, url, error) => Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        widget.shadchan.isOnline?  MyApp.getLocale() == "he"
                                              ? Positioned(
                                                  top: 0,
                                                  // MyApp.getLocale()=="he"?  left:0: right: 0,
                                                  right: 0,
                                                  child: Stack(
                                                    alignment: AlignmentDirectional.center,
                                                    children: <Widget>[
                                                      CircleAvatar(
                                                        radius: 5,
                                                        backgroundColor: Colors.green,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Positioned(
                                                  top: 0,
                                                  // MyApp.getLocale()=="he"?  left:0: right: 0,
                                                  left: 0,
                                                  child: Stack(
                                                    alignment: AlignmentDirectional.center,
                                                    children: <Widget>[
                                                      CircleAvatar(
                                                        radius: 5,
                                                        backgroundColor: Colors.green,
                                                      ),
                                                    ],
                                                  ),
                                                ):Container(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                FittedBox(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.star,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.cyan,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.star,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.cyan,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.star,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                            Icon(
                                              Icons.star,
                                              color: Colors.cyan,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ))),
                  Positioned(
                    bottom: 10,
                    right: 20,
                    child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: OutlineButton(
                            onPressed: () {
                              Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new CompareThemList(widget.person,widget.shadchan)));
                            },
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    LocaleText.getLocaleText(MyApp.getLocale(), 'Compare'),
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                ],
                              ),
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                              color: Colors.purple, //Color of the border
                              style: BorderStyle.solid, //Style of the border
                              width: 1, //width of the border
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          color: Colors.purple,
                        ),
                        Container(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    child: CircleAvatar(radius: 200, backgroundColor: Colors.white),
                  ),
                  Container(
                    width: 180,
                    height: 180,
                    child: ClipOval(
                        child: Hero(
                      tag: 'imageHero' + widget.person.id.toString(),
                      child:widget.person.profileImages!=null?  CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:widget.person.profileImages[0],
                        placeholder: (context, url) => Loader(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ):Container(),
                    )),
                  ),
                  //   Positioned(top:0, child: TopBar())
                ],
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.person.firstName,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "${StaticFunctions.getAge(widget.person.birthday)}",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          StaticFunctions.getArea(widget.person.area),
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.location_on,
                          color: Colors.black54,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.person.short),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                        Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                          Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Status'), style: TextStyle(color: Colors.purple[300], fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                             StaticFunctions.getStatus(widget.person.status),
                            style: TextStyle(color: Colors.black54),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Hashkafa'), style: TextStyle(color: Colors.purple[300], fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text(
                            StaticFunctions.getHashkafa(widget.person.hashkafa),
                            style: TextStyle(color: Colors.black54),
                          )
                        ]),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Height'), style: TextStyle(color: Colors.purple[300], fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text(
                               (widget.person.height.toString()),
                              style: TextStyle(color: Colors.black54),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Religious'), style: TextStyle(color: Colors.purple[300], fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text(
                              StaticFunctions.getDos(widget.person.dos),
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Smoking'), style: TextStyle(color: Colors.purple[300], fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text(
                               StaticFunctions.getSmoke(widget.person.smoke),
                              style: TextStyle(color: Colors.black54),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text( LocaleText.getLocaleText(MyApp.getLocale(), 'Eda'), style: TextStyle(color: Colors.purple[300], fontSize: 20, fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text(
                               StaticFunctions.getEda(widget.person.eda),
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      color: Colors.purple[100],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                          Text(
                            LocaleText.getLocaleText(MyApp.getLocale(), 'Who am I'),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 200,
                            child: Divider(
                              thickness: 1,
                              color: Colors.black26,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(widget.person.long),
                         
                          SizedBox(height: 40),
                          Text(
                            LocaleText.getLocaleText(MyApp.getLocale(), 'What am I looking for'),
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 200,
                            child: Divider(
                              thickness: 1,
                              color: Colors.black26,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(widget.person.moreInfo),
                          SizedBox(height: 40),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
