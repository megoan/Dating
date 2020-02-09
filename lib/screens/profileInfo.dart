import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/widgets/loader.dart';
class ProfileInfo extends StatefulWidget {
  final int index;
  ProfileInfo(this.index);
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("samy"),
        
      ),
      body: Container(
        child: Column(children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(height: 200,width: double.infinity,
              child: Column(children: <Widget>[
                Container(height: 100,
                 color: Colors.purple,),
                 Container(height: 100,)
              ],),
             
              ),
              Container(
                                    width: 200,
                                    height: 200,
                                    child: CircleAvatar(
                                      radius: 200,
                                      backgroundColor:
                                         Colors.white
                                    ),
                                  ),
                                  Container(
                                    width: 180,
                                    height: 180,
                                    child: ClipOval(
                                      child:Hero(
                                      tag: 'imageHero'+widget.index.toString(),child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            'https://placeimg.com/640/480/any',
                                        placeholder: (context, url) => Loader(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    )),
                                  ),
            ],
          )
        ],),
      ),
    );
  }
}