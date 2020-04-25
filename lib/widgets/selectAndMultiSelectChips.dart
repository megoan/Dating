import 'package:flutter/material.dart';

class MultySelectChip extends StatefulWidget {
  final dynamic chips; // map or enum of Chips
  final Map<dynamic, bool> pickedChips; //map of the picked chips
  final Function valueCallBack; //callBack with the returned value
   MultySelectChip(this.chips,this.pickedChips,this.valueCallBack);
  @override
  _MultySelectChipState createState() => _MultySelectChipState();
}

class _MultySelectChipState extends State<MultySelectChip> {
  List<Widget> chipList = [];

  @override
  Widget build(BuildContext context) {
    for (var value in widget.chips) {
      chipList.add(FilterChip(
        selectedColor: Colors.blueGrey[500],
        selected: widget.pickedChips[value] != null && widget.pickedChips[value] == true ? true : false,
        label: new Text(value),
        backgroundColor: Colors.blue[200],

        // shape: StadiumBorder(side: BorderSide(color: Colors.blueGrey)),
        onSelected: (bool bvalue) {
          setState(() {
            widget.pickedChips[value] = bvalue;
            widget.valueCallBack(value);
          });
        },
      ));
      chipList.add(SizedBox(width: 10));
    }

    return Row(
      children: chipList,
    );
  }
}


class SelectChip extends StatefulWidget {
  final dynamic chips; // map or enum of Chips
  dynamic pickedValue; //map of the picked chips
  final Function valueCallBack; //callBack with the returned value
  SelectChip(this.chips,this.valueCallBack,{this.pickedValue});
  @override
  _SelectChipState createState() => _SelectChipState();
}

class _SelectChipState extends State<SelectChip> {
 
  List<Widget> chipList = [];

  @override
  Widget build(BuildContext context) {
    for (var value in widget.chips) {
      chipList.add(FilterChip(
        showCheckmark: false,
        selectedColor: Colors.blueGrey[500],
        selected: widget.pickedValue != null && widget.pickedValue == value ? true : false,
        label: new Text(value),
        backgroundColor: Colors.blue[200],

        // shape: StadiumBorder(side: BorderSide(color: Colors.blueGrey)),
        onSelected: (bool bvalue) {
          setState(() {
            widget.pickedValue = value;
            widget.valueCallBack(value);
          });
        },
      ));
      chipList.add(SizedBox(width: 10));
    }

    return Row(
      children: chipList,
    );
  }
}

