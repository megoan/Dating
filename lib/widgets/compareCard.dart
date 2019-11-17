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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
          
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Stack(
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
               ),
               ClipRRect(
                 borderRadius: (BorderRadius.circular(10)),
                                child: Container(
                   color: Colors.blueAccent,
                           
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("98%",style: TextStyle(color: Colors.white,fontSize: 20),),
                              ),
                             
                           
                          ),
               ),
                     
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Stack(
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
                 ),
          ],
          
        ),
      ),
    );
  
  }
}