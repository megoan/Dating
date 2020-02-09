import 'package:dating/widgets/personListCard.dart';
import 'package:dating/widgets/personListCard2.dart';
import 'package:flutter/material.dart';
class Everyone extends StatelessWidget {
  List<String> litems = ["1","2","Third","4"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
  itemCount: litems.length,
  itemBuilder: (BuildContext ctxt, int index) => returnCard(ctxt, index)
);
}
  

  Widget returnCard(BuildContext ctxt, int index){
    return new PersonListCardTest(index);
  }
}