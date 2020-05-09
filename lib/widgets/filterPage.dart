import 'package:dating/main.dart';
import 'package:dating/models/person.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/themes/colorManager.dart';
import 'package:dating/widgets/selectAndMultiSelectChips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EveryBodyFilter extends StatefulWidget {
  @override
  _EveryBodyFilterState createState() => _EveryBodyFilterState();
}

class _EveryBodyFilterState extends State<EveryBodyFilter> {
  PersonProvider personProvider;
  bool isInit = true;
  double lookingPersonAgeMin = 18;
  double lookingPersonAgeMax = 99;
  //List<bool> checkedFilters = [false, false, false, false];
  RangeValues rangeValuesAge = RangeValues(18, 99);
  RangeLabels rangeLabelsAge = RangeLabels('18', '99');
  TextStyle titles = new TextStyle(
      //color: ColorManager().theme.textColor,
      fontSize: 22);

  Widget title(title) {
    return Padding(padding: EdgeInsets.all(5), child: Text(title, style: titles));
  }

  Future<bool> updateFilterCount() async{
  
  int counter = 0;
  if(personProvider.pickedCountry!=null&&personProvider.pickedCountry.containsValue(true))counter++;
  if(personProvider.pickedArea!=null&&personProvider.pickedArea.containsValue(true))counter++;
  if(personProvider.pickedStatus!=null&&personProvider.pickedStatus.containsValue(true))counter++;
  if(lookingPersonAgeMin!=18||lookingPersonAgeMax!=99)counter++;
  personProvider.updateNumberOfFilters(counter:counter);
   
  return true;
  }

  @override
  void didChangeDependencies() async {
    if (isInit) {
      isInit = false;
      personProvider = Provider.of<PersonProvider>(context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await updateFilterCount(),
          child: Scaffold(
        //backgroundColor: ColorManager().theme.filterBackgroundColor,
        appBar: AppBar(
            //backgroundColor: ColorManager().theme.filterBackgroundColor,
            ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              title(LocaleText.getLocaleText(MyApp.getLocale(), 'Country')),
              MultiSelectChip(
                Country.values,
                (selected, val) {
                  personProvider.pickedCountry[selected] = val;
                
                  if (selected == Country.ISRAEL) setState(() {});
                },
                pickedChips: personProvider.pickedCountry,
              ),
              SizedBox(
                height: 10,
              ),
              //area
              if (personProvider.pickedCountry[Country.ISRAEL] == true)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    title(LocaleText.getLocaleText(MyApp.getLocale(), 'Area')),
                    MultiSelectChip(
                      Area.values,
                      (selected, val) { 
                        personProvider.pickedArea[selected] = val;
                       
                        },
                      pickedChips: personProvider.pickedArea,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              //status
              title(LocaleText.getLocaleText(MyApp.getLocale(), 'Status')),
              MultiSelectChip(
                Status.values,
                (selected, val) {
                  personProvider.pickedStatus[selected] = val;
                
                   },
                pickedChips: personProvider.pickedStatus,
              ),
              SizedBox(
                height: 10,
              ),
              //age
              title(LocaleText.getLocaleText(MyApp.getLocale(), 'Age')),
              Row(
                children: <Widget>[
                  Text(
                    "" + lookingPersonAgeMin.toStringAsFixed(1),
                    style: TextStyle(
                        //color: ColorManager().theme.textColor
                        ),
                  ),
                  Expanded(
                    child: RangeSlider(
                      //activeColor: ColorManager().theme.secondary,
                      min: 18,
                      max: 99,
                      divisions: 162,
                      labels: rangeLabelsAge,
                      values: rangeValuesAge,
                      onChanged: ((newValue) {
                        setState(() {
                          rangeValuesAge = newValue;
                          rangeLabelsAge = RangeLabels(newValue.start.toStringAsFixed(1), newValue.end.toStringAsFixed(1));
                          lookingPersonAgeMax = newValue.end;
                          lookingPersonAgeMin = newValue.start;
                          personProvider.ageMin = newValue.start;
                          personProvider.ageMax = newValue.end;
                        });
                        
                      }),
                    ),
                  ),
                  Text("" + lookingPersonAgeMax.toStringAsFixed(1),
                      style: TextStyle(
                          //color: ColorManager().theme.textColor
                          ))
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            RaisedButton(
              onPressed: () async{
                await updateFilterCount();
                Navigator.of(context).pop();
              },

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              // color: ColorManager().theme.secondary,
              //textColor: ColorManager().theme.textColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("חפש",
                    style: TextStyle(
                        // color: ColorManager().theme.textColor,
                        fontSize: 18)),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  personProvider.pickedCountry = {};
                  personProvider.pickedArea = {};
                  personProvider.pickedStatus = {};
                  lookingPersonAgeMin = personProvider.ageMin = 18;
                  lookingPersonAgeMax = personProvider.ageMax = 99;
                  rangeValuesAge = RangeValues(18, 99);
                });
              },
              child: Text(
                "נקה",
                style: TextStyle(
                    //color: ColorManager().theme.textColor,
                    fontSize: 18),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
