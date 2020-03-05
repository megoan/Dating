import 'package:dating/models/myChatlist.dart';
import 'package:dating/providers/chatProvider.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/widgets/chatCardWhats.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<String> litems = ["1","2","Third","4"];
  bool isInit =true;
  PersonProvider personProvider;
  ChatProvider chatProvider;
  bool isLoading = true;
  @override
  void didChangeDependencies() async{
    if (isInit) {
      isInit = false;
       personProvider = Provider.of<PersonProvider>(context);
       chatProvider = Provider.of<ChatProvider>(context);
       await chatProvider.getAllMyChats(personProvider.shadchanProvider.myShadchanId);
       setState(() {
         isLoading = false;
       });
    }

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    
    return (isLoading)?Center(child: CircularProgressIndicator(),): ListView.builder(
  itemCount: chatProvider.myChatLists.length,
  itemBuilder: (BuildContext ctxt, int index) => Padding(
    padding: const EdgeInsets.all(0.0),
    child: returnCard(ctxt, chatProvider.myChatLists[index]),
  )
);
}

  Widget returnCard(BuildContext ctxt, MyChatList myChatList){
    return new ChatCardWhats(myChatList:myChatList,myId: personProvider.shadchanProvider.myShadchanId);
  }
}