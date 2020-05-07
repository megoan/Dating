import 'package:animations/animations.dart';
import 'package:dating/main.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/themes/colorManager.dart';
import 'package:dating/widgets/filterPage.dart';
import 'package:dating/widgets/personListCard2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class _OpenContainerWrapper extends StatelessWidget {
//   const _OpenContainerWrapper({
//     this.closedBuilder,
//     this.transitionType,
//   });

//   final OpenContainerBuilder closedBuilder;
//   final ContainerTransitionType transitionType;

//   @override
//   Widget build(BuildContext context) {
//     return OpenContainer(
//       transitionType: transitionType,
//       openBuilder: (BuildContext context, VoidCallback _) {
//         return EveryBodyFilter();
//       },
//       tappable: false,
//       closedBuilder: closedBuilder,
//     );
//   }
// }

class Everyone extends StatefulWidget {
  @override
  _EveryoneState createState() => _EveryoneState();
}

class _EveryoneState extends State<Everyone> {
  PersonProvider personProvider;
  // final TextEditingController _filter = new TextEditingController();
  // ContainerTransitionType _transitionType = ContainerTransitionType.fadeThrough;
  bool isInit = true;
  bool isLoading = true;
  // double lookingPersonAgeMin = 18;
  // double lookingPersonAgeMax = 99;
  // RangeValues rangeValuesAge = RangeValues(18, 99);
  // RangeLabels rangeLabelsAge = RangeLabels('18', '99');
  // TextStyle titles = new TextStyle(color: ColorManager().theme.textColor, fontSize: 18);

  // Widget title(title) {
  //   return Padding(padding: EdgeInsets.all(5), child: Text(title, style: titles));
  // }

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
          color: ColorManager().theme.filterBackgroundColor,
          child: (isLoading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : personProvider.allPeople.length > 0
                  ? Column(
                      children: <Widget>[
                        // _OpenContainerWrapper(
                          
                        //     transitionType: _transitionType,
                        //     closedBuilder: (BuildContext _, VoidCallback openContainer) {
                        //       return Container(
                        //         padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                        //         color: ColorManager().theme.filterBackgroundColor,
                        //         child: Row(
                        // children: <Widget>[
                        //   Expanded(
                        //     child: TextField(
                        //         style: TextStyle(color: ColorManager().theme.textColor),
                        //         controller: _filter,
                        //         autofocus: true,
                        //         onChanged: (value) {
                        //           personProvider.updateNameFilter(value);
                        //           setState(() {});
                        //         },
                        //         decoration: new InputDecoration(
                        //           contentPadding: EdgeInsets.all(0),
                                  
                        //              enabledBorder: OutlineInputBorder(
                        //                   borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                        //                   borderSide: BorderSide(color: ColorManager().theme.primary, width: 1),
                        //                 ),
                        //           hintStyle: TextStyle(color: ColorManager().theme.primary[300]),
                        //           prefixIcon: new Icon(
                        //             Icons.search,
                        //             color: ColorManager().theme.textColor,
                        //           ),
                        //           hintText: LocaleText.getLocaleText(MyApp.getLocale(), "Search Name"),
                        //           border: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(30.0),
                        //           ),
                        //         ),
                        //     ),
                        //   ),
                        //    IconButton(
                        //             icon: Icon(
                        //              Icons.filter_list,
                        //               color: ColorManager().theme.textColor,
                        //             ),
                        //             onPressed: () => openContainer()),
                        
                          
                        // ],
                        //     ),
                        //       );}),
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
