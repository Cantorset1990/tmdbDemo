import 'package:flutter/material.dart';
import 'package:movie_reel/Utils/cast_generator.dart';
import '../Utils/secure_storage.dart';
import '../Utils/search_generator.dart';
import '../Utils/cast_generator.dart';
import '../Utils/popular_generator.dart';



class PopularApp extends StatelessWidget {

  const PopularApp({Key? key}) : super(key: key);

  static const String _title = 'MovieReel';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),
          backgroundColor: Colors.orange,),
        body: const MyStatefulWidget(),
      ),
    );
  }
}



class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> {



  final TextEditingController _movieNameController = TextEditingController();
  String dropdownValue = 'Cast Members';
  List<String> itemList = [];

  void refresh(){

    setState(() {
      PopularGenerator.generatePopular();
    });

  }

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      PopularGenerator.generatePopular();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return

      Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[

              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Top 5 Movies',
                    style: TextStyle(fontSize: 20),
                  )),



              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(



                  // textDirection: TextDirection.rtl,
                  // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                  // border:TableBorder.all(width: 2.0,color: Colors.red),
                  children:  [

                    TableRow(
                        children: [
                          const Text("1",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),


                          Text( PopularGenerator.rank1, textScaleFactor: 1),

                          Text( PopularGenerator.rank1_overview, textScaleFactor: 1),


                        ]
                    ),




                    TableRow(
                        children: [
                          const Text("2",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),


                          Text( PopularGenerator.rank2, textScaleFactor: 1),

                          Text( PopularGenerator.rank2_overview, textScaleFactor: 1),


                        ]
                    ),



                    TableRow(
                        children: [
                          const Text("3",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),


                          Text( PopularGenerator.rank3, textScaleFactor: 1),

                          Text( PopularGenerator.rank3_overview, textScaleFactor: 1),


                        ]
                    ),


                    TableRow(
                        children: [
                          const Text("4",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),


                          Text( PopularGenerator.rank4, textScaleFactor: 1),

                          Text( PopularGenerator.rank4_overview, textScaleFactor: 1),


                        ]
                    ),



                    TableRow(
                        children: [
                          const Text("5",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),


                          Text( PopularGenerator.rank5, textScaleFactor: 1),

                          Text( PopularGenerator.rank5_overview, textScaleFactor: 1),


                        ]
                    ),





                  ],
                ),


              ),


              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    child: const Text("Refresh List"),
                    onPressed: refresh,
                  )
              ),




            ],
          ));
  }
}