import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/main.dart';
import 'package:dating/widgets/shadchanDialog.dart';
import 'package:flutter/material.dart';
import 'package:dating/screens/profileInfo.dart';
import 'loader.dart';

class PersonListCardTest extends StatefulWidget {
  final int index;
  PersonListCardTest(this.index);
  bool favorite = false;
   var image;
  @override
  _PersonListCardTestState createState() => _PersonListCardTestState();
}

class _PersonListCardTestState extends State<PersonListCardTest> {
 

  

  @override
  Widget build(BuildContext context) {
    return Align(
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: GestureDetector(
           onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInfo(index: widget.index)));
                      },
                  child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Hero(
              tag: 'imageHero'+widget.index.toString(), child:
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: 'https://placeimg.com/640/480/any',
                  placeholder: (context, url) => Loader(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
                DecoratedBox(
                  decoration: new BoxDecoration(
                    //color: Colors.lightGreen
                    gradient: new LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black54,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.person, color: Colors.white),
                          Padding(
                            padding: MyApp.getLocale()=="he"? const EdgeInsets.only(right: 10):const EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Text("שמואל",  style:  TextStyle(fontSize: 18, color: Colors.white)),
                                Text(" ,",  style:  TextStyle(fontSize: 18, color: Colors.white)),
                                 Text("25",  style:  TextStyle(fontSize: 18, color: Colors.white)),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_city, color: Colors.white),
                          Padding(
                            padding: MyApp.getLocale()=="he"? const EdgeInsets.only(right: 10):const EdgeInsets.only(left: 10),
                            child: Text("בית שמש",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.white)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.short_text, color: Colors.white),
                          Padding(
                            padding: MyApp.getLocale()=="he"? const EdgeInsets.only(right: 10):const EdgeInsets.only(left: 10),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text("dsfjhfgsh djkasdfg dsfsdfsdf h",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white))),
                          )
                        ],
                      ),
                      Spacer(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                     widget.favorite=!widget.favorite;
                                });
                             
                              },
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    size: 55,
                                    color:widget.favorite?Colors.white:Colors.deepPurple,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 40,
                                    color:widget.favorite?Colors.deepPurple:Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                title: "Shlomit Shadchanit",
                                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                buttonText: "Okay",
                              ),
                            );
                          },
                                                      child: Container(
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: <Widget>[
                                      Container(
                                        width: 100,
                                        height: 100,
                                        child: CircleAvatar(
                                          radius: 100,
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      Container(
                                        width: 93,
                                        height: 93,
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl:
                                                'https://placeimg.com/640/480/any',
                                            placeholder: (context, url) => Loader(),
                                            errorWidget: (context, url, error) =>
                                                Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 58),
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional.center,
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
                                              padding:
                                                  const EdgeInsets.only(top: 70),
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional.center,
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
                                              padding:
                                                  const EdgeInsets.only(top: 58),
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional.center,
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
                                      Positioned(
                                        top: 0,
                                        right: 10,
                                        child: Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundColor:
                                                  Theme.of(context).primaryColor,
                                            ),
                                            CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //  Positioned.fill(
                //   child: new Material(
                //       color: Colors.transparent,
                //       child: new InkWell(
                //         onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInfo(index)));
                //         },
                //       ))),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
