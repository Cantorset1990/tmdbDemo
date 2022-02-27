import 'package:flutter/material.dart';
import '../Utils/secure_storage.dart';
import '../Utils/search_generator.dart';
import '../Utils/cast_generator.dart';
import 'cast_display.dart';



class ProfileApp extends StatelessWidget {

  const ProfileApp({Key? key}) : super(key: key);

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
  late String selected ;
  bool _isLoading = false;

  void getCast(){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CastApp(),
    ));
  }



  Future doTask()  {

   return SearchGenerator.generateSearch2(_movieNameController.text).then((value){

      setState(() {

        //SecureStorage.writeSecureData("searchNumber", searchNumber.toString());
        SecureStorage.writeSecureData("title", SearchGenerator.title);
        SecureStorage.writeSecureData("id", SearchGenerator.id);
        SecureStorage.writeSecureData("overview", SearchGenerator.overview);
        SecureStorage.writeSecureData("release", SearchGenerator.release);
        SecureStorage.writeSecureData("runtime", SearchGenerator.runtime);
        SecureStorage.writeSecureData("cast", SearchGenerator.cast);
        SecureStorage.writeSecureData("castID", SearchGenerator.castID);
        selected = SearchGenerator.cast.split(',')[0];

      });



    });


  }

  void submitSearch() async {

    setState(() {
      _isLoading = true;
    });

    await doTask();

    setState(() {
      _isLoading = false;
    });

    //return SecureStorage.readSecureData("cast");
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      //selected = SearchGenerator.cast.split(',')[0];
      SecureStorage.readSecureData("cast").then((value){
        selected = value.split(',')[0];
      });
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

          return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[

                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Search Movie',
                        style: TextStyle(fontSize: 20),
                      )),


                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _movieNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Movie Name:',
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(


                      // textDirection: TextDirection.rtl,
                      // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
                      // border:TableBorder.all(width: 2.0,color: Colors.red),
                      children: [


                        TableRow(
                            children: [
                              const Text ("Title", textScaleFactor: 1,
                                style: TextStyle(fontWeight: FontWeight.bold),),

                              FutureBuilder(
                                  future: SecureStorage.readSecureData("title"),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(snapshot.data.toString(),
                                          textScaleFactor: 1);
                                    }
                                    else {
                                      return const Text(
                                          "NIL", textScaleFactor: 1);
                                    }
                                  }),


                            ]
                        ),


                        TableRow(
                            children: [
                              const Text ("Movie ID", textScaleFactor: 1,
                                style: TextStyle(fontWeight: FontWeight.bold),),

                              FutureBuilder(
                                  future: SecureStorage.readSecureData("id"),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(snapshot.data.toString(),
                                          textScaleFactor: 1);
                                    }
                                    else {
                                      return const Text(
                                          "NIL", textScaleFactor: 1);
                                    }
                                  }),


                            ]
                        ),

                        TableRow(
                            children: [

                              const Text("Overview", textScaleFactor: 1,
                                style: TextStyle(fontWeight: FontWeight.bold),),

                              FutureBuilder(
                                  future: SecureStorage.readSecureData(
                                      "overview"),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(snapshot.data.toString(),
                                          textScaleFactor: 1);
                                    }
                                    else {
                                      return const Text(
                                          "NIL", textScaleFactor: 1);
                                    }
                                  }),


                            ]
                        ),
                        TableRow(
                            children: [
                              const Text("Release Year", textScaleFactor: 1,
                                style: TextStyle(fontWeight: FontWeight.bold),),

                              FutureBuilder(
                                  future: SecureStorage.readSecureData(
                                      "release"),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(snapshot.data.toString(),
                                          textScaleFactor: 1);
                                    }
                                    else {
                                      return const Text(
                                          "NIL", textScaleFactor: 1);
                                    }
                                  }),

                            ]
                        ),

                        TableRow(
                            children: [
                              const Text("Run Time", textScaleFactor: 1,
                                style: TextStyle(fontWeight: FontWeight.bold),),

                              FutureBuilder(
                                            future: SecureStorage.readSecureData(
                                            "runtime"),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {

                                      return Text(snapshot.data.toString(),
                                          textScaleFactor: 1);
                                    }

                                    else {
                                      return const Text(
                                          "NIL", textScaleFactor: 1);
                                    }


                                  }),

                            ]
                        ),

                        TableRow(
                            children: [
                              const Text("Cast List", textScaleFactor: 1,
                                style: TextStyle(fontWeight: FontWeight.bold),),

                              FutureBuilder(
                                  future: SecureStorage.readSecureData("cast"),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(snapshot.data.toString(),
                                          textScaleFactor: 1);
                                    }
                                    else {
                                      return const Text(
                                          "NIL", textScaleFactor: 1);
                                    }
                                  }),

                            ]
                        ),


                      ],
                    ),
                  ),


                  FutureBuilder(future: SecureStorage.readSecureData("cast"),
                      builder: (context, snapshot) {
                        try {

                          if ( _isLoading == true) {
                            return const Text(
                                'Loading...', style: TextStyle(fontSize: 30));
                          }


                          else if (snapshot.hasData && _isLoading == false) {
                            List<String> dropDownItemList = (snapshot.data
                                .toString()).split(',');


                            return DropdownButton<String>(
                              value: selected,
                              hint: const Text("Select Cast"),
                              items: dropDownItemList.map((String value) {
                                return DropdownMenuItem<String>(

                                  value: value,
                                  child: InkWell(child: Text(value)),
                                );
                              }).toList(),
                              onChanged: (selectedText) {
                                setState(() {
                                  selected = selectedText!;
                                  //String idSelected = SearchGenerator.castID.split(",")[dropDownItemList.indexOf(selected)];
                                  CastGenerator.generateCast(
                                      SearchGenerator.castID.split(
                                          ",")[dropDownItemList.indexOf(
                                          selected)]);
                                  //print("selected:" + idSelected);

                                });
                              },


                            );
                          }

                          else {
                            return DropdownButton<String>(
                              value: "No Cast",
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>['No Cast']
                                  .map<DropdownMenuItem<String>>((
                                  String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            );
                          }
                        }catch(ex){
                          return const Text(
                              'Loading...', style: TextStyle(fontSize: 30));
                        }
                      }
                  ),


                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: ElevatedButton(
                        child: const Text("Search Movie"),
                        onPressed: submitSearch,
                      )
                  ),

                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: ElevatedButton(
                        child: const Text("Get Cast Details"),
                        onPressed: getCast,
                      )
                  ),


                ],
              )
          );

  }
}