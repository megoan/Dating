import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/models/chatMessage.dart';
import 'package:dating/models/myChatlist.dart';
import 'package:dating/models/shadchan.dart';
import 'package:dating/providers/chatProvider.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:dating/screens/chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loader.dart';

class CustomDialog extends StatelessWidget {
  // final String title, description, buttonText;
  // final String image;
  final Shadchan shadchan;
  CustomDialog({
    // @required this.title,
    // @required this.description,
    // @required this.buttonText,
    @required this.shadchan,
    // this.image,
  });

  
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    ChatProvider chatProvider = Provider.of<ChatProvider>(context);
    PersonProvider personProvider = Provider.of<PersonProvider>(context);
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: (66 + 16.0),
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 66),
          decoration: new BoxDecoration(
            //color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                //color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                shadchan.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              // Text(
              //   description,
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //     fontSize: 16.0,
              //   ),
              // ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        String combined = StaticFunctions.combinedID(personProvider.shadchanProvider.myShadchanId, shadchan.id);
                        if (chatProvider.myChatListsMap.containsKey(combined)) {
                          Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (context) => new ChatScreen(
                                myChatList: chatProvider.myChatListsMap[combined],
                              ),
                            ),
                          );
                        } else {
                          Navigator.of(context).push(
                            new MaterialPageRoute(
                              builder: (context) => new ChatScreen(
                                myChatList: new MyChatList(
                                  shadchanID: personProvider.shadchanProvider.myShadchanId,
                                  combinedId: combined,
                                  lastMessage: Chat(),
                                  shadchanName: shadchan.name,
                                  thereIcon: shadchan.image,
                                  unread: 0,
                                  chatType: ChatType.SINGLE,
                                  lastMessageTime: DateTime.now()
                                ),
                              ),
                            ),
                          );
                        }

                       
                      },
                      child: CircleAvatar(
                       // backgroundColor: Theme.of(context).accentColor,
                        child: Icon(Icons.chat,
                        //color: Colors.white,
                        ))),
                ],
              ),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: FlatButton(
              //     onPressed: () {
              //       Navigator.of(context).pop(); // To close the dialog
              //     },
              //     child: Text(buttonText),
              //   ),
              // ),
            ],
          ),
        ),
        Positioned(
            left: 16,
            right: 16,
            child: Hero(
              tag: "shadchanImage",
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Container(
                    width: 130,
                    height: 130,
                    child: CircleAvatar(
                      radius: 130,
                      //backgroundColor: Theme.of(context).accentColor,
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 120,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: shadchan.image,
                        placeholder: (context, url) => Loader(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
