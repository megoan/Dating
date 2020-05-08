import 'package:dating/screens/addGender.dart';
import 'package:dating/widgets/gradientButton.dart';
import 'package:dating/widgets/themeSwitcherButton.dart';
import 'package:flutter/material.dart';

class AddEmail extends StatefulWidget {

  @override
  _AddEmailState createState() => _AddEmailState();
}

class _AddEmailState extends State<AddEmail> {
  BuildContext context2;
  TextEditingController emailText = TextEditingController();
  bool verifyEnabled = false;
  @override
  Widget build(BuildContext context) {
    context2 = context;
    return Scaffold(
      //  appBar: AppBar(
      //   title: Text('Add Email'),
      // ),
       floatingActionButton: Padding(
        padding: const EdgeInsets.only(top:150),
        child: FancyFab(
          context: context,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('My email is',style: TextStyle(fontSize: 35,
                //color: Theme.of(context).primaryColor
                ),),
                TextField(
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
              hintText: 'Email'
            ),
                  controller: emailText,
                  onChanged: (value) {
                    String patttern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                    RegExp regExp = new RegExp(patttern);
                    if (regExp.hasMatch(value)) {
                      setState(() {
                        verifyEnabled = true;
                      });
                    }
                    else{
                          setState(() {
                        verifyEnabled = false;
                      });
                    }
                  },
                ),
                GradientButton.getGradiantButton(context, addUserEmail,
                    'CONTINUE', Colors.black,
                     20, verifyEnabled),
              ],
            ),
          ),
        
     
    );
  }

  void addUserEmail() {
    Navigator.of(context2).push( new MaterialPageRoute( builder: (context) => new AddGender()));
  }
}
