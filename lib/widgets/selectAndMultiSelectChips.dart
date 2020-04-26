import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final dynamic chips; // map or enum of Chips
  final Map<dynamic, bool> pickedChips; //map of the picked chips
  final Function valueCallBack; //callBack with the returned value
   MultiSelectChip(this.chips,this.valueCallBack,{this.pickedChips});
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<Widget> chipList ;
  Map<dynamic, bool> pickedChips = {}; 
 
  @override
  Widget build(BuildContext context) {
    chipList = [];
    if(pickedChips.isEmpty && widget.pickedChips!=null)
    pickedChips = widget.pickedChips;// happens only once 

    for (var value in widget.chips) {
      chipList.add(FilterChip(
        selectedColor: Colors.blueGrey[500],
        selected: pickedChips[value] != null && pickedChips[value] == true ? true : false,
        label: new Text(value.toString().split('.')[1]),
        backgroundColor: Colors.blue[200],

        // shape: StadiumBorder(side: BorderSide(color: Colors.blueGrey)),
        onSelected: (bool bvalue) {
          setState(() {
            pickedChips[value] = bvalue;
            widget.valueCallBack(value);
          });
        },
      ));
      chipList.add(SizedBox(width: 10));
    }

    return Wrap(
      direction: Axis.horizontal,
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
 
  List<Widget> chipList ;

  @override
  Widget build(BuildContext context) {
    chipList =[];
    for (var value in widget.chips) {
      chipList.add(FilterChip(
        showCheckmark: false,
        selectedColor: Colors.blueGrey[500],
        selected: widget.pickedValue != null && widget.pickedValue == value ? true : false,
        label: new Text(value.toString().split('.')[1]),
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

    return Wrap(
      direction: Axis.horizontal,
      children: chipList,
    );
  }
}

