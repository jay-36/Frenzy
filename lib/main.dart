import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:music/CryptoCurrency/crypto.dart';
import 'package:music/Frenzy Chat.dart';
import 'file:///D:/Flutter_project/music/lib/json/httpjson.dart';
import 'file:///D:/Flutter_project/music/lib/json/jsondata.dart';
import 'package:music_player/music_player.dart';

// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: json(),
//     );
//   }
// }



// void main Method For CryptoCurrency And Data Get From httpjson

void main() async{
  List data = await getCurrency();
  print(data);
  runApp(new MyApp(data));
}

class MyApp extends StatelessWidget {
  final List _data;
  MyApp(this._data);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.green : Colors.red,
      ),
      home: crypto(_data),
    );
  }
}

Future<List> getCurrency()async{
  String url = "https://jaylukhi.000webhostapp.com/cryptocurrency.%20json";
  http.Response response = await http.get(url);
  return jsonDecode(response.body);
}
