import 'dart:ffi';
import 'dart:convert';
//import 'package:easy_pass/CryptoUtils/Networks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:typed_data';
//import 'package:easy_pass/CryptoUtils/SVPrivateKey.dart';
import 'package:hex/hex.dart';
//import '../CryptoUtils/ECIES.dart';
//import '../CryptoUtils/SVPublicKey.dart';

class SecureStorage {

  static Uint8List dataFuture = Uint8List.fromList([0]);

  static const _storage = FlutterSecureStorage();


  static Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  static Future readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  static Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }

  static Future writeSecureDataByte(String key, Future<Uint8List> stream) {
    //Utf8Decoder decoder = const Utf8Decoder();
    return stream.then((value) {


      String data = base64Encode(value);
      //print(data);
      writeSecureData(key, data);

    });
  }

  static Future<Uint8List> readSecureDataByte(String key) async {


    String value = await readSecureData(key);

    return base64.decode(value);

  }








}