import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loader.dart';

class PersonListCardTest extends StatelessWidget {
  var image;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: AspectRatio(
        aspectRatio: 1 / 1,
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
              CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: 'https://placeimg.com/640/480/any',
                placeholder: (context, url) => Loader(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
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
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Samy, 28",
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
                        Icon(Icons.location_city, color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("Bet Shemesh",
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
                          padding: const EdgeInsets.only(left: 10),
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
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  size: 55,
                                  color: Colors.deepPurple,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
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
                      ],
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
