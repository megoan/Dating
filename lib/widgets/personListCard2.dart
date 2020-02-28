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
  PersonListCardTest(this.person,this.shadchan);
  var image;
  @override
  _PersonListCardTestState createState() => _PersonListCardTestState();
}

class _PersonListCardTestState extends State<PersonListCardTest> {
  @override
  Widget build(BuildContext context) {
   PersonProvider personProvider = Provider.of<PersonProvider>(context);
    return Align(
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileInfo(person: widget.person,shadchan: widget.shadchan,)));
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
                    tag: 'imageHero' + widget.person.id.toString(),
                    child: widget.person.profileImages!=null?CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:  widget.person.profileImages[0],
                      placeholder: (context, url) => Loader(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ):Container()),
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
                            padding: MyApp.getLocale() == "he" ? const EdgeInsets.only(right: 10) : const EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Text(widget.person.firstName, style: TextStyle(fontSize: 18, color: Colors.white)),
                                Text(" ,", style: TextStyle(fontSize: 18, color: Colors.white)),
                                Text(StaticFunctions.getAge(widget.person.birthday).toString(), style: TextStyle(fontSize: 18, color: Colors.white)),
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
                            padding: MyApp.getLocale() == "he" ? const EdgeInsets.only(right: 10) : const EdgeInsets.only(left: 10),
                            child: Text(
                             StaticFunctions.getArea(widget.person.area), style: TextStyle(fontSize: 18, color: Colors.white)),
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
                            padding: MyApp.getLocale() == "he" ? const EdgeInsets.only(right: 10) : const EdgeInsets.only(left: 10),
                            child: FittedBox(fit: BoxFit.fitWidth, child: Text(widget.person.short, style: TextStyle(fontSize: 18, color: Colors.white))),
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
                                    size: 55,
                                    color: personProvider.shadchanProvider.myFavorites.containsKey(widget.person.id) ? Colors.white : Colors.deepPurple,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 40,
                                    color: personProvider.shadchanProvider.myFavorites.containsKey(widget.person.id) ? Colors.deepPurple : Colors.white,
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
                                      Container(
                                        width: 100,
                                        height: 100,
                                        child: CircleAvatar(
                                          radius: 100,
                                          backgroundColor: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      Container(
                                        width: 93,
                                        height: 93,
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: widget.shadchan.image,
                                            placeholder: (context, url) => Loader(),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                     if(false) FittedBox(
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
                                     if(widget.shadchan.isOnline!=null &&widget.shadchan.isOnline==true) Positioned(
                                        top: 0,
                                        right: 10,
                                        child: Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundColor: Theme.of(context).primaryColor,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
