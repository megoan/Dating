import 'package:flutter/material.dart';
class OutLineButtonMy extends StatelessWidget {
  bool verifyEnabled;
  Function callBackFunction;
  String text;
  OutLineButtonMy({this.verifyEnabled,this.callBackFunction,this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlineButton(
                        
                        child: new Text(
                         text,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: verifyEnabled
                                  ? Colors.white
                                  : Colors.white38),
                        ),
                        onPressed:  (verifyEnabled)?(){
                         callBackFunction();
                        }:null,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        highlightedBorderColor:
                            verifyEnabled ? Colors.white : Colors.white38,
                        borderSide: BorderSide(
                            color:
                                verifyEnabled ? Colors.white : Colors.white38,
                            width: 1.5),
                      ),
                    );
  }
}