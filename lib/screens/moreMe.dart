import 'package:dating/widgets/gradientButton.dart';
import 'package:dating/widgets/themeSwitcherButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MoreMe extends StatefulWidget {
  @override
  _MoreMeState createState() => _MoreMeState();
}

class _MoreMeState extends State<MoreMe> {
  BuildContext context2;
  TextEditingController monthText = TextEditingController();
  TextEditingController dayText = TextEditingController();
  TextEditingController yearText = TextEditingController();
  bool verifyEnabled = false;
  @override
  Widget build(BuildContext context) {
    context2 = context;
    return Scaffold(
      //  appBar: AppBar(
      //   title: Text('Add Email'),
      // ),
      floatingActionButton: FancyFab(context: context,),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('My birthday is',style: TextStyle(fontSize: 35,color: Theme.of(context).primaryColor),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                   
                    Flexible( child: Container(
                      width: 50,
                      child: TextField(
                        inputFormatters:[LengthLimitingTextInputFormatter(1),],
                          //maxLength: 1,
                          style: TextStyle(fontSize: 24),
                          decoration: InputDecoration.collapsed(hintText: "MM"),
                          controller: monthText,
                          onChanged: (value) {},
                        ),
                    )
                    ,
                      
                    ),
                   Text(' / '),
                       Flexible( child: Container(
                         width: 50,
                         child: TextField(
                          style: TextStyle(fontSize: 24),
                          decoration: new InputDecoration(
                             border: InputBorder.none,
              hintText: 'DD' ),
                          controller: dayText,
                          onChanged: (value) {},
                      ),
                       ),
                    ),
                    Text(' / '),
                       Flexible( child: Container(
                         width: 80,
                         child: TextField(
                          style: TextStyle(fontSize: 24),
                          decoration: new InputDecoration(
                             border: InputBorder.none,
              hintText: 'YYYY' ),
                          controller: yearText,
                          onChanged: (value) {},
                      ),
                       ),
                    ),
                  ],
                ),
                GradientButton.getGradiantButton(context, addUserMoreMe,
                    'CONTINUE', Colors.black, 20, verifyEnabled),
              ],
            ),
          ),
        
     
    );
  }

  void addUserMoreMe() {
    //Navigator.of(context2).push( new MaterialPageRoute( builder: (context) => new AddGender()));
  }
}