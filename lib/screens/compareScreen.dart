import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class CompareScreen extends StatefulWidget {
  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  ScrollController scrollController;
  double rowHeight = 150;
  double radious = 30;
  _scrollListener() {
   
    // if (scrollController.position.pixels<200 && scrollController.position.userScrollDirection==ScrollDirection.reverse && rowHeight>=100) {
    //   setState(() {
    //     rowHeight-=1;
    //     radious-=0.3;
    //   });
    // }
    // else if(scrollController.position.pixels<200 && scrollController.position.userScrollDirection==ScrollDirection.forward && rowHeight<200){
    //    setState(() {
    //     rowHeight+=1;
    //     radious+=0.3;
    //   });
    // }
    // print(scrollController.position.pixels.toString());
    //print("row height:"+rowHeight.toString()+" radious: "+radious.toString());
 }
 @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    print("object");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("compare"),),
      body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
          child: 
                    Row(
                      children: <Widget>[
        
                        Container(
                        
                          decoration: BoxDecoration(
                                    color: Colors.indigoAccent,
                                    boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              offset: new Offset(0.0, -10.0),
              blurRadius: 10.0,
            )
          ],
                          ),
                          child: DataTable(
                            dataRowHeight: 150,
                            columns: [DataColumn(label: Text("")),],
                                 rows: [
                                  DataRow(cells: [
                                    DataCell(
                                      Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          CircleAvatar(radius: radious,backgroundImage: NetworkImage(
                              'https://placeimg.com/640/480/any',
                              //fit: BoxFit.fill,
                            )),
                            Text("shmuel",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)
                                        ],
                                      ),

                                    ),
                                    ),
                                    ]
                                    
                                  ),
                                   
                                  
                                  DataRow(cells: [
                                    DataCell(
                                      Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          CircleAvatar(radius: radious,backgroundImage: NetworkImage(
                              'https://placeimg.com/640/480/any',
                              //fit: BoxFit.fill,
                            )),
                            Text("shmuel",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)
                                        ],
                                      ),

                                    ),
                                    ),
                                     ]
                                    
                                  ),
                                   
                                ],
                           
                          ),
                        ),
                        Expanded(
                                                  child: SingleChildScrollView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                                          child: DataTable(
                                            dataRowHeight: rowHeight,

                              columns: [
                              
                                DataColumn(label: Text("age",style: TextStyle(color: Theme.of(context).primaryColor,))),
                                DataColumn(label: Text("location",style: TextStyle(color: Theme.of(context).primaryColor,))),
                                DataColumn(label: Text("status",style: TextStyle(color: Theme.of(context).primaryColor,))),
                                DataColumn(label: Text("religios rama",style: TextStyle(color: Theme.of(context).primaryColor,))),
                                DataColumn(label: Text("hashkafa",style: TextStyle(color: Theme.of(context).primaryColor,))),
                                DataColumn(label: Text("eda",style: TextStyle(color: Theme.of(context).primaryColor,))),
                                DataColumn(label: Text("smoking",style: TextStyle(color: Theme.of(context).primaryColor,))),
                                DataColumn(label: Text("one liner",style: TextStyle(color: Theme.of(context).primaryColor,))),
                                DataColumn(label: Text("long me",style: TextStyle(color: Theme.of(context).primaryColor,))),
                                DataColumn(label: Text("height",style: TextStyle(color: Theme.of(context).primaryColor,))),
                                DataColumn(label: Text("service",style: TextStyle(color: Theme.of(context).primaryColor,))),
                              ],
                              rows: [
                                DataRow(cells: [
                                 DataCell(Text("28")),
                                   DataCell(Text("bet shemesh")),
                                   DataCell(Text("ravak")),
                                  DataCell(Text("normal")),
                                   DataCell(Text("dati leumi")),
                                  DataCell(Text("ashkenazi")),
                                   DataCell(Text("no")),
                                  DataCell(Text("so cool dude")),
                                   DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(width: 200,child: SingleChildScrollView(child: Text("so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude dude so cool dude so cool dude so cool dude so cool dude",maxLines: null,))),
                                  )),
                                 DataCell(Text("175")),
                                  DataCell(Column(
                                    
                                    children: <Widget>[
                                       Spacer(),
                                      Text("army"),
                                         SizedBox(height: 10,),
                                       Text("hesder"),
                                        Spacer(),
                                    ],
                                  )),
                                ]
                                  
                                ),
                                 
                                
                                DataRow(cells: [
                                  DataCell(Text("28")),
                                   DataCell(Text("bet shemesh")),
                                     DataCell(Text("ravak")),
                                  DataCell(Text("normal")),
                                   DataCell(Text("dati leumi")),
                                  DataCell(Text("ashkenazi")),
                                   DataCell(Text("no")),
                                  DataCell(Text("so cool dude")),
                                  DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(width: 200,child: SingleChildScrollView(child: Text("so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude so cool dude dude so cool dude so cool dude so cool dude so cool dude",maxLines: null,))),
                                  )),
                                  DataCell(Text("175")),
                                  DataCell(Column(
                                    children: <Widget>[
                                     Spacer(),
                                      Text("army"),
                                         SizedBox(height: 10,),
                                       Text("hesder"),
                                        Spacer(),
                                    ],
                                  )),
                                ]
                                  
                                ),
                                 
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
             
        ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text("looking for compare",style: TextStyle(fontSize: 20),),
                    ),
                    
                    
                  ),
                  SizedBox(height: 20,),
                  DataTable(
                                      dataRowHeight: 100,

                        columns: [
                          DataColumn(label: Text("")),
                          DataColumn(label: Text("shmuel",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),
                          DataColumn(label: Expanded(
                                                      child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("hello"),
                              ],
                            ),
                          )),
                          
                        ],
                        rows: [
                          DataRow(cells: [
                           
                            DataCell(Text("age")),
                             DataCell(Center(child: Text("25-28"))),
                             DataCell(Center(child: Text("29",style: TextStyle(color: Colors.red),))),
                           ]
                            
                          ),
                           
                          
                          DataRow(cells: [
                            DataCell(Text("height")),
                             DataCell(Center(child: Text("160 - 170"))),
                               DataCell(Center(child: Text("168",style: TextStyle(color: Colors.green),))),
                          ]

                          
                            
                          ),

                          DataRow(cells: [
                            DataCell(Text("location")),
                             DataCell(Center(child: Column(
                               children: <Widget>[
                                 Spacer(),
                                 Text("Jerusalem"),
                                 Text("negev"),
                                 Spacer(),
                               ],
                             ))),
                               DataCell(Center(child: Text("Jerusalem",style: TextStyle(color: Colors.green),))),
                          ] 
                          ),

                           DataRow(cells: [
                            DataCell(Text("religious")),
                             DataCell(Center(child: Column(
                               children: <Widget>[
                                 Spacer(),
                                 Text("very"),
                              
                                 Spacer(),
                               ],
                             ))),
                               DataCell(Center(child: Text("not so",style: TextStyle(color: Colors.red),))),
                          ] 
                          
                          ),
                            DataRow(cells: [
                            DataCell(Text("hashkafa")),
                             DataCell(Center(child: Column(
                               children: <Widget>[
                                 Spacer(),
                                 Text("chabad"),
                                  Text("leumi"),
                              
                                 Spacer(),
                               ],
                             ))),
                               DataCell( Center(
                                                                child: Column(
                                 children: <Widget>[
                                   Spacer(),
                                   Text("chabad",style: TextStyle(color: Colors.green)),
                                    Text("charedi",style: TextStyle(color: Colors.red)),
                              
                                   Spacer(),
                                 ],
                             ),
                               )),
                          ] 
                          
                          ),
                          DataRow(cells: [
                            DataCell(Text("status")),
                             DataCell(Center(child: Column(
                               children: <Widget>[
                                 Spacer(),
                                 Text("ravak"),
                              
                                 Spacer(),
                               ],
                             ))),
                               DataCell(Center(child: Text("ravak",style: TextStyle(color: Colors.green),))),
                          ] 
                          
                          ),
                           
                        ],
                      ),
                    
                ],
              ),
      ),
    );
  }
}