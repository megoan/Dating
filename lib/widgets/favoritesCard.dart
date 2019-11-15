import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/providers/langText.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'loader.dart';
class FavoritesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
          child: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: MyApp.getLocale()=="he"? const EdgeInsets.only(right: 10):const EdgeInsets.only(left: 10),
              child: InkWell(
                child: Icon(Icons.cancel,size:40,color: Colors.red,),
              ),
            ),
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
          Padding(
            padding: MyApp.getLocale()=="he"? const EdgeInsets.only(left: 10):const EdgeInsets.only(right: 10),
            child: OutlineButton(
                        onPressed: (){},
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text( LocaleText.getLocaleText(MyApp.getLocale(), 'Compare'),style: TextStyle(color: Colors.purple),),
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
          ),
          ],
          
        ),
      ),
    );
  }
}