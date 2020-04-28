//   import 'package:dating/main.dart';
// import 'package:dating/models/person.dart';
// import 'package:dating/providers/langText.dart';
// import 'package:dating/providers/staticFunctions.dart';
// import 'package:flutter/material.dart';

// Widget personalDetails(screenSize, {bool mainSelected: true}) {
//     Person currentPerson ;//= mainSelected ? widget.myPerson : widget.person;
//     Person otherPerson  ;// = mainSelected ? widget.person : widget.myPerson;
//     TextStyle agestyle = TextStyle(
//         fontSize: 17, color: StaticFunctions.getAge(otherPerson.birthday) <= currentPerson.ageMax && StaticFunctions.getAge(otherPerson.birthday) >= currentPerson.ageMin ? Colors.green : Colors.red);
//     TextStyle heightStyle = TextStyle(fontSize: 17, color: otherPerson.height <= currentPerson.heightMax && otherPerson.height >= currentPerson.heightMin ? Colors.green : Colors.red);

//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 5),
//        //width: mainSelected? (screenSize.width* 0.666)-0.5:(screenSize.width * 0.333)-0.5,
//       width: (screenSize.width / 2) - 0.5,
//       decoration: new BoxDecoration(
//         color: Colors.white,
//         borderRadius:
//             mainSelected ? BorderRadius.only(bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)) : BorderRadius.only(bottomRight: Radius.circular(30), topRight: Radius.circular(30)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0, bottom: 25),
//             child: Text(
//               currentPerson.firstName,
//               style: TextStyle(fontSize: 25, color: Colors.deepPurple, fontWeight: FontWeight.bold),
//             ),
//           ),
//           //Age
//           Container(
//                 padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//                 width: double.infinity,
//                 color: Colors.grey[200],
//                 child: 
              
//                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
//                   Text(
//                     StaticFunctions.getAge(currentPerson.birthday).toString(),
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   Row(
//                     children: <Widget>[
//           Text(
//             currentPerson.ageMin.round().toString(),
//             style: agestyle,
//           ),
//           Text("-", style: agestyle),
//           Text(currentPerson.ageMax.round().toString(), style: agestyle)
//                     ],
//                   ),
//                 ])
              
//                 ),
//           //Country
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             child: 
            
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),currentPerson.country.toString())),
//                 Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: currentPerson.countrys
//                         .map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),e.toString()), style: TextStyle(color: (currentPerson.countrys.contains(otherPerson.country)) ? Colors.green : Colors.red))))
//                         .toList())
              
//               ],
//             )
           
//           ),
//           //Area
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             color: Colors.grey[200],
//             child:
//              Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),currentPerson.area.toString())),
//                 Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: currentPerson.areas
//                         .map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),e.toString()), style: TextStyle(color: (currentPerson.countrys.contains(otherPerson.country)) ? Colors.green : Colors.red))))
//                         .toList())
//               ],
//             ),
//           ),
//           //Status
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),currentPerson.status.toString())),
//                 Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: currentPerson.statuses
//                         .map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),e.toString()), style: TextStyle(color: (currentPerson.statuses.contains(otherPerson.status)) ? Colors.green : Colors.red))))
//                         .toList())
//               ],
//             ),
//           ),
//           //Religious
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             color: Colors.grey[200],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),currentPerson.dos.toString())),
//                 Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: currentPerson.doses
//                         .map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),e.toString()), style: TextStyle(color: (currentPerson.doses.contains(otherPerson.dos)) ? Colors.green : Colors.red))))
//                         .toList())
//               ],
//             ),
//           ),
//           //Hashkafa
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),currentPerson.hashkafa.toString())),
//                 Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: currentPerson.hashkafas
//                         .map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),e.toString()), style: TextStyle(color: (currentPerson.hashkafas.contains(otherPerson.hashkafa)) ? Colors.green : Colors.red))))
//                         .toList())
//               ],
//             ),
//           ),
//           //Eda
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             color: Colors.grey[200],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),currentPerson.eda.toString())),
//                 Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children:
//                         currentPerson.edas.map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),e.toString()), style: TextStyle(color: (currentPerson.edas.contains(otherPerson.eda)) ? Colors.green : Colors.red)))).toList())
//               ],
//             ),
//           ),
//           //Smoking
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),currentPerson.smoke.toString())),
//                 Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: currentPerson.smoking
//                         .map((e) => (Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),e.toString()), style: TextStyle(color: (currentPerson.smoking.contains(otherPerson.smoke)) ? Colors.green : Colors.red))))
//                         .toList())
//               ],
//             ),
//           ),
//           //Sherut
//           Container(
//               padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//               color: Colors.grey[200],
//               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
//                 Text(
//                   currentPerson.height.toString(),
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Text(
//                       currentPerson.heightMin.toString(),
//                       style: heightStyle,
//                     ),
//                     Text("-", style: heightStyle),
//                     Text(currentPerson.heightMax.toString(), style: heightStyle)
//                   ],
//                 ),
//               ])),
//           //sherut
//           Container(
//               padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//               child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: 
                  
//                   currentPerson.gender == Gender.MALE
//                       ?currentPerson.mySherutBoy!=null?
//                       currentPerson.mySherutBoy.map((e) => Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),e.toString()))).toList():
//                       []
//                       :
//                       currentPerson.mySherutGirl!=null?
//                       currentPerson.mySherutGirl.map((e) => Text(LocaleText.getLocaleSelectText(MyApp.getLocale(),e.toString()))).toList():
//                      []
//                        ,
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: currentPerson.gender == Gender.MALE
//                           ?currentPerson.thereSherutGirl
//                               .map((e) => Text(
//                                     LocaleText.getLocaleSelectText(MyApp.getLocale(),e.toString()),
//                                     style: TextStyle(color: (otherPerson.thereSherutBoy.contains(e) ? Colors.green : Colors.red)),
//                                   ))
//                               .toList()
//                           : currentPerson.thereSherutBoy
//                               .map((e) => Text(
//                                     LocaleText.getLocaleSelectText(MyApp.getLocale(),e.toString()),
//                                     style: TextStyle(color: (otherPerson.thereSherutGirl.contains(e) ? Colors.green : Colors.red)),
//                                   ))
//                               .toList(),
//                     ),
//                   ],
//                 ),
//               ])),
//         ],
//       ),
//     );
//   }