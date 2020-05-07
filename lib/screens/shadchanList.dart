import 'package:dating/models/person.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/shadchanProvider.dart';
import 'package:dating/widgets/shadchanListCard2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ShadchanList extends StatefulWidget {
  @override
  _ShadchanListState createState() => _ShadchanListState();
}

class _ShadchanListState extends State<ShadchanList> {
  PersonProvider personProvider;

  ShadchanProvider shadchanProvider;

  bool isInit=true;
  bool isLoading = true;
  
  void reset()async{
     isLoading = true;
     setState(() {
       
     });
      await Future.wait([personProvider.getAllMyPeople(),shadchanProvider.getAllShadchanim()]);
       setState(() {
        isLoading = false;
      });
  }
  void updateVisible(String id,bool visible){
    personProvider.updateVisible(id,visible);
  }
  
  @override
  void didChangeDependencies() async{
    if (isInit) {
      isInit=false;
      personProvider = Provider.of<PersonProvider>(context);
      shadchanProvider = Provider.of<ShadchanProvider>(context);
     await Future.wait([personProvider.getAllMyPeople(),shadchanProvider.getAllShadchanim()]);
     
      setState(() {
        isLoading = false;
      });
    }
   
    super.didChangeDependencies();
    //getAllPeople()
  }

  @override
  Widget build(BuildContext context) {
    return(isLoading)?Center(child: CircularProgressIndicator(),) : ListView.builder(
  itemCount: personProvider.myPeople.length,
  itemBuilder: (BuildContext ctxt, int index) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: returnCard( personProvider.myPeople[index]),
  )
);
}

  Widget returnCard( Person person){
    return new ShadchanListCard2(person,personProvider.shadchanProvider.allShadchanimMap[person.shadchanID],reset,updateVisible);
  }
}