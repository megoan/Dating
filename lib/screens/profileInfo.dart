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
        child: SingleChildScrollView(
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
            ),
            Container(
             
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Shmuel Soibelman",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(width:10),
                        Text("28",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("bet shemesh",style: TextStyle(color: Colors.black54,fontSize: 16),),
                        SizedBox(width:4),
                       Icon(Icons.location_on,color: Colors.black54,)
                      ],
                    ),
                     SizedBox(height:10),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: 
                            Text("dsfsdf sdfkdslfdsf sdfskjfsdf sdflsdkjfgsd sdfsdf"),
                      ),
                    ),
                    SizedBox(height:30),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:<Widget>[
                          Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:<Widget>[
                               Text("סטטוס",style:TextStyle(color: Colors.purple[300],fontSize: 20,fontWeight: FontWeight.bold)),
                               SizedBox(height: 10,),
                                Text("hello",style: TextStyle(color:Colors.black54),),
                              SizedBox(height: 20,),
                                Text("השקפה",style:TextStyle(color: Colors.purple[300],fontSize: 20,fontWeight: FontWeight.bold)),
                                  SizedBox(height:10),
                                  Text("hello",style: TextStyle(color:Colors.black54),)
                            ]
                          ),
                          Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                 Text("גובה",style:TextStyle(color: Colors.purple[300],fontSize: 20,fontWeight: FontWeight.bold)),
                                  SizedBox(height:10),
                                  Text("hello",style: TextStyle(color:Colors.black54),),
                                   SizedBox(height: 20,),
                                    Text("דת",style:TextStyle(color: Colors.purple[300],fontSize: 20,fontWeight: FontWeight.bold)),
                                  SizedBox(height:10),
                                  Text("hello",style: TextStyle(color:Colors.black54),)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                               Text("עישון",style:TextStyle(color: Colors.purple[300],fontSize: 20,fontWeight: FontWeight.bold)),
                                  SizedBox(height:10),
                                  Text("hello",style: TextStyle(color:Colors.black54),),
                                   SizedBox(height: 20,),
                                     Text("עדה",style:TextStyle(color: Colors.purple[300],fontSize: 20,fontWeight: FontWeight.bold)),
                                  SizedBox(height:10),
                                  Text("hello",style: TextStyle(color:Colors.black54),),
                            ],
                          ),
                        ]
                      ),
                    ),
                  
                    SizedBox(height:30),

                  
                     Container(
                          width: double.infinity,
                          color: Colors.purple[100],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children:<Widget>[
                                Text("על המועמד",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 200,
                                  child: Divider(thickness: 1,color: Colors.black26,),),
                                  SizedBox(height:10),
                                  Text("dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd"),
                                    Text("dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd"),
                                      Text("dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd")
                             ]
                            ),
                          ),
                        ),   
                     
                  ],
                ),
            ),
            
          ],),
        ),
      ),
    );
  }
}