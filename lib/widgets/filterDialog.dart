// import 'package:dating/main.dart';
// import 'package:dating/models/person.dart';
// import 'package:dating/providers/langText.dart';
// import 'package:dating/providers/personProvider.dart';
// import 'package:dating/providers/staticFunctions.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class FilterDialog extends StatefulWidget {
//   @override
//   _FilterDialogState createState() => _FilterDialogState();
// }

// class _FilterDialogState extends State<FilterDialog> {
//   FormFieldState<Country> countryState;

//   var _country;

//   Country countryValue;
//   Map map1 = new Map();

//   FormFieldState<Area> areaState;

//   var _area;

//   Area areaValue;

//   FormFieldState<Status> statusState;

//   var _status;

//   Status statusValue;

//   PersonProvider personProvider;
//   double lookingPersonAgeMin = 18;
//   double lookingPersonAgeMax = 99;
//   RangeValues rangeValuesAge = RangeValues(18, 99);
//   RangeLabels rangeLabelsAge = RangeLabels('18', '99');
//   bool isInit = true;
//   @override
//   void didChangeDependencies() {
//     if (isInit) {
//       personProvider = Provider.of<PersonProvider>(context);
//       _country = personProvider.pickedCountry;
//       // _area = personProvider.pickedArea;
//       // _status = personProvider.pickedStatus;
//       lookingPersonAgeMin = personProvider.ageMin;
//       lookingPersonAgeMax = personProvider.ageMax;
//       rangeValuesAge = RangeValues(personProvider.ageMin, personProvider.ageMax);

//       //  rangeLabelsAge = RangeLabels(personProvider.ageMin.toString(), personProvider.ageMax.toString());
//       //  lookingPersonAgeMin = personProvider.ageMin;
//       // lookingPersonAgeMax = personProvider.ageMax;
//       isInit = false;
//     }

//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Flexible(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     //Country
//                     // new FormField<Country>(
//                     //   builder: (FormFieldState<Country> state) {
//                     //     countryState = state;
//                     //     return InputDecorator(
//                     //       decoration: InputDecoration(
//                     //         icon: const Icon(Icons.location_on),
//                     //         labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Country'),
//                     //         errorText: state.hasError ? state.errorText : null,
//                     //       ),
//                     //       isEmpty: _country == null,
//                     //       child: new DropdownButtonHideUnderline(
//                     //         child: Listener(
//                     //           onPointerDown: (_) => FocusScope.of(context).unfocus(),
//                     //           child: new DropdownButton<Country>(
//                     //             value: _country,
//                     //             isDense: true,
//                     //             onChanged: (Country newValue) {
//                     //               // map1["date"]= {newValue.toString():state};
//                     //               //lll.add(state);
//                     //               countryValue = newValue;
//                     //               map1.putIfAbsent(newValue, () => state);
//                     //               setState(() {
//                     //                 personProvider.pickedCountry = newValue;
//                     //                 _country = newValue;
//                     //                 state.didChange(newValue);
//                     //               });
//                     //             },
//                     //             items: Country.values.map((Country value) {
//                     //               return new DropdownMenuItem<Country>(
//                     //                 value: value,
//                     //                 child: new Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),value.toString())),
//                     //               );
//                     //             }).toList(),
//                     //           ),
//                     //         ),
//                     //       ),
//                     //     );
//                     //   },
//                     //   validator: (val) {
//                     //     return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
//                     //   },
//                     // ),
//                     //AREA
//                     if (countryValue == Country.ISRAEL)
//                       // new FormField<Area>(
//                       //   builder: (FormFieldState<Area> state) {
//                       //     areaState = state;
//                       //     return InputDecorator(
//                       //       decoration: InputDecoration(
//                       //         icon: const Icon(Icons.location_on),
//                       //         labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Area'),
//                       //         errorText: state.hasError ? state.errorText : null,
//                       //       ),
//                       //       isEmpty: _area == null,
//                       //       child: new DropdownButtonHideUnderline(
//                       //         child: Listener(
//                       //           onPointerDown: (_) => FocusScope.of(context).unfocus(),
//                       //           child: new DropdownButton<Area>(
//                       //             value: _area,
//                       //             isDense: true,
//                       //             onChanged: (Area newValue) {
//                       //               // map1["date"]= {newValue.toString():state};
//                       //               //lll.add(state);
//                       //               areaValue = newValue;
//                       //               map1.putIfAbsent(newValue, () => state);
//                       //               setState(() {
//                       //                 personProvider.pickedArea = newValue;
//                       //                 _area = newValue;
//                       //                 state.didChange(newValue);
//                       //               });
//                       //             },
//                       //             items: Area.values.map((Area value) {
//                       //               return new DropdownMenuItem<Area>(
//                       //                 value: value,
//                       //                 child: new Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),value.toString())),
//                       //               );
//                       //             }).toList(),
//                       //           ),
//                       //         ),
//                       //       ),
//                       //     );
//                       //   },
//                       //   validator: (val) {
//                       //     return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
//                       //   },
//                       // ),
//                     //STATUS
//                     new FormField<Status>(
//                       builder: (FormFieldState<Status> state) {
//                         statusState = state;
//                         return InputDecorator(
//                           decoration: InputDecoration(
//                             icon: const Icon(Icons.people),
//                             labelText: LocaleText.getLocaleText(MyApp.getLocale(), 'Status'),
//                             errorText: state.hasError ? state.errorText : null,
//                           ),
//                           isEmpty: _status == null,
//                           child: new DropdownButtonHideUnderline(
//                             child: Listener(
//                               onPointerDown: (_) => FocusScope.of(context).unfocus(),
//                               child: new DropdownButton<Status>(
//                                 value: _status,
//                                 isDense: true,
//                                 onChanged: (Status newValue) {
//                                   statusValue = newValue;
//                                   setState(() {
//                                     // personProvider.pickedStatus = newValue;
//                                     _status = newValue;
//                                     state.didChange(newValue);
//                                   });
//                                 },
//                                 items: Status.values.map((Status value) {
//                                   return new DropdownMenuItem<Status>(
//                                     value: value,
//                                     child: new Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),value.toString())),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       validator: (val) {
//                         return val != null ? null : LocaleText.getLocaleText(MyApp.getLocale(), 'This field is required');
//                       },
//                     ),

