import 'package:dating/screens/profilePictures.dart';
import 'package:dating/widgets/gradientButton.dart';
import 'package:dating/widgets/themeSwitcherButton.dart';
import 'package:flutter/material.dart';
class MoreMeLong extends StatefulWidget {
  @override
  _MoreMeLongState createState() => _MoreMeLongState();
}

class _MoreMeLongState extends State<MoreMeLong> {
  BuildContext context2;
  TextEditingController shortMeText = TextEditingController();
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
      body:  LayoutBuilder(
    builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: viewportConstraints.maxHeight,
          ),
          child:  Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('About Me',style: TextStyle(fontSize: 35,color: Theme.of(context).primaryColor),),
                    Text('Viewed only by matches',style: TextStyle(fontSize: 14,color: Theme.of(context).primaryColor),),
                  ],
                ),
                
                TextField(
                   maxLines: null,
            
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                     border:  OutlineInputBorder(   borderSide:  BorderSide(color: Colors.grey, width: 2.0), borderRadius: BorderRadius.all(Radius.circular(20))    ),
              hintText: 'i"m so funny...'
            ),
                  controller: shortMeText,
                  onChanged: (value) {
                    if(value.length>100){
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
                    'CONTINUE', Colors.black, 20, verifyEnabled),
              ],
            ),
          ),
        ));})
     
    );
  }

  void addUserEmail() {
    Navigator.of(context2).push( new MaterialPageRoute( builder: (context) => new ProfilePictures()));
  }
}