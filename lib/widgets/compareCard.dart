import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/providers/langText.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'loader.dart';

class CompareCard extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return Card(
          child: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: MyApp.getLocale()=="he"? const EdgeInsets.only(right: 20):const EdgeInsets.only(left: 20),
              child:new Container(
                width: 70,
                height: 70,
          padding: EdgeInsets.all(1),
          decoration: new BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(35),
          ),
          constraints: BoxConstraints(
            minWidth: 12,
            minHeight: 12,
          ),
          child: Align(
            alignment: Alignment.center,
                      child: new Text(
              '66%',
              style: new TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
            ),
             Padding(
                        padding:   MyApp.getLocale()=="he"? const EdgeInsets.only(right: 40,left: 15,top: 15,bottom: 15):const EdgeInsets.only(left: 40,right: 15,top: 15,bottom: 15),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
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
                       Expanded(
                                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text( "Samy", style:   TextStyle(fontSize: 18, fontWeight: FontWeight.bold),  ),
                                     Text( " ,", style:   TextStyle(fontSize: 18, fontWeight: FontWeight.bold),  ),
                                      Text( "25", style:   TextStyle(fontSize: 18, fontWeight: FontWeight.bold),  ),
                                  ],
                                ),
                                 Row(
                                   children: <Widget>[
                                     Text("Bet Shemesh",),
                                     Icon(Icons.location_on,color:Colors.purple),
                                   ],
                                 ),
                              
                              ],
                            ),
                          ),
                        ),
                      ),
          
          ],
          
        ),
      ),
    );
  }
}