import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/screens/compareThemList.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'loader.dart';

class ShadchanListCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.grey[100],
      child: ClipPath(
         clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
               
              child: Container(
          decoration: BoxDecoration(
    border: Border(
        
    //  top: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
        right: BorderSide(width: 12.0, color: Colors.lightBlue.shade900),
    ),
  ),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(15.0),
                         topRight: Radius.circular(15.0),
                        ),
                        ),
                //color: Colors.blue,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
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
                    SizedBox(
                      width: 4,
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
                                  Text("Samy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                                   Text(" ,", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                                    Text("25", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                                ],
                              ),
                               Text("very very funny dsdsh hgjhghhhh hhhhhhhhhhhhh hhhhhhhhhhhh hhhhhhhadhg jdhdfg gdhjhg ghjdg gyjhgs dhjdsf fdshjhg",style: TextStyle(color: Colors.grey),),
                              // Row(
                              //   children: <Widget>[
                              //     Text(
                              //       "Bet Shemesh",
                              //       style: TextStyle(fontSize: 15),
                              //     ),
                              //     Icon(Icons.location_on)
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 1,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                           Text(LocaleText.getLocaleText(MyApp.getLocale(), 'viewes'),style: TextStyle(color: Colors.grey),),
                          Text(
                            "500",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                         
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                         Text(LocaleText.getLocaleText(MyApp.getLocale(), 'requests'),style: TextStyle(color: Colors.grey),),
                        Text(
                          "50",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                       
                      ],
                    ),
                    Column(
                      children: <Widget>[
                         Text(LocaleText.getLocaleText(MyApp.getLocale(), 'dates'),style: TextStyle(color: Colors.grey),),
                        Text(
                          "4",
                          style: TextStyle(
                              fontSize: 20, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                        ),
                       
                      ],
                    ),
                    OutlineButton(
                      onPressed: (){
                        Navigator.of(context).push( new MaterialPageRoute( builder: (context) => new CompareThemList()));
  
                      },
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Compare'),style: TextStyle(color: Colors.purple),),
                        ],
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                   borderSide: BorderSide(
                     
                color: Colors.purple, //Color of the border
                style: BorderStyle.solid, //Style of the border
                width: 1, //width of the border
              ),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      elevation: 5,
    );
  }
}
