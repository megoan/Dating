import 'package:dating/main.dart';
import 'package:dating/models/person.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:dating/themes/colorManager.dart';
import 'package:dating/widgets/personListCard2.dart';
import 'package:dating/widgets/selectAndMultiSelectChips.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Everyone extends StatefulWidget {
  @override
  _EveryoneState createState() => _EveryoneState();
}

class _EveryoneState extends State<Everyone> {
  
  PersonProvider personProvider;
  final TextEditingController _filter = new TextEditingController();
  bool isInit = true;
  bool isLoading = true;
  bool showFilter = false;
  double lookingPersonAgeMin = 18;
  double lookingPersonAgeMax = 99;
  RangeValues rangeValuesAge = RangeValues(18, 99);
  RangeLabels rangeLabelsAge = RangeLabels('18', '99');
  TextStyle titles = new TextStyle(color: ColorManager().theme.textColor, fontSize: 18);
  
  Widget title(title) {
    return Padding(padding: EdgeInsets.all(5), child: Text(title, style: titles));
  }


  @override
  void didChangeDependencies() async {
    if (isInit) {
      isInit = false;
      personProvider = Provider.of<PersonProvider>(context);
      // shadchanProvider = Provider.of<ShadchanProvider>(context);
      await Future.wait([personProvider.getAllPeople(), personProvider.shadchanProvider.getAllShadchanim()]);
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }

    super.didChangeDependencies();
    //getAllPeople()
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Container( 
        color: ColorManager().theme.fillColor,
        child: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : personProvider.allPeople.length > 0
              ? Column(
                  children: <Widget>[
                    Container(
                      color: ColorManager().theme.filterBackgroundColor,
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  style: TextStyle(color: ColorManager().theme.textColor),
                                  controller: _filter,
                                  autofocus: true,
                                  onChanged: (value) {
                                    personProvider.updateNameFilter(value);
                                    setState(() {});
                                  },
                                  decoration: new InputDecoration(
                                    contentPadding: EdgeInsets.all(0),
                                    filled: true,
                                    fillColor: Colors.black12,
                                     hintStyle: TextStyle(color: ColorManager().theme.primary[300]),
                                    prefixIcon: new Icon(
                                      Icons.search,
                                      color:  ColorManager().theme.textColor,
                                    ),
                                    hintText: LocaleText.getLocaleText(MyApp.getLocale(), "Search Name"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ),
                              
                              IconButton(
                                icon: Icon(showFilter ? Icons.close : Icons.filter_list,color:  ColorManager().theme.textColor,),
                                onPressed: () {
                                  setState(() {
                                    showFilter = !showFilter;
                                  });
                                },
                              )
                            ],
                          )),
                    ),
                    if (showFilter)
                    Container(
                        color: ColorManager().theme.filterBackgroundColor,
                     
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //country
                         
                            title(LocaleText.getLocaleText(MyApp.getLocale(), 'Country')),
                          
                            MultiSelectChip(Country.values,(selected, val) { personProvider.pickedCountry[selected] = val;if (selected == Country.ISRAEL)setState(() {});},pickedChips:  personProvider.pickedCountry,),
                            //area
                            if (personProvider.pickedCountry[Country.ISRAEL]==true)
                            
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                title(LocaleText.getLocaleText(MyApp.getLocale(), 'Area')),
                                MultiSelectChip(Area.values,(selected, val) => personProvider.pickedArea[selected] = val,pickedChips:  personProvider.pickedArea,),
                              ],
                            ),
                            //status
                             title(LocaleText.getLocaleText(MyApp.getLocale(), 'Status')),
                            MultiSelectChip(Status.values,(selected, val) => personProvider.pickedStatus[selected] = val,pickedChips:  personProvider.pickedStatus,),
                            //age
                             title(LocaleText.getLocaleText(MyApp.getLocale(), 'Age')),
                            Row( children: <Widget>[
                                      Text(
                                        "" + lookingPersonAgeMin.toStringAsFixed(1),style: TextStyle(color: ColorManager().theme.textColor),
                                      ),
                                      Expanded(
                                        child: RangeSlider(
                                          activeColor: ColorManager().theme.secondary,
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
                                      Text("" + lookingPersonAgeMax.toStringAsFixed(1),style: TextStyle(color: ColorManager().theme.textColor))
                                    ],
                                  ),
                            //actions
                            SizedBox(height: 20,),
                            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
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
                                        child: Text("נקה",style: TextStyle(color: ColorManager().theme.textColor),),),
                                    RaisedButton(
                                      onPressed: (){
                                        setState(() {
                                          showFilter= false;
                                        });
                                      },
                                      color:  ColorManager().theme.secondary,
                                      textColor: ColorManager().theme.textColor,
                                      child: Text("חפש"),
                                    )
                                  ]),
                            
                          ],
                        ),
                      ),
                    Expanded(
                      child: GridView.builder(
                          itemCount: personProvider.allPeople.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 0, crossAxisCount: 2),
                          itemBuilder: (BuildContext context, int index) {
                            return returnCard(index);
                          }),
                    ),
                  ],
                )
              : Container());
    } catch (e) {
      setState(() {});

      return personProvider.allPeople.length > 0
          ? GridView.builder(
              itemCount: personProvider.allPeople.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return returnCard(index);
              })
          : Container();
    }
  }

  Widget returnCard(int index) {
    return (personProvider.nameFilter == null || personProvider.nameFilter == "")
        ? PersonListCardTest(personProvider.allPeople[index], personProvider.shadchanProvider.allShadchanimMap[personProvider.allPeople[index].shadchanID])
        : personProvider.allPeople[index].firstName.toLowerCase().contains(personProvider.nameFilter.toLowerCase()) ||
                personProvider.allPeople[index].lastName.toLowerCase().contains(personProvider.nameFilter.toLowerCase())
            ? PersonListCardTest(personProvider.allPeople[index], personProvider.shadchanProvider.allShadchanimMap[personProvider.allPeople[index].shadchanID])
            : Container();
  }
}
