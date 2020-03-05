import 'package:dating/models/chatMessage.dart';
import 'package:dating/models/myChatlist.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:flutter/material.dart';
class ChatCardWhats extends StatelessWidget {
  final MyChatList myChatList;
  final String myId;
  ChatCardWhats({this.myChatList,this.myId});
  Widget getMessageTypeIcon(ContentType contentType){
    switch (contentType) {
      case ContentType.ABOUT:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Icon(Icons.person_pin,color: Colors.grey,),
        );
        break;
      case ContentType.COMPARE:
         return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Icon(Icons.people,color: Colors.grey,),
        );
        break;
      case ContentType.JOINED:
        return Container();
        break;
      case ContentType.REMOVED:
        return Container();
        break;
      case ContentType.TEXT:
        return Container();
        break;
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              new ListTile(
                leading: new CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: new NetworkImage(  myChatList.thereIcon,),
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                     (myChatList.groupName!=null&&myChatList.groupName!="")? myChatList.groupName:myChatList.shadchanName,
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    new Text(
                    StaticFunctions.getChatTime(myChatList.lastMessageTime),
                      style: new TextStyle(color: (myChatList.unread>0)?Colors.purple:Colors.grey, fontSize: 14.0),
                    ),
                  ],
                ),
                subtitle: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          if(myChatList.groupName!=null&&myChatList.groupName!="" && myId!=myChatList.lastMessage.senderId)Text(myChatList.shadchanName+": "),
                          getMessageTypeIcon(myChatList.lastMessage.contentType),
                          new Text(
                            myChatList.lastMessage.message,
                            style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                          ),
                          
                        ],
                      ),
                    if(myChatList.unread>0)  Container(
                      decoration: new BoxDecoration(
                  color: Colors.purple, //new Color.fromRGBO(255, 0, 0, 0.0),
                  borderRadius: new BorderRadius.all(
                   Radius.circular(30)
                ),),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 2),
                        child: Text(myChatList.unread.toString(),style: TextStyle(color:Colors.white),),
                      ),)
                    ],
                  ),
                ),
              )
            ],
          );
  }
}