import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class crypto extends StatefulWidget {

  final List data;
  crypto(this.data);

  @override
  _cryptoState createState() => _cryptoState();
}

class _cryptoState extends State<crypto> {

  List data;
  List<MaterialColor> _colors = [Colors.orange,Colors.blue,Colors.red,Colors.green];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crypto',),elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0 : 5.0,),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Jay Lukhi"),
              accountEmail: Text("jaylukhi36@gmail.com"),
            ),
            ListTile(
              title: Text("Page One"),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => page_one("Page One"),));},
            ),
            ListTile(
              title: Text("Close"),
              onTap: ()=>Navigator.of(context).pop(),
            ),
          ],
        )
      ),
      body: _widgetCurrency(),
    );
  }

  Widget _widgetCurrency(){
    return new Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: widget.data.length,
                itemBuilder: (BuildContext context,int index){
                  final Map currency = widget.data[index];
                  final MaterialColor color = _colors[index % _colors.length];
                  return _getListUi(currency, color);
                }),
          ),
        ],
      )
    );
  }

  ListTile _getListUi(Map currency , MaterialColor color){
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['Name'][0],style: TextStyle(color: Colors.black),),
      ),
      title: Text(currency['Name']),
      subtitle: _getSubtitle(currency['Value'],currency['Change_Price']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitle(String Value,String Change_Price){
    TextSpan spantext = new  TextSpan(text: "\$$Value\n",style: TextStyle(color: Colors.black));
    String ChangePriceText = "1 Hour : $Change_Price%";
    TextSpan change_Pricewidget;

    if(double.parse(Change_Price)>0){
      change_Pricewidget = new TextSpan(text: ChangePriceText,style: TextStyle(color: Colors.green));
    }
    else{
      change_Pricewidget = new TextSpan(text: ChangePriceText,style: TextStyle(color: Colors.red));
    }
    return RichText(
      text: TextSpan(
        children: [spantext,change_Pricewidget]
      ),
    );
  }
}


class page_one extends StatelessWidget {
  String name;
  page_one(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name),),
      body: Container(),
    );
  }
}

class Steps extends StatefulWidget {
  @override
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ,
    );
  }
}