//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 10),
//                       child: Column(
//                         children: <Widget>[
//                           Align(
//                             alignment: MyApp.getLocale() == "he" ? Alignment.topRight : Alignment.topLeft,
//                             child: Container(
//                               padding: const EdgeInsets.only(top: 14.0),
//                               child: Text(
//                                 LocaleText.getLocaleText(MyApp.getLocale(), 'Age'),
//                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
//                               ),
//                             ),
//                           ),
//                           Row(
//                             children: <Widget>[
//                               Text(
//                                 "" + lookingPersonAgeMin.toStringAsFixed(1),
//                               ),
//                               Expanded(
//                                 child: RangeSlider(
//                                   min: 18,
//                                   max: 99,
//                                   divisions: 162,
//                                   labels: rangeLabelsAge,
//                                   values: rangeValuesAge,
//                                   onChanged: ((newValue) {
//                                     setState(() {
//                                       rangeValuesAge = newValue;
//                                       rangeLabelsAge = RangeLabels(newValue.start.toStringAsFixed(1), newValue.end.toStringAsFixed(1));
//                                       lookingPersonAgeMax = newValue.end;
//                                       lookingPersonAgeMin = newValue.start;
//                                       personProvider.ageMin = newValue.start;
//                                       personProvider.ageMax = newValue.end;
//                                     });
//                                   }),
//                                 ),
//                               ),
//                               Text("" + lookingPersonAgeMax.toStringAsFixed(1))
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   OutlineButton(
//                     onPressed: () {
//                       _country = personProvider.pickedCountry = null;
//                       _area = personProvider.pickedArea = null;
//                       _status = personProvider.pickedStatus = null;
//                       lookingPersonAgeMin = personProvider.ageMin = 18;
//                       lookingPersonAgeMax = personProvider.ageMax = 99;
//                       rangeValuesAge = RangeValues(18, 99);
//                       Navigator.pop(context);
//                     },
//                     child: Text("Clear"),
//                   ),
//                   OutlineButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text("Filter"),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
