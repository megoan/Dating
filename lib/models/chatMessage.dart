enum ChatType{SINGLE,GROUP}
enum ChatMessageType{NORMAL,REPLY,}
enum ContentType{TEXT,ABOUT,COMPARE,JOINED,REMOVED}
enum MessageStatus{NOT_SENT,RECIEVED,READ}
class Chat {
  String id;
  ChatType chatType;
  ChatMessageType chatMessageType;
  ContentType contentType;
  String senderId;
  String senderName;
  String message;
  MessageStatus messageStatus;
  DateTime createdAt;
  String p1;
  String p2;
  Chat({this.id,this.chatType,this.chatMessageType,this.contentType,this.createdAt,this.message,this.messageStatus,this.p1,this.p2,this.senderId,this.senderName});
}