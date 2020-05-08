import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'loader.dart';
class ChatCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
          child: Container(
        child: Row(
    
          children: <Widget>[
          
             Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        child: CircleAvatar(
                                          radius: 70,
                                         // backgroundColor:  Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      Container(
                                        width:65,
                                        height: 65,
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
                                      MyApp.getLocale()=="he"?  Positioned(
                                        top: 0,
                                        // MyApp.getLocale()=="he"?  left:0: right: 0,
                                        right: 0,
                                        child: Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: <Widget>[
                                           
                                            CircleAvatar(
                                              radius: 5,
                                             // backgroundColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ):Positioned(
                                        top: 0,
                                        // MyApp.getLocale()=="he"?  left:0: right: 0,
                                        left: 0,
                                        child: Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: <Widget>[
                                           
                                            CircleAvatar(
                                              radius: 5,
                                             // backgroundColor: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                
                              ],
                            ),
                          
                               
                          ],
                        ),
                      ),
                   Container(
                         
                            
                            child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                 Text(
                                    "shlomo",
                                    style:
                                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10,),
                                     Column(
                                       children: <Widget>[
                                         Text("05/12/2019",),
                                   
                                       ],
                                     ),
                                    
                                  
                              
                              ],
                            ),
                         
                        ),
                        Spacer(),
                        Container(
                  
                          child: Text("18:00 AM")
                          )

                     
                
          ],
          
        ),
      ),
    );
  }
}
