import 'dart:math';

import 'package:bubble/bubble.dart';
import 'package:dating/main.dart';
import 'package:dating/models/chatMessage.dart';
import 'package:dating/models/myChatlist.dart';
import 'package:dating/providers/chatProvider.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:dating/screens/profileInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'compareScreen.dart';

class ChatScreen extends StatefulWidget {
  
  final MyChatList myChatList;
  const ChatScreen({Key key,  this.myChatList}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState( myChatList);
}

class _ChatScreenState extends State<ChatScreen> {
  bool isInit = true;
  bool isLoading = true;
  ChatProvider chatProvider;
  PersonProvider personProvider;
  TextEditingController textEditingController = new TextEditingController();
  ScrollController scrollController = new ScrollController();
  bool hasValue=false;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      isInit = false;
      chatProvider = Provider.of<ChatProvider>(context);
      personProvider = Provider.of<PersonProvider>(context);
      await chatProvider.getSelectedChat(myChatList.combinedId);
      setState(() {
        isLoading = false;
      });
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }


  final MyChatList myChatList;
  _ChatScreenState(this.myChatList);

  Color getRandomColor(String s) {
    print(s.toLowerCase().codeUnitAt(0).remainder(360));
    Random r = new Random();
    HSLColor c = new HSLColor.fromAHSL(1.0, s.toLowerCase().codeUnitAt(0).remainder(26) * 13.0, 0.5, 0.5);
    return c.toColor();
  }

  Widget statusChat(MessageStatus messageStatus) {
    switch (messageStatus) {
      case MessageStatus.NOT_SENT:
        return Container();
        break;
      case MessageStatus.SENT:
        return Icon(Icons.check, size: 20, color: Colors.grey);
        break;
      case MessageStatus.RECIEVED:
        return Icon(
          Icons.done_all,
          size: 20,
          color: Colors.grey,
        );
        break;
      case MessageStatus.READ:
        return Icon(
          Icons.done_all,
          color: Colors.blue,
          size: 20,
        );
        break;
      case MessageStatus.SENDING:
        return Icon(
          Icons.access_time,
          color: Colors.grey,
          size: 20,
        );
        break;
      default:
    }
  }

  Widget getChatBubble(int index, bool me, BuildContext context) {
    bool alsoMine=false;
    if (index< chatProvider.selectedChat.length-1 && chatProvider.selectedChat[index].senderId==chatProvider.selectedChat[index+1].senderId) {
      alsoMine=true;
    }
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleSomebody = BubbleStyle(
      nip:alsoMine?null: MyApp.getLocale() != "he" ? BubbleNip.rightTop : BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );
    BubbleStyle styleMe = BubbleStyle(
      nip: alsoMine?null:MyApp.getLocale() != "he" ? BubbleNip.leftTop : BubbleNip.rightTop,
      color: Color.fromARGB(255, 199, 230, 255),
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );
    Chat chat = chatProvider.selectedChat[index];
    switch (chat.contentType) {
      case ContentType.TEXT:
        return Bubble(
          margin: alsoMine?BubbleEdges.only(top:2):BubbleEdges.only(top:8),
          style: me ? styleMe : styleSomebody,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (chat.chatType == ChatType.GROUP && !me)
                Text(
                  chat.senderName,
                  style: TextStyle(color: getRandomColor(chat.senderName)),
                ),
              Text(chat.message),
              SizedBox(height: 3,),
              Row(
                children: <Widget>[
                  if (me && chat.chatType != ChatType.GROUP) statusChat(chat.messageStatus),
                  if (me && chat.chatType != ChatType.GROUP) SizedBox(width: 5),
                  Text(
                    StaticFunctions.getChatTime(chat.createdAt),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
        break;
      case ContentType.ABOUT:
        return Bubble(
          margin: alsoMine?BubbleEdges.only(top:2):BubbleEdges.only(top:8),
          style: me ? styleMe : styleSomebody,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (chat.chatType == ChatType.GROUP && !me)
                Text(
                  chat.senderName,
                  style: TextStyle(color: getRandomColor(chat.senderName)),
                ),
              Card(
                elevation: 2,
                color: Colors.blue[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileInfo(
                          personId: chat.p1,
                          shadchanId: chat.p1ShadchanId,
                        ),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(chat.p1Image),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              chat.p1Name,
                              style: TextStyle(fontSize: 16, color: Colors.blue),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(chat.message),
              Text(
                StaticFunctions.getChatTime(chat.createdAt),
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        );
        break;
         case ContentType.COMPARE:

         return Bubble(
           margin: alsoMine?BubbleEdges.only(top:2):BubbleEdges.only(top:8),
          style: me ? styleMe : styleSomebody,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (chat.chatType == ChatType.GROUP && !me)
                Text(
                  chat.senderName,
                  style: TextStyle(color: getRandomColor(chat.senderName)),
                ),
              Card(
                elevation: 2,
                color: Colors.blue[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompareScreen(
                          person1Id: chat.p1,
                          person2Id: chat.p2,
                        ),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: NetworkImage(chat.p1Image),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      chat.p1Name,
                                      style: TextStyle(fontSize: 16, color: Colors.blue),
                                    )),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: NetworkImage(chat.p2Image),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      chat.p2Name,
                                      style: TextStyle(fontSize: 16, color: Colors.blue),
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                padding: MyApp.getLocale() == "he" ? const EdgeInsets.only(right: 20) : const EdgeInsets.only(left: 20),
                child: new Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(1),
                  decoration: new BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: new Text(
                   LocaleText.getLocaleSelectText(MyApp.getLocale(),chat.compareScore.toString()),
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
                      ],
                      
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(chat.message),
              Text(
                StaticFunctions.getChatTime(chat.createdAt),
                style: TextStyle(fontSize: 12, color: Colors.grey),
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
              (myChatList.chatType==ChatType.GROUP) ? myChatList.groupName : myChatList.shadchanName,
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          controller: scrollController,
                          reverse: true,
                          itemCount: chatProvider.selectedChat.length,
                          itemBuilder: (BuildContext ctxt, int index) => getChatBubble(index, myChatList.shadchanID == chatProvider.selectedChat[index].senderId, context))),

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
                  // Row(
                  //   children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                                          child: Stack(
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: <Widget>[
                                  // Icon(
                                  //   Icons.tag_faces,
                                  //   color: Colors.grey,
                                  //   size: 35,
                                  // ),
                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  Flexible(
                                    child: TextField(
                                      onChanged: (value) {
                                        if (value!=null && value!="") {
                                            hasValue=true;
                                         
                                        }
                                        else{
                                          hasValue=false;
                                        }
                                         setState(() {
                                          
                                          });
                                      },
                                      maxLines: null,
                                      controller: textEditingController,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Type a message',
                                          //contentPadding: EdgeInsets.only(left: 5),
                                          hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
                                    ),
                                  ),
                                  
                                  // Icon(
                                  //   Icons.camera_alt,
                                  //   color: Colors.grey,
                                  //   size: 35,
                                  // )
                                ],
                              ),
                            ),
                            Positioned(
                              right: -3,
                              top: 12,
                              child: ClipPath(
                                clipper: TriangleClipper(),
                                child: Container(
                                  height: 20,
                                  width: 30,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                  if(hasValue) GestureDetector(
                    onTap: ()async{
                      String temp=textEditingController.text.toString();
                       textEditingController.text="";
                          hasValue=false;
                          setState(() {
                            
                          });
                     await chatProvider.addChat(
                        Chat(
                          chatMessageType: ChatMessageType.NORMAL,
                          combinedId: myChatList.combinedId,
                          chatType: myChatList.chatType,
                          createdAt: DateTime.now(),
                          contentType: ContentType.TEXT,
                          senderId: personProvider.shadchanProvider.myShadchanId,
                          message: temp,
                          messageStatus: MessageStatus.SENDING,
                          id: "10",
                          senderName: personProvider.shadchanProvider.myShadchan.name
                          ));
                         
                          setState(() {
                            
                          });
                    },
                                      child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  )
                    ],
                  ),
                  
                //  ],
                 //  )
                  // ],
                 // ),
                ],
              ),
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
