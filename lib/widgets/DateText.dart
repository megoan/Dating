
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class DateText extends StatefulWidget {
 final TextEditingController monthText1;
final TextEditingController monthText2;
final TextEditingController dayText1  ;
final TextEditingController dayText2  ;
final TextEditingController yearText1 ;
final TextEditingController yearText2 ;
final TextEditingController yearText3 ;
final TextEditingController yearText4 ;
final Function validateDate;

DateText({
  @required  this.dayText1,
  @required  this.dayText2,
  @required  this.monthText1,
  @required  this.monthText2,
  @required  this.yearText1,
  @required  this.yearText2,
  @required  this.yearText3,
  @required  this.yearText4,
  @required  this.validateDate
});
  @override
  _DateTextState createState() => _DateTextState();
}
class OldText{
  String old="";
}
class _DateTextState extends State<DateText> {
  bool badDate=false;
  String textError="Please Enter Valid Date!";
  BuildContext context2;

  FocusNode monthNode1 = FocusNode();
  FocusNode monthNode2 = FocusNode();
  FocusNode dayNode1 = FocusNode();
  FocusNode dayNode2 = FocusNode();
  FocusNode yearNode1 = FocusNode();
  FocusNode yearNode2 = FocusNode();
  FocusNode yearNode3 = FocusNode();
  FocusNode yearNode4 = FocusNode();
  String rangeMonth1 = "[01]";
  String rangeMonth2 = "[0-9]";
  String rangeDay1 = "[0-3]";
  String rangeDay2 = "[0-9]";
  String rangeYear1 = "[12]";
  String rangeYear2 = "[09]";
  String rangeYear3 = "[0-9]";
  String rangeYear4 = "[0-9]";
  bool verifyEnabled = false;
  OldText m1old=new OldText();
  OldText m2old=new OldText();
  OldText d1old=new OldText();
  OldText d2old=new OldText();

  OldText y1old=new OldText();
  OldText y2old=new OldText();
  OldText y3old=new OldText();
  OldText y4old=new OldText();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    DateLetter(
                      monthText:widget.monthText1,
                      range: rangeMonth1,
                      hint: "M",
                      thisNode: monthNode1,
                      nextNode: monthNode2,
                      prevNode: null,
                      validate: widget.validateDate,
                      oldText: m1old,
                    ),
                    DateLetter(
                      monthText: widget.monthText2,
                      range: rangeMonth2,
                      hint: "M",
                      thisNode: monthNode2,
                      nextNode: dayNode1,
                      prevNode: monthNode1,
                      validate: widget.validateDate,
                      oldText: m2old,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        '/',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    DateLetter(
                      monthText: widget.dayText1,
                      range: rangeDay1,
                      hint: "D",
                      thisNode: dayNode1,
                      nextNode: dayNode2,
                      prevNode: monthNode2,
                      validate: widget.validateDate,
                      oldText: d1old,
                    ),
                    DateLetter(
                      monthText: widget.dayText2,
                      range: rangeDay2,
                      hint: "D",
                      thisNode: dayNode2,
                      nextNode: yearNode1,
                      prevNode: dayNode1,
                      validate: widget.validateDate,
                      oldText: d2old,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        '/',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    DateLetter(
                      monthText: widget.yearText1,
                      range: rangeYear1,
                      hint: "Y",
                      thisNode: yearNode1,
                      nextNode: yearNode2,
                      prevNode: dayNode2,
                      validate: widget.validateDate,
                      oldText: y1old,
                    ),
                    DateLetter(
                      monthText: widget.yearText2,
                      range: rangeYear2,
                      hint: "Y",
                      thisNode: yearNode2,
                      nextNode: yearNode3,
                      prevNode: yearNode1,
                      validate: widget.validateDate,
                      oldText: y2old,
                    ),
                    DateLetter(
                      monthText: widget.yearText3,
                      range: rangeYear3,
                      hint: "Y",
                      thisNode: yearNode3,
                      nextNode: yearNode4,
                      prevNode: yearNode2,
                      validate: widget.validateDate,
                      oldText: y3old,
                    ),
                    DateLetter(
                      monthText: widget.yearText4,
                      range: rangeYear4,
                      hint: "Y",
                      thisNode: yearNode4,
                      nextNode: null,
                      prevNode: yearNode3,
                      validate: widget.validateDate,
                      oldText: y4old,
                    ),
                  ],
    );
  }
    
}
class DateLetter extends StatelessWidget {
  final String hint;
  final String range;
  final FocusNode nextNode;
  final FocusNode thisNode;
  final FocusNode prevNode;
  final Function validate;
  final TextEditingController monthText;
  //String oldText = "";
  final OldText oldText;
  DateLetter({
    Key key,
    @required this.monthText,
    @required this.hint,
    @required this.nextNode,
    @required this.thisNode,
    @required this.prevNode,
    @required this.range,
    @required this.validate,
    @required this.oldText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 30,
        child: TextField(
          focusNode: thisNode,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            WhitelistingTextInputFormatter(RegExp(range))
          ],
          style: TextStyle(fontSize: 24),
          decoration: InputDecoration.collapsed(hintText: hint),
          controller: monthText,
          onChanged: (value) {
            
            if (value == "") {
              if (prevNode != null && oldText.old!="") {
                FocusScope.of(context).requestFocus(prevNode);
              }
           
            } else {
              if (nextNode != null) {
                FocusScope.of(context).requestFocus(nextNode);
              }
            }
            oldText.old = value;
            validate();
          },
        ),
      ),
    );
  }
}