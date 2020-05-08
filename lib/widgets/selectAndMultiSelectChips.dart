import 'package:dating/main.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/themes/appTheme.dart';
import 'package:dating/themes/colorManager.dart';
import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final dynamic chips; // map or enum of Chips
  final Map<dynamic, bool> pickedChips; //map of the picked chips
  final Function valueCallBack; //callBack with the returned value
  MultiSelectChip(this.chips, this.valueCallBack, {this.pickedChips});
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<Widget> chipList;
  Map<dynamic, bool> pickedChips = {};

  @override
  Widget build(BuildContext context) {
    chipList = [];
    if (pickedChips.isEmpty && widget.pickedChips != null) pickedChips = widget.pickedChips; // happens only once

    for (var value in widget.chips) {
      bool isSelected = pickedChips[value] != null && pickedChips[value] == true;
      chipList.add(FilterChip(
        elevation: isSelected ? 5 : 0,
        //selectedColor: ColorManager().theme.filterBackgroundColor,
        //checkmarkColor: ColorManager().theme.primary[300],
        selected: isSelected ? true : false,
        label: new Text(
          LocaleText.getLocaleSelectText(MyApp.getLocale(), value.toString()),
          style: TextStyle(
            //color: ColorManager().theme.primary[300]
            ),
        ),
        //backgroundColor: ColorManager().theme.fillColor,
        shape: StadiumBorder(side: isSelected ? BorderSide(
          //color: ColorManager().theme.primary[300]
          ) : BorderSide(
         // color: ColorManager().theme.fillColor
          )),
        onSelected: (bool bvalue) {
          setState(() {
            pickedChips[value] = bvalue;
            widget.valueCallBack(value, bvalue);
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
  SelectChip(this.chips, this.valueCallBack, {this.pickedValue});
  @override
  _SelectChipState createState() => _SelectChipState();
}

class _SelectChipState extends State<SelectChip> {
  List<Widget> chipList;

  @override
  Widget build(BuildContext context) {
    chipList = [];
    for (var value in widget.chips) {
      bool isSelected = widget.pickedValue != null && widget.pickedValue == value;
      chipList.add(FilterChip(
        showCheckmark: false,
        elevation: isSelected ? 5 : 0,
        //selectedColor: ColorManager().theme.filterBackgroundColor,
        selected: isSelected ? true : false,
        label: new Text(
          LocaleText.getLocaleSelectText(MyApp.getLocale(), value.toString()),
          style: TextStyle(
            //color: ColorManager().theme.primary[300]
            ),
        ),
        //backgroundColor: ColorManager().theme.fillColor,
        shape: StadiumBorder(side: isSelected ? BorderSide(
         // color: ColorManager().theme.primary[300]
         )
           : BorderSide(
             //color: ColorManager().theme.fillColor
             )),

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
