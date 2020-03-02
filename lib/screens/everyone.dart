import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/shadchanProvider.dart';
import 'package:dating/widgets/personListCard.dart';
import 'package:dating/widgets/personListCard2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Everyone extends StatefulWidget {
  @override
  _EveryoneState createState() => _EveryoneState();
}

class _EveryoneState extends State<Everyone> {

  PersonProvider personProvider;

 // ShadchanProvider shadchanProvider;

  bool isInit=true;
  bool isLoading = true;
  @override
  void didChangeDependencies() async{
    if (isInit) {
      isInit=false;
      personProvider = Provider.of<PersonProvider>(context);
     // shadchanProvider = Provider.of<ShadchanProvider>(context);
      await Future.wait([personProvider.getAllPeople(),personProvider.shadchanProvider.getAllShadchanim()]);
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }
   
    super.didChangeDependencies();
    //getAllPeople()
  }
  @override
  Widget build(BuildContext context) {
    
    return (isLoading)?Center(child: CircularProgressIndicator(),) :ListView.builder(itemCount: personProvider.allPeople.length, itemBuilder: (BuildContext ctxt, int index) => returnCard(index));
  }

  Widget returnCard(int index) {
   return   (personProvider.nameFilter==null || personProvider.nameFilter=="")? 
   PersonListCardTest(personProvider.allPeople[index],personProvider.shadchanProvider.allShadchanimMap[personProvider.allPeople[index].shadchanID]):
   personProvider.allPeople[index].firstName.toLowerCase().contains(personProvider.nameFilter.toLowerCase())||personProvider.allPeople[index].lastName.toLowerCase().contains(personProvider.nameFilter.toLowerCase())?
   PersonListCardTest(personProvider.allPeople[index],personProvider.shadchanProvider.allShadchanimMap[personProvider.allPeople[index].shadchanID]):
   Container();
  }
}
