import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class httpjson extends StatefulWidget {
  @override
  _httpjsonState createState() => _httpjsonState();
}

class _httpjsonState extends State<httpjson> {
  List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getdata();
  }

  Future<String> getdata()async{
    var httpdata = await http.get(Uri.encodeFull('https://jaylukhi.000webhostapp.com/person.json'));
    setState(() {
      var responce = jsonDecode(httpdata.body);
      data = responce['result'];
    });
    return "success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context,int index){
            return Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Name : "+data[index]['Name']),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Age : "+data[index]['Age']),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Category : "+data[index]['Category'])
                    ],
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
