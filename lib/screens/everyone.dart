import 'package:dating/main.dart';
import 'package:dating/models/person.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:dating/widgets/personListCard2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Everyone extends StatefulWidget {
  @override
  _EveryoneState createState() => _EveryoneState();
}

class _EveryoneState extends State<Everyone> {
  PersonProvider personProvider;

  // ShadchanProvider shadchanProvider;
  final TextEditingController _filter = new TextEditingController();
  bool isInit = true;
  bool isLoading = true;
  FormFieldState<Country> countryState;

  var _country;

  Country countryValue;
  Map map1 = new Map();

  FormFieldState<Area> areaState;

  var _area;

  Area areaValue;

  FormFieldState<Status> statusState;

  double lookingPersonAgeMin = 18;
  double lookingPersonAgeMax = 99;
  RangeValues rangeValuesAge = RangeValues(18, 99);
  RangeLabels rangeLabelsAge = RangeLabels('18', '99');

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

  List<Widget> setChips(_enumValus) {
    List<Widget> chipList = [];

    for (var value in _enumValus) {
      chipList.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: new FilterChip(
          selectedColor: Colors.blueGrey[500],
          selected: personProvider.pickedStatus[value] != null && personProvider.pickedStatus[value]==true?true:false,
          label: new Text(StaticFunctions.getStatus(value)),
          backgroundColor: Colors.transparent,
          
          shape: StadiumBorder(side: BorderSide(color: Colors.blueGrey)),
          onSelected: (bool bvalue) {
            setState(() {
              personProvider.pickedStatus[value] = bvalue;
              print(personProvider.pickedStatus[value]);
            });
          },
        ),
      ));
    }

    return chipList;
  }

  @override
  Widget build(BuildContext context) {
    try {
      return (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : personProvider.allPeople.length > 0
              ? Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 10),
                          
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextField(
                                  style: TextStyle(color: Theme.of(context).accentColor),
                                  controller: _filter,
                                  autofocus: true,
                                  onChanged: (value) {
                                    personProvider.updateNameFilter(value);
                                    setState(() {});
                                  },
                                  decoration: new InputDecoration(
                                    
                                    contentPadding: EdgeInsets.all(0),
                                    // filled: true,
                                    // fillColor: Colors.white,
                                    hintStyle: TextStyle(
                                      color: Theme.of(context).accentColor,
                                    ),
                                    prefixIcon: new Icon(
                                      Icons.search,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    hintText: LocaleText.getLocaleText(MyApp.getLocale(), "Search Name"),
                                    border: OutlineInputBorder(
                                      
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.filter_list),
                                onPressed: () {},
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            LocaleText.getLocaleText(MyApp.getLocale(), 'Country'),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new FormField<Country>(
                            builder: (FormFieldState<Country> state) {
                              countryState = state;
                              return InputDecorator(
                                decoration: InputDecoration(
                                  
                                  // icon: const Icon(Icons.location_on),
                                  // labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Country'),
                                  errorText: state.hasError ? state.errorText : null,
                                ),
                                isEmpty: _country == null,
                                child: new DropdownButtonHideUnderline(
                                  child: Listener(
                                    onPointerDown: (_) => FocusScope.of(context).unfocus(),
                                    child: new DropdownButton<Country>(
                                      value: _country,
                                      isDense: true,
                                      onChanged: (Country newValue) {
                                        // map1["date"]= {newValue.toString():state};
                                        //lll.add(state);
                                        countryValue = newValue;
                                        map1.putIfAbsent(newValue, () => state);
                                        setState(() {
                                          personProvider.pickedCountry = newValue;
                                          _country = newValue;
                                          state.didChange(newValue);
                                        });
                                      },
                                      items: Country.values.map((Country value) {
                                        return new DropdownMenuItem<Country>(
                                          value: value,
                                          child: new Text(StaticFunctions.getCountry(value)),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              );
                            },
                            validator: (val) {
                              return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                            },
                          ),
                          //AREA
                          if (countryValue == Country.ISRAEL)
                            new FormField<Area>(
                              builder: (FormFieldState<Area> state) {
                                areaState = state;
                                return InputDecorator(
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.location_on),
                                    labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Area'),
                                    errorText: state.hasError ? state.errorText : null,
                                  ),
                                  isEmpty: _area == null,
                                  child: new DropdownButtonHideUnderline(
                                    child: Listener(
                                      onPointerDown: (_) => FocusScope.of(context).unfocus(),
                                      child: new DropdownButton<Area>(
                                        value: _area,
                                        isDense: true,
                                        onChanged: (Area newValue) {
                                          // map1["date"]= {newValue.toString():state};
                                          //lll.add(state);
                                          areaValue = newValue;
                                          map1.putIfAbsent(newValue, () => state);
                                          setState(() {
                                            personProvider.pickedArea = newValue;
                                            _area = newValue;
                                            state.didChange(newValue);
                                          });
                                        },
                                        items: Area.values.map((Area value) {
                                          return new DropdownMenuItem<Area>(
                                            value: value,
                                            child: new Text(StaticFunctions.getArea(value)),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              validator: (val) {
                                return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                              },
                            ),
                          // //STATUS
                          // new FormField<Status>(
                          //   builder: (FormFieldState<Status> state) {
                          //     statusState = state;
                          //     return InputDecorator(
                          //       decoration: InputDecoration(
                          //         icon: const Icon(Icons.people),
                          //         labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Status'),
                          //         errorText: state.hasError ? state.errorText : null,
                          //       ),
                          //       isEmpty: _status == null,
                          //       child: new DropdownButtonHideUnderline(
                          //         child: Listener(
                          //           onPointerDown: (_) => FocusScope.of(context).unfocus(),
                          //           child: new DropdownButton<Status>(
                          //             value: _status,
                          //             isDense: true,
                          //             onChanged: (Status newValue) {
                          //               statusValue = newValue;
                          //               setState(() {
                          //                 // personProvider.pickedStatus = newValue;
                          //                 _status = newValue;
                          //                 state.didChange(newValue);
                          //               });
                          //             },
                          //             items: Status.values.map((Status value) {
                          //               return new DropdownMenuItem<Status>(
                          //                 value: value,
                          //                 child: new Text(StaticFunctions.getStatus(value)),
                          //               );
                          //             }).toList(),
                          //           ),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //   validator: (val) {
                          //     return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
                          //   },
                          // ),
                           SizedBox(height: 10),
                          Text(
                            LocaleText.getLocaleText(MyApp.getLocale(), 'Status'),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                           SizedBox(height: 5),
                          Row(
                            children: setChips(Status.values),
                          ),
                           SizedBox(height: 10),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
                                  child: Container(
                                    child: Text(
                                      LocaleText.getLocaleText(MyApp.getLocale(), 'Age'),
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "" + lookingPersonAgeMin.toStringAsFixed(1),
                                    ),
                                    Expanded(
                                      child: RangeSlider(
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
                                    Text("" + lookingPersonAgeMax.toStringAsFixed(1))
                                  ],
                                ),
                              ],
                            ),
                          ),
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
              : Container();
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
