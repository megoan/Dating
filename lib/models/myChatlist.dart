import 'package:dating/models/chatMessage.dart';

class MyChatList {
  String shadchanID;
  String combinedId;//smaller+bigger
  String shadchanName;//group or single
  String groupName;//group or single
  String thereIcon;
  DateTime lastMessageTime;
  int unread;
  Chat lastMessage;
  ChatType chatType;
  MyChatList({this.shadchanID,this.combinedId,this.lastMessage,this.lastMessageTime,this.shadchanName,this.groupName,this.thereIcon,this.unread,this.chatType});
}