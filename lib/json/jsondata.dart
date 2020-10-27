import 'dart:convert';

import 'package:flutter/material.dart';




class json extends StatelessWidget {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/data.json'),
        builder: (context,snapshot) {
          var mydata = jsonDecode(snapshot.data.toString());
          return new ListView.builder(
              itemCount: mydata == null ? 0 : mydata.length,
              itemBuilder: (BuildContext context,int index){
                return Card(
                    child: Column(
                      children: [
                        Text('Name : ' + mydata[index]['Name']),
                        Text('Age : ' + mydata[index]['Age']),
                        Text('Category : ' + mydata[index]['Category']),
                      ],
                    ),
                );
              }
          );
        },
      ),
    );
  }
}

