import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/main.dart';
import 'package:dating/models/person.dart';
import 'package:dating/models/shadchan.dart';

import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:dating/widgets/shadchanDialog.dart';
import 'package:flutter/material.dart';
import 'package:dating/screens/profileInfo.dart';
import 'package:provider/provider.dart';
import 'loader.dart';

class PersonListCardTest extends StatefulWidget {
  final Person person;
  final Shadchan shadchan;
  PersonListCardTest(this.person, this.shadchan);
  var image;
  @override
  _PersonListCardTestState createState() => _PersonListCardTestState();
}

class _PersonListCardTestState extends State<PersonListCardTest> {
  @override
  Widget build(BuildContext context) {
    PersonProvider personProvider = Provider.of<PersonProvider>(context);
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileInfo(
                          person: widget.person,
                          shadchan: widget.shadchan,
                        )));
          },
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(15),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Hero(
                    tag: 'imageHero' + widget.person.id.toString(),
                    child: widget.person.profileImages != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: widget.person.profileImages[0],
                              placeholder: (context, url) => Loader(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          )
                        : Container()),
                DecoratedBox(
                  decoration: new BoxDecoration(
                    //color: Colors.lightGreen
                    gradient: new LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                        Colors.black87,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                     Spacer(
                        // height: 3,
                      ),
                      Row(
                        children: <Widget>[
                          // Icon(Icons.person, color: Colors.white),
                          Padding(
                            padding: MyApp.getLocale() == "he" ? const EdgeInsets.only(right: 2) : const EdgeInsets.only(left: 2),
                            child: Row(
                              children: <Widget>[
                                Text(widget.person.firstName, style: TextStyle(fontSize: 20, color: Colors.white)),
                                Text(" ,", style: TextStyle(fontSize: 20, color: Colors.white)),
                                Text(StaticFunctions.getAge(widget.person.birthday).toString(), style: TextStyle(fontSize: 20, color: Colors.white)),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                         height: 3,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on, color: Colors.white),
                          Padding(
                            padding: MyApp.getLocale() == "he" ? const EdgeInsets.only(right: 5) : const EdgeInsets.only(left: 5),
                            child:
                             SizedBox(
                               width: 120,
                                      child: 
                                  (widget.person.area != null) ?Text(StaticFunctions.getArea(widget.person.area)+", "+StaticFunctions.getCountry(widget.person.country), style: TextStyle(fontSize: 15, color: Colors.white)):
                                  
                                  Text(StaticFunctions.getCountry(widget.person.country), style: TextStyle(fontSize: 15, color: Colors.white)),
                            //     ],
                            // ),
                             ),
                          )
                        ],
                      ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      // Row(
                      //   children: <Widget>[
                      //     Icon(Icons.short_text, color: Colors.white),
                      //     Padding(
                      //       padding: MyApp.getLocale() == "he" ? const EdgeInsets.only(right: 10) : const EdgeInsets.only(left: 10),
                      //       child: FittedBox(fit: BoxFit.fitWidth, child: Text(widget.person.short, style: TextStyle(fontSize: 15, color: Colors.white))),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          left:-6,
          child: InkWell(
            onTap: () {
              setState(() {
                personProvider.switchFavorite(widget.person.id);
              });
            },
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Icon(
                  Icons.star,
                  size: 45,
                  color: personProvider.shadchanProvider.myFavorites.containsKey(widget.person.id) ? Colors.white : Theme.of(context).accentColor,
                ),
                Icon(
                  Icons.star,
                  size: 40,
                  color: personProvider.shadchanProvider.myFavorites.containsKey(widget.person.id) ? Theme.of(context).accentColor : Colors.white,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
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
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  // Container(
                  //   width: 50,
                  //   height: 50,
                  //   child: CircleAvatar(
                  //     radius: 100,
                  //     backgroundColor: Theme.of(context).accentColor,
                  //   ),
                  // ),
                  Container(
                    width: 48,
                    height: 48,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.shadchan.image,
                        placeholder: (context, url) => Loader(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  if (false)
                    FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 58),
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
                            padding: const EdgeInsets.only(top: 70),
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
                            padding: const EdgeInsets.only(top: 58),
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
                  // if (widget.shadchan.isOnline != null && widget.shadchan.isOnline == true)
                  //   Positioned(
                  //     top: 0,
                  //     right: 10,
                  //     child: Stack(
                  //       alignment: AlignmentDirectional.center,
                  //       children: <Widget>[
                  //         CircleAvatar(
                  //           radius: 13,
                  //           backgroundColor: Theme.of(context).primaryColor,
                  //         ),
                  //         CircleAvatar(
                  //           radius: 10,
                  //           backgroundColor: Colors.green,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
