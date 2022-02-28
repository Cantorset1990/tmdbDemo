import 'package:flutter/material.dart';
import 'package:movie_reel/Utils/cast_generator.dart';
import '../Utils/secure_storage.dart';
import '../Utils/search_generator.dart';
import '../Utils/cast_generator.dart';



class CastApp extends StatelessWidget {

  const CastApp({Key? key}) : super(key: key);

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
                    'Cast Details',
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
                          const Text("Name",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),


                          Text( CastGenerator.name, textScaleFactor: 1),


                        ]
                    ),




                    TableRow(
                        children: [
                          const Text("Birthday",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),


                          Text( CastGenerator.birthday, textScaleFactor: 1),


                        ]
                    ),



                    TableRow(
                        children: [
                          const Text("Birthplace",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),


                          Text( CastGenerator.birthplace, textScaleFactor: 1),


                        ]
                    ),


                    TableRow(
                        children: [
                          const Text("Biography",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),


                          Text( CastGenerator.biography, textScaleFactor: 1),


                        ]
                    ),



                    TableRow(
                        children: [
                          const Text("Home Page",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),


                          Text( CastGenerator.homepage, textScaleFactor: 1),


                        ]
                    ),


                    TableRow(
                        children: [
                          const Text("Profile Path",textScaleFactor: 1,style: TextStyle(fontWeight: FontWeight.bold),),


                          Text( CastGenerator.profilePath, textScaleFactor: 1),


                        ]
                    ),




                  ],
                ),
              ),







            ],
          ));
  }
}
