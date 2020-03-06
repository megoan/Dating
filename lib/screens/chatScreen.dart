
import 'package:bubble/bubble.dart';
import 'package:dating/models/chatMessage.dart';
import 'package:dating/models/conversationModel.dart';
import 'package:dating/models/myChatlist.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final Chat chat;
  final MyChatList myChatList;
  const ChatScreen({Key key, this.chat,this.myChatList}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState(chat,myChatList);
}

class _ChatScreenState extends State<ChatScreen> {
  bool isInit=true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      isInit = false;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  final Chat chat;
    final MyChatList myChatList;
  _ChatScreenState(this.chat,this.myChatList);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Bubble(
                  alignment: Alignment.center,
                  color: Color.fromARGB(255, 212, 234, 244),
                  elevation: 1 * px,
                  margin: BubbleEdges.only(top: 8.0),
                  child: Text('TODAY', style: TextStyle(fontSize: 10)),
                ),
                Bubble(
                  style: styleSomebody,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('מה קורה אח שלי לחיים כפרה עליך יאח חבל שלא דיברנו אתמול על המשחק היה פצצה'),
                      Text(StaticFunctions.getChatTime(chat.createdAt),style: TextStyle(fontSize: 12,color: Colors.grey),),
                    ],
                  ),
                ),
                Bubble(
                  style: styleMe,
                  child: Text('Whats\'up?'),
                ),
                Bubble(
                  style: styleSomebody,
                  child: Text('I\'ve been having a problem with my computer.'),
                ),
                Bubble(
                  style: styleSomebody,
                  margin: BubbleEdges.only(top: 2.0),
                  nip: BubbleNip.no,
                  child: Text('Can you help me?'),
                ),
                Bubble(
                  style: styleMe,
                  child: Text('Ok'),
                ),
                Bubble(
                  style: styleMe,
                  nip: BubbleNip.no,
                  margin: BubbleEdges.only(top: 2.0),
                  child: Text('What\'s the problem?'),
                ),
                  //   Stack(
                  //   overflow: Overflow.visible,
                  //   children: <Widget>[
                  //     Container(
                  //       padding: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                  //       margin: EdgeInsets.symmetric(horizontal: 21,vertical: 12),
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(5),
                  //       ),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: <Widget>[
                  //           Text(chat.message,style: TextStyle(fontSize: 17,)),
                  //           SizedBox(width: 5,),
                  //           Padding(
                  //             padding: const EdgeInsets.only(top: 21),
                  //             child: Text(StaticFunctions.getChatTime(chat.createdAt),style: TextStyle(fontSize: 12,color: Colors.grey),),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Positioned(
                  //       left:7,
                  //       top: 12,
                  //       child: ClipPath(
                  //         clipper: TriangleClipper(),
                  //         child: Container(
                  //           height: 20,
                  //           width: 30,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  ],
                ),
              ),
            ),
            // Row(
            //   children: <Widget>[
                Stack(
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
                                                            maxLines: null,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Type a message',
                                    //contentPadding: EdgeInsets.only(left: 5),
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 18)),
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
                // Container(
                //   padding: EdgeInsets.all(12),
                //   decoration: BoxDecoration(
                //       color: Color(0xFF128C7E), shape: BoxShape.circle),
                //   child: Icon(
                //     Icons.keyboard_voice,
                //     color: Colors.white,
                //     size: 32,
                //   ),
                // )
              ],
            )
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