import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/providers/langText.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'loader.dart';

class ShadchanListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.grey[300],
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            //color: Colors.blue,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      Container(
                        width: 78,
                        height: 78,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: 'https://placeimg.com/640/480/any',
                            placeholder: (context, url) => Loader(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Samy, 25",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Bet Shemesh",
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(Icons.location_on)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "500",
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                      Text(LocaleText.getLocaleText(MyApp.getLocale(), 'viewes'))
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "50",
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).primaryColor),
                    ),
                    Text("requests")
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "4",
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).primaryColor),
                    ),
                    Text("dates")
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      elevation: 5,
    );
  }
}
