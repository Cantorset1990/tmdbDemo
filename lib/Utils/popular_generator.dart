import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'secure_storage.dart';

class PopularGenerator{


  static String urlPopular
  = 'https://api.themoviedb.org/3/movie/popular?api_key=739dc26bcaea398752b757b54a6042d2';

  static Uri getPopular()
  {
    return Uri.parse(urlPopular);
  }



  static String rank1= "";
  static String rank2 = "";
  static String rank3 = "";
  static String rank4 = "";
  static String rank5 = "";

  static String rank1_overview= "";
  static String rank2_overview = "";
  static String rank3_overview = "";
  static String rank4_overview = "";
  static String rank5_overview = "";


  static Future generatePopular()
  {
    return  get(getPopular())
        .then((response){

      //print(response.body.toString());
      rank1 = json.decode(response.body)['results'][0]['title'].toString();
      rank1_overview = json.decode(response.body)['results'][0]['overview'].toString();
      rank2 = json.decode(response.body)['results'][1]['title'].toString();
      rank2_overview = json.decode(response.body)['results'][1]['overview'].toString();
      rank3 = json.decode(response.body)['results'][2]['title'].toString();
      rank3_overview = json.decode(response.body)['results'][2]['overview'].toString();
      rank4 = json.decode(response.body)['results'][3]['title'].toString();
      rank4_overview = json.decode(response.body)['results'][3]['overview'].toString();
      rank5 = json.decode(response.body)['results'][4]['title'].toString();
      rank5_overview = json.decode(response.body)['results'][4]['overview'].toString();

    });
  }


}