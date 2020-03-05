import 'package:dating/models/chatMessage.dart';
import 'package:dating/models/myChatlist.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Chat>chats=[
    Chat(
    id: "1",
    chatMessageType: ChatMessageType.NORMAL,
    chatType: ChatType.GROUP,
    contentType: ContentType.TEXT,
    createdAt: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1,6),
    message: "how is everyone gfhfg fdgdfg fdgdfg fdgdfg fdgdfgd dfgdgdfhdf dfgsfdf gfhtrt sdfghgfhgf bds",
    senderId: "2",
    senderName: "Esther",
    messageStatus: MessageStatus.READ,
    combinedId: "12"
    ),
     Chat(
    id: "1",
    chatMessageType: ChatMessageType.NORMAL,
    chatType: ChatType.GROUP,
    contentType: ContentType.TEXT,
    createdAt: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1,6),
    message: "how is everyone gfhfg fdgdfg fdgdfg fdgdfg fdgdfgd dfgdgdfhdf dfgsfdf gfhtrt sdfghgfhgf bds",
    senderId: "2",
    senderName: "Esther",
    messageStatus: MessageStatus.READ,
    combinedId: "12"
    ),
     Chat(
    id: "1",
    chatMessageType: ChatMessageType.NORMAL,
    chatType: ChatType.GROUP,
    contentType: ContentType.TEXT,
    createdAt: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1,6),
    message: "how is everyone gfhfg fdgdfg fdgdfg fdgdfg fdgdfgd dfgdgdfhdf dfgsfdf gfhtrt sdfghgfhgf bds",
    senderId: "2",
    senderName: "Esther",
    messageStatus: MessageStatus.READ,
    combinedId: "12"
    )
  ];
  static Chat chat=Chat(
    id: "1",
    chatMessageType: ChatMessageType.NORMAL,
    chatType: ChatType.GROUP,
    contentType: ContentType.TEXT,
    createdAt: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1,6),
    message: "how is everyone gfhfg fdgdfg fdgdfg fdgdfg fdgdfgd dfgdgdfhdf dfgsfdf gfhtrt sdfghgfhgf bds",
    senderId: "2",
    senderName: "Esther",
    messageStatus: MessageStatus.READ
    );
    static Chat chat2=Chat(
    id: "2",
    chatMessageType: ChatMessageType.NORMAL,
    chatType: ChatType.GROUP,
    contentType: ContentType.COMPARE,
    createdAt: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1,6),
    message: "how is everyone gfhfg fdgdfg fdgdfg fdgdfg fdgdfgd dfgdgdfhdf dfgsfdf gfhtrt sdfghgfhgf bds",
    senderId: "2",
    senderName: "Esther",
    messageStatus: MessageStatus.READ
    );
    static Chat chat3=Chat(
    id: "3",
    chatMessageType: ChatMessageType.NORMAL,
    chatType: ChatType.GROUP,
    contentType: ContentType.ABOUT,
    createdAt: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1,6),
    message: "how is everyone gfhfg fdgdfg fdgdfg fdgdfg fdgdfgd dfgdgdfhdf dfgsfdf gfhtrt sdfghgfhgf bds",
    senderId: "1",
    senderName: "Esther",
    messageStatus: MessageStatus.READ
    );
  List<MyChatList> myChatListsDataBase = [
    MyChatList(
      shadchanID: "1",
      combinedId: "12",
      lastMessageTime: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2,7),
      shadchanName: "mommy",
      groupName: "",unread: 2000,
      thereIcon: "https://img.icons8.com/material/4ac144/256/home.png",
      lastMessage: chat
      ),
    MyChatList(
      shadchanID: "1",
      combinedId: "12",
      lastMessageTime: new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-3,3),
      shadchanName: "sammy",
      groupName: "Points",unread: 100,
      thereIcon: "https://img.icons8.com/material/4ac144/256/home.png",
      lastMessage: chat2
    ),
    MyChatList(
      shadchanID: "1",
      combinedId: "12",
      lastMessageTime:  new DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-1,7),
      shadchanName: "sammy",
      groupName: "",unread: 50,
      thereIcon: "https://img.icons8.com/material/4ac144/256/home.png",
      lastMessage: chat3
    ),
    MyChatList(
      shadchanID: "1",
      combinedId: "12",
      lastMessageTime: DateTime.now(),
      shadchanName: "mommy",
      groupName: "Points",unread: 5,
      thereIcon: "https://img.icons8.com/material/4ac144/256/home.png",
      lastMessage: chat
    ),
    MyChatList(
      shadchanID: "1",
      combinedId: "12",
      lastMessageTime: DateTime.now(),
      shadchanName: "mommy",
      groupName: "Points",unread: 0,
      thereIcon: "https://img.icons8.com/material/4ac144/256/home.png",
      lastMessage: chat3
    ),
  ];
  List<MyChatList> myChatLists=[];

  Future<void> getAllMyChats(String shadchanID)async{
    myChatLists=[];
   await Future.delayed(Duration(milliseconds: 500),(){
      for (var item in myChatListsDataBase) {
        if (item.shadchanID==shadchanID) {
          myChatLists.add(item);
        }
      }
      notifyListeners();
      return;
    });
  }


}
