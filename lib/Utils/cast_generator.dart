import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'secure_storage.dart';

class CastGenerator{


  static Uri getPerson(String personID)
  {
    return Uri.parse('https://api.themoviedb.org/3/person/'+ personID
        +'?api_key=739dc26bcaea398752b757b54a6042d2');
  }

  String test
  = 'https://api.themoviedb.org/3/person/3122189?api_key=739dc26bcaea398752b757b54a6042d2';

  static String birthday= "";
  static String name = "";
  static String biography = "";
  static String homepage = "";
  static String birthplace = "";
  static String profilePath = "";

  static Future generateCast(String personID)
  {
    return  get(getPerson(personID))
    .then((response){

      //print(response.body.toString());
      name = json.decode(response.body)['name'];
      birthday = json.decode(response.body)['birthday'];
      biography = json.decode(response.body)['biography'];
      homepage = json.decode(response.body)['homepage'];
      birthplace = json.decode(response.body)['place_of_birth'];
      profilePath = json.decode(response.body)['profile_path'];

    });
  }


}