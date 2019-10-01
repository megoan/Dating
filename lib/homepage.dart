import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'landingpage.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String uid;
  @override
  void initState(){
    this.uid = '';
    FirebaseAuth.instance.currentUser().then((onValue){
      setState(() {
       this.uid=onValue.uid; 
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar:  AppBar(
        title: Text('dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('you are logged in as ${this.uid}'),
            SizedBox(height: 15.0,),
            new OutlineButton(
              borderSide: BorderSide(color: Colors.red,
              style: BorderStyle.solid, width: 3),
              child: Text('loggout'),
              onPressed: (){
                FirebaseAuth.instance.signOut().then((onValue){
                  Navigator.pushReplacement(context, new MaterialPageRoute(  builder: (context) =>     new LandingPage())  );
               
                }).catchError((onError){
                  print(onError);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}