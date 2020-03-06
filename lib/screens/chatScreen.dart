
import 'dart:math';

import 'package:bubble/bubble.dart';
import 'package:dating/main.dart';
import 'package:dating/models/chatMessage.dart';
import 'package:dating/models/conversationModel.dart';
import 'package:dating/models/myChatlist.dart';
import 'package:dating/providers/chatProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;
  final MyChatList myChatList;
  const ChatScreen({Key key, this.chat,this.myChatList}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState(chat,myChatList);
}

class _ChatScreenState extends State<ChatScreen> {
  bool isInit=true;
  bool isLoading = true;
  ChatProvider chatProvider;
  @override
  void didChangeDependencies() async{
    if (isInit) {
      isInit = false;
       chatProvider = Provider.of<ChatProvider>(context);
       await chatProvider.getSelectedChat(myChatList.combinedId);
       setState(() {
         isLoading=false;
       });
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  final Chat chat;
  final MyChatList myChatList;
  _ChatScreenState(this.chat,this.myChatList);

  Color getRandomColor(String s){
    print( s.toLowerCase().codeUnitAt(0).remainder(360));
    Random r = new Random();
    HSLColor c = new HSLColor.fromAHSL(1.0, s.toLowerCase().codeUnitAt(0).remainder(26)*13.0, r.nextDouble() * (0.9 - 0.4) + 0.4, r.nextDouble() * (0.7 - 0.3) +  0.3);
    return c.toColor();
  }
  Widget statusChat(MessageStatus messageStatus){
    switch (messageStatus) {
      case MessageStatus.NOT_SENT:
        return Container();
        break;
      case MessageStatus.SENT:
        return Icon(Icons.check,size: 20,color: Colors.grey);
        break;
      case MessageStatus.RECIEVED:
        return Icon(Icons.done_all,size: 20,color: Colors.grey,);
        break;
       case MessageStatus.READ:
        return Icon(Icons.done_all,color: Colors.blue,size: 20,);
        break;
      default:
    }
  }
  Widget getChatBubble(Chat chat,bool me,BuildContext context){
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleSomebody = BubbleStyle(
      nip: MyApp.getLocale()!="he"?BubbleNip.rightTop:BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );
    BubbleStyle styleMe = BubbleStyle(
      nip: MyApp.getLocale()!="he"?BubbleNip.leftTop:BubbleNip.rightTop,
      color: Color.fromARGB(255, 199, 230, 255),
      elevation: 1 * px,
      margin:  BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );

    switch (chat.contentType) {
      case ContentType.TEXT:
        return Bubble(
        style:me?styleMe:styleSomebody,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if(chat.chatType==ChatType.GROUP && !me)Text(chat.senderName,style:TextStyle(color: getRandomColor(chat.senderName)),),
            Text(chat.message),
            Row(
              children: <Widget>[
               if(me) statusChat(chat.messageStatus),
               if(me)SizedBox(width:5),
                Text(StaticFunctions.getChatTime(chat.createdAt),style: TextStyle(fontSize: 12,color: Colors.grey),),
              ],
            ),
          ],
        ),
      );
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );
    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Color.fromARGB(255, 199, 230, 255),
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );


    return Scaffold(
      backgroundColor: Color(0xFFe8dfd8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(63.0),
        child: AppBar(
         // backgroundColor: Color(0xFF128C7E),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          titleSpacing: 0,
          title: ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(myChatList.thereIcon),
            ),
            title: Text(
                (myChatList.groupName!=null&&myChatList.groupName!="")? myChatList.groupName:myChatList.shadchanName,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            subtitle: Text(
               StaticFunctions.getChatTime(myChatList.lastMessageTime),
              style: TextStyle(color: Colors.white.withOpacity(.7)),
            ),
          ),
          // actions: <Widget>[
          //   Icon(Icons.videocam),
          //   SizedBox(
          //     width: 15,
          //   ),
          //   Icon(Icons.call),
          //   SizedBox(
          //     width: 15,
          //   ),
          //   Icon(Icons.more_vert),
          //   SizedBox(
          //     width: 5,
          //   ),
          // ],
        ),
      ),
      body: isLoading?Center(child: CircularProgressIndicator(),): 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child:
        ListView.builder(reverse: true, itemCount: chatProvider.selectedChat.length, itemBuilder: (BuildContext ctxt, int index) => getChatBubble(chatProvider.selectedChat[index],myChatList.shadchanID==chatProvider.selectedChat[index].senderId,context)),
        //  Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //    crossAxisAlignment: CrossAxisAlignment.start,
        //   children: <Widget>[
        //     Expanded(
        //       child: SingleChildScrollView(
        //                       child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: <Widget>[
        //             Bubble(
        //           alignment: Alignment.center,
        //           color: Color.fromARGB(255, 212, 234, 244),
        //           elevation: 1 * px,
        //           margin: BubbleEdges.only(top: 8.0),
        //           child: Text('TODAY', style: TextStyle(fontSize: 10)),
        //         ),
        //         Bubble(
        //           style: styleSomebody,
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: <Widget>[
        //               Text('מה קורה אח שלי לחיים כפרה עליך יאח חבל שלא דיברנו אתמול על המשחק היה פצצה'),
        //               Text(StaticFunctions.getChatTime(chat.createdAt),style: TextStyle(fontSize: 12,color: Colors.grey),),
        //             ],
        //           ),
        //         ),
        //         Bubble(
        //           style: styleMe,
        //           child: Text('Whats\'up?'),
        //         ),
        //         Bubble(
        //           style: styleSomebody,
        //           child: Text('I\'ve been having a problem with my computer.'),
        //         ),
        //         Bubble(
        //           style: styleSomebody,
        //           margin: BubbleEdges.only(top: 2.0),
        //           nip: BubbleNip.no,
        //           child: Text('Can you help me?'),
        //         ),
        //         Bubble(
        //           style: styleMe,
        //           child: Text('Ok'),
        //         ),
        //         Bubble(
        //           style: styleMe,
        //           nip: BubbleNip.no,
        //           margin: BubbleEdges.only(top: 2.0),
        //           child: Text('What\'s the problem?'),
        //         ),
        //           //   Stack(
        //           //   overflow: Overflow.visible,
        //           //   children: <Widget>[
        //           //     Container(
        //           //       padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
        //           //       margin: EdgeInsets.symmetric(horizontal: 21,vertical: 12),
        //           //       decoration: BoxDecoration(
        //           //         color: Colors.white,
        //           //         borderRadius: BorderRadius.circular(5),
        //           //       ),
        //           //       child: Row(
        //           //         mainAxisSize: MainAxisSize.min,
        //           //         children: <Widget>[
        //           //           Text(chat.message,style: TextStyle(fontSize: 17,)),
        //           //           SizedBox(width: 5,),
        //           //           Padding(
        //           //             padding: const EdgeInsets.only(top: 21),
        //           //             child: Text(StaticFunctions.getChatTime(chat.createdAt),style: TextStyle(fontSize: 12,color: Colors.grey),),
        //           //           ),
        //           //         ],
        //           //       ),
        //           //     ),
        //           //     Positioned(
        //           //       left:7,
        //           //       top: 12,
        //           //       child: ClipPath(
        //           //         clipper: TriangleClipper(),
        //           //         child: Container(
        //           //           height: 20,
        //           //           width: 30,
        //           //           color: Colors.white,
        //           //         ),
        //           //       ),
        //           //     )
        //           //   ],
        //           // ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     // Row(
        //     //   children: <Widget>[
        //         Stack(
        //           overflow: Overflow.visible,
        //           children: <Widget>[
        //             Container(
        //               padding: EdgeInsets.all(12),
        //               margin: EdgeInsets.all(12),
        //               decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.circular(12),
        //               ),
        //               child: Row(
        //                 children: <Widget>[
        //                   // Icon(
        //                   //   Icons.tag_faces,
        //                   //   color: Colors.grey,
        //                   //   size: 35,
        //                   // ),
        //                   // SizedBox(
        //                   //   width: 5,
        //                   // ),
        //                    Flexible(
        //                                                   child: TextField(
        //                                                     maxLines: null,
        //                         decoration: InputDecoration(
        //                             border: InputBorder.none,
        //                             hintText: 'Type a message',
        //                             //contentPadding: EdgeInsets.only(left: 5),
        //                             hintStyle: TextStyle(
        //                                 color: Colors.grey, fontSize: 18)),
        //                       ),
        //                     ),
                        
                       
        //                   // Icon(
        //                   //   Icons.camera_alt,
        //                   //   color: Colors.grey,
        //                   //   size: 35,
        //                   // )
        //                 ],
        //               ),
        //             ),
        //             Positioned(
        //               right: -3,
        //               top: 12,
        //               child: ClipPath(
        //                 clipper: TriangleClipper(),
        //                 child: Container(
        //                   height: 20,
        //                   width: 30,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //         // Container(
        //         //   padding: EdgeInsets.all(12),
        //         //   decoration: BoxDecoration(
        //         //       color: Color(0xFF128C7E), shape: BoxShape.circle),
        //         //   child: Icon(
        //         //     Icons.keyboard_voice,
        //         //     color: Colors.white,
        //         //     size: 32,
        //         //   ),
        //         // )
        //       ],
        //     )
        //  ],
       // ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}