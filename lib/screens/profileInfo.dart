import 'package:dating/providers/langText.dart';
import 'package:dating/widgets/shadchanDialog.dart';
import 'package:dating/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/widgets/loader.dart';

import '../main.dart';
import 'compareThemList.dart';
class ProfileInfo extends StatefulWidget {
  final int index;
  ProfileInfo({this.index});
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
                Positioned(
                  bottom: 0,
                  left: 20,
                  
                  child:GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                title: "Shlomit Shadchanit",
                                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                buttonText: "Okay",
                              ),
                            );
                          },
                          child: Container(
                  child: Column(
                          children: <Widget>[
                          
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[
                                  Hero(
                                    tag: "shadchanImage",
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
                                        MyApp.getLocale()=="he"?  Positioned(
                                          top: 0,
                                          // MyApp.getLocale()=="he"?  left:0: right: 0,
                                          right: 0,
                                          child: Stack(
                                            alignment: AlignmentDirectional.center,
                                            children: <Widget>[
                                             
                                              CircleAvatar(
                                                radius: 5,
                                                backgroundColor: Colors.green,
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
                                                backgroundColor: Colors.green,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                ))),
                  Positioned(
                    bottom: 10,
                    right: 20,
                                      child: Row(
                      children: <Widget>[
                       
                        Container(
                          alignment: Alignment.center,
                          child: OutlineButton(
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
                        ),
          
                      ],
                    ),
                  ),
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
           //   Positioned(top:0, child: TopBar())
              
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
                                Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Who am I'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Container(
                                  width: 200,
                                  child: Divider(thickness: 1,color: Colors.black26,),),
                                  SizedBox(height:10),
                                  Text("dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd"),
                                    Text("dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd"),
                                      Text("dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd dfsdf dsfsdf sdfsdf dsfsdfsdf sdfsdfsdf sdfsdfsdf sdfsfd sdfsdf sdfsdfsd sdfsd")
                             ,SizedBox(height:40),
                               Text(LocaleText.getLocaleText(MyApp.getLocale(), 'What am I looking for'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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