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
  List<String> litems = ["1", "2", "Third", "4"];

  PersonProvider personProvider;

  ShadchanProvider shadchanProvider;

  bool isInit=true;
  bool isLoading = true;
  @override
  void didChangeDependencies() async{
    if (isInit) {
      isInit=false;
      personProvider = Provider.of<PersonProvider>(context);
      shadchanProvider = Provider.of<ShadchanProvider>(context);
      await Future.wait([personProvider.getAllPeople(),shadchanProvider.getAllShadchanim()]);
     
      setState(() {
        isLoading = false;
      });
    }
   
    super.didChangeDependencies();
    //getAllPeople()
  }
  @override
  Widget build(BuildContext context) {
    
    return (isLoading)?Center(child: CircularProgressIndicator(),) :ListView.builder(itemCount: personProvider.allPeople.length, itemBuilder: (BuildContext ctxt, int index) => returnCard(ctxt, index));
  }

  Widget returnCard(BuildContext ctxt, int index) {
    return new PersonListCardTest(personProvider.allPeople[index],shadchanProvider.allShadchanimMap[personProvider.allPeople[index].shadchanID]);
  }
}
