import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating/models/person.dart';
import 'package:dating/models/shadchan.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:dating/screens/compareThemList.dart';
import 'package:flutter/material.dart';
import 'package:dating/screens/addPerson.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'loader.dart';

class ShadchanListCard2 extends StatefulWidget {
  final Person person;
   final Shadchan shadchan;
  final Function reset;
  final Function updateVisible;
  ShadchanListCard2(this.person,this.shadchan,this.reset,this.updateVisible);
  @override
  _ShadchanListCard2State createState() => _ShadchanListCard2State();
}

class _ShadchanListCard2State extends State<ShadchanListCard2> {
  @override
  Widget build(BuildContext context) {
    PersonProvider personProvider = Provider.of<PersonProvider>(context);
    return GestureDetector(
      onTap: (){
        personProvider.newPerson=widget.person;
          Navigator.of(context).push( new MaterialPageRoute( builder: (context) => new AddPerson(update: true,))).then((value) {
          widget.reset();
          });
      },
          child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.grey[100],
        child: ClipPath(
           clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                 
                child: Container(
            decoration: BoxDecoration(
      border: Border(
          
      //  top: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
          right: BorderSide(width: 12.0, color: Colors.lightBlue.shade900),
      ),
  ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(15.0),
                           topRight: Radius.circular(15.0),
                          ),
                          ),
                  //color: Colors.blue,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Container(
                              width: 70,
                              height: 70,
                              child: ClipOval(
                                child:widget.person.profileImages!=null? CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: widget.person.profileImages[0],
                                  placeholder: (context, url) => Loader(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ):Container(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(widget.person.firstName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                                    Text(" ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                                    Text(widget.person.lastName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                                     Text(" ,", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                                      Text(StaticFunctions.getAge(widget.person.birthday).toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                                  ],
                                ),
                                 Text(widget.person.short,style: TextStyle(color: Colors.grey),),
                                // Row(
                                //   children: <Widget>[
                                //     Text(
                                //       "Bet Shemesh",
                                //       style: TextStyle(fontSize: 15),
                                //     ),
                                //     Icon(Icons.location_on)
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              widget.updateVisible(widget.person.id,!widget.person.isVisible);
                              setState(() {
                               widget.person.isVisible=!widget.person.isVisible;
                              });
                            },
                            child: Icon(widget.person.isVisible?Icons.visibility:Icons.visibility_off,color: Colors.black54,)),
                        )
                    ],
                  ),
                ),
                Divider(height: 1,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                             Text(LocaleText.getLocaleText(MyApp.getLocale(), 'viewes'),style: TextStyle(color: Colors.grey),),
                            Text(
                              widget.person.views.toString(),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                           
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                           Text(LocaleText.getLocaleText(MyApp.getLocale(), 'requests'),style: TextStyle(color: Colors.grey),),
                          Text(
                            widget.person.requests.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                         
                        ],
                      ),
                      Column(
                        children: <Widget>[
                           Text(LocaleText.getLocaleText(MyApp.getLocale(), 'dates'),style: TextStyle(color: Colors.grey),),
                          Text(
                            widget.person.dates.toString(),
                            style: TextStyle(
                                fontSize: 20, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                          ),
                         
                        ],
                      ),
                      OutlineButton(
                        onPressed: (){
                          Navigator.of(context).push( new MaterialPageRoute( builder: (context) => new CompareThemList(widget.person,widget.shadchan)));
  
                        },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Compare'),style: TextStyle(color: Colors.purple),),
                          ],
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                     borderSide: BorderSide(
                       
                  color: Colors.purple, //Color of the border
                  style: BorderStyle.solid, //Style of the border
                  width: 1, //width of the border
                ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        elevation: 5,
      ),
    );
  }
}
