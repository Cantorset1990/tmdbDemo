import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'secure_storage.dart';

class castDetail{


  String id;
  String name;

  castDetail(this.id, this.name);

  castDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, String> toJson() =>
      {
        'id' : id,
        'name': name,
      };

}


class SearchGenerator
{

  static String title = "";
  static String id = "";
  static String overview = "";
  static String release = "";
  static String runtime = "";
  static String cast = "";
  //static String castName = "";
  static String castID = "";
  static String test = "";

  static Uri getID(String movieID)
  {
    return Uri.parse('https://api.themoviedb.org/3/movie/'+ movieID
        +'?api_key=739dc26bcaea398752b757b54a6042d2');
  }

  static Uri getSearch(String query)
  {
   return Uri.parse('https://api.themoviedb.org/3/search/movie?api_key=739dc26bcaea398752b757b54a6042d2&query='
       + query);
  }

  static Uri getMovieCredits(String movieID)
  {
    return Uri.parse('https://api.themoviedb.org/3/movie/'+ movieID + '/credits'
        +'?api_key=739dc26bcaea398752b757b54a6042d2');
  }

  static Uri getPersonDetails(String personID){

    return Uri.parse('https://api.themoviedb.org/3/person/'+ personID
        +'?api_key=739dc26bcaea398752b757b54a6042d2');
  }

  static Future generateSearch(String query)   {


    return get(getSearch(query))
    .then((response1){

      title = json.decode(response1.body)['results'][0]['original_title'].toString();

      id = json.decode(response1.body)['results'][0]['id'].toString();
      overview = json.decode(response1.body)['results'][0]['overview'].toString();

      release = json.decode(response1.body)['results'][0]['release_date'].toString();

      get(getID(id))
          .then((response3){
        runtime = json.decode(response3.body)['runtime'].toString();
      });

      get(getMovieCredits(id))
          .then((response4){

            List<String> castList = [];
            List<String> castIDList = [];


            var x = json.decode(response4.body)["cast"][0]['name'].toString();
            var y = json.decode(response4.body)["cast"][0]['id'].toString();
            int i = 0;
            castList.add(x);
            castIDList.add(y);

            while(x != "" && y != "" ){
              i++;
                try {
                  x = json.decode(response4.body)["cast"][i]['name'].toString();
                  y = json.decode(response4.body)["cast"][i]['id'].toString();
                  //print(json.decode(response4.body)["cast"][i].toString());
                  castList.add(x);
                  castIDList.add(y);
                }catch(ex){break;}

            }

            cast = castList.join(',');
            castID = castIDList.join(',');


      });



    });






  }



  static Future generateSearch2(String query) async  {

    var response = await get(getSearch(query));
    title = json.decode(response.body)['results'][0]['original_title'].toString();
    //SecureStorage.writeSecureData("title", SearchGenerator.title);
    id = json.decode(response.body)['results'][0]['id'].toString();
    //SecureStorage.writeSecureData("id", SearchGenerator.id);
    overview = json.decode(response.body)['results'][0]['overview'].toString();
    //SecureStorage.writeSecureData("overview", SearchGenerator.overview);
    release = json.decode(response.body)['results'][0]['release_date'].toString();
    //SecureStorage.writeSecureData("release", SearchGenerator.release);
    await get(getID(id)).then((response2){

      runtime = json.decode(response2.body)['runtime'].toString();

    }).then((value){
      //SecureStorage.writeSecureData("runtime", SearchGenerator.runtime);
    });


    await get(getMovieCredits(id)).then((response3){

      List<String> castList = [];
      List<String> castIDList = [];


      var x = json.decode(response3.body)["cast"][0]['name'].toString();
      var y = json.decode(response3.body)["cast"][0]['id'].toString();
      int i = 0;
      castList.add(x);
      castIDList.add(y);

      while(x != "" && y != "" ){
        i++;
        try {
          x = json.decode(response3.body)["cast"][i]['name'].toString();
          y = json.decode(response3.body)["cast"][i]['id'].toString();
          //print(json.decode(response4.body)["cast"][i].toString());
          castList.add(x);
          castIDList.add(y);
        }catch(ex){break;}

      }

      cast = castList.join(',');
      castID = castIDList.join(',');

    }).then((value){
     // SecureStorage.writeSecureData("cast", SearchGenerator.cast);
     // SecureStorage.writeSecureData("castID", SearchGenerator.castID);
    });






  }



}