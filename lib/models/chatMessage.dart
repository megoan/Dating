enum ChatType{SINGLE,GROUP}
enum ChatMessageType{NORMAL,REPLY,}
enum ContentType{TEXT,ABOUT,COMPARE,JOINED,REMOVED}
enum MessageStatus{NOT_SENT,SENT,RECIEVED,READ}
class Chat {
  String id;
  String combinedId;
  ChatType chatType;
  ChatMessageType chatMessageType;
  ContentType contentType;
  String senderId;
  String senderName;
  String message;
  MessageStatus messageStatus;
  DateTime createdAt;
  String p1;
  String p1Name;
  String p1Image;
  String p1ShadchanId;
  String p2;
  String p2Name;
  String p2Image;
  Chat({this.id,this.combinedId,this.chatType,this.chatMessageType,this.contentType,this.createdAt,this.message,this.messageStatus,this.p1,this.p1Name,this.p1Image,this.p1ShadchanId,this.p2,this.p2Name,this.p2Image,this.senderId,this.senderName});
}