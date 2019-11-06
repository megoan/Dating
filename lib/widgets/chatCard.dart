import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'loader.dart';
class ChatCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
          child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
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
                                       Positioned(
                                        top: 0,
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
                                      ),
                                    ],
                                  ),
                                
                              ],
                            ),
                              FittedBox(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
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
                                              const EdgeInsets.only(top: 0),
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
                                              const EdgeInsets.only(top: 0),
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
                               
                          ],
                        ),
                      ),
                   Container(
                         
                            
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                 Text(
                                    "Contacted Me About:",
                                    style:
                                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                               SizedBox(height: 4,),
                                
                                     Text("Shlomo",style: TextStyle(color: Colors.purple),),
                                      SizedBox(height: 4,),
                                     Text("05/12/2019",),
                                    
                                  
                              
                              ],
                            ),
                         
                        ),
                     
                 Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: <Widget>[
                                      Container(
                                        width: 70,
                                        height: 70,
                                        child: CircleAvatar(
                                          radius: 70,
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
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
                                     
                                    ],
                                  ),
          ],
          
        ),
      ),
    );
  }
}