import 'package:dating/widgets/photoPicker.dart';
import 'package:flutter/material.dart';
class PersonListCard extends StatelessWidget {
  var image;
  @override
  Widget build(BuildContext context) {
    return
     Stack(
       children: <Widget>[
         Align(
              child: 
              AspectRatio(
            aspectRatio: 1/1,
              child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                    'https://placeimg.com/640/480/any',
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
          ),
    ),
      Align(
              child: 
              AspectRatio(
            aspectRatio: 1/1,
              child:Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                                child: DecoratedBox(
                            decoration: new BoxDecoration(
                              //color: Colors.lightGreen
                              gradient: new LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [   
                                   Colors.black54,   
                                   Colors.black54,                
                                   Colors.transparent,                       
                                                   
                                ]
                              )
                            ),
                          ),
                ),
              ), 
          ),
    ),
     Align(
              child: 
              AspectRatio(
            aspectRatio: 1/1,
              child: Container(
                
                child: Card(
                  color: Colors.transparent,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Align(
                      //alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                        children: <Widget>[
                        Row(children: <Widget>[
                          Icon(Icons.person,color:Colors.white),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Samy, 28",style:TextStyle(fontSize: 18,color:Colors.white)),
                          )
                        ], 
                        ),
                        SizedBox(height: 8,),
                          Row(children: <Widget>[
                          Icon(Icons.location_city,color:Colors.white),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Bet Shemesh",style:TextStyle(fontSize: 18,color:Colors.white)),
                          )
                        ],
                        
                        ),
                         SizedBox(height: 8,),
                          Row(children: <Widget>[
                          Icon(Icons.short_text,color:Colors.white),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text("dsfjhfgsh djkasdfg dsfsdfsdf h",style:TextStyle(fontSize: 18,color:Colors.white))),
                          )
                        ],
                        
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                                                  child: Container(
                            child:  Column(
                              children: <Widget>[
                                Stack(
                             alignment: AlignmentDirectional.center,
                            children: <Widget>[
                               Container(
                                width: 100,
                                height: 100,
                                child: CircleAvatar(radius: 100,backgroundColor: Theme.of(context).primaryColor,),
                              ),
                              Container(
                                width: 90,
                                height: 90,
                                child: image!=null?CircleAvatar(backgroundImage: new FileImage(image), radius: 90.0,):CircleAvatar(radius: 90,)
                              ),
                             
                            ],
                          ),
                                FittedBox(
                                                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(Icons.star,color: Colors.cyan,),
                                       Padding(
                                         padding: const EdgeInsets.only(top:5),
                                         child: Icon(Icons.star,color: Colors.cyan,),
                                       ),
                                        Icon(Icons.star,color: Colors.cyan,),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        ),

                        ],
                      ),
                                        ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
              ),
          ),
    ),
 
    //     Align(
    //           child: 
    //           AspectRatio(
    //         aspectRatio: 1/1,
    //           child: Card(
    //             color: Colors.transparent,
    //              // semanticContainer: true,
    //               //clipBehavior: Clip.antiAliasWithSaveLayer,
    //               child: Column(
    //                 children: <Widget>[
    //                   CircleAvatar(radius: 40,backgroundColor: Theme.of(context).primaryColor,),
    //                 ],
    //               ),
                  
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(24.0),
    //               ),
    //               //elevation: 5,
    //               margin: EdgeInsets.all(10),
    //             ),
    //       ),
    // ),
       ],
     );
  }
}