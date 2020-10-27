import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Frenzy_Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Frenzy Chat"),
        ),
        body: screen()
    );
  }
}


class screen extends StatefulWidget {
  @override
  _screenState createState() => _screenState();
}
class _screenState extends State<screen> {


  TextEditingController controller = TextEditingController();

  final List<message> _message = <message> [];


  void _handelSubmitt(String text){
    controller.clear();
    message msg = message(textline: text,);
    setState(() {
      _message.insert(0, msg);
    });
  }

  Widget _textCompose(){
    return Container(
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: controller,
              onSubmitted: _handelSubmitt,
              decoration: InputDecoration.collapsed(
                hintText: "Send Message",
              ),
            ),
          ),
          IconButton(icon: Icon(Icons.send),onPressed: ()=> _handelSubmitt(controller.text),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: ListView.builder(itemBuilder: (_,int index) => _message[index],itemCount: _message.length,),),
        Container(child: _textCompose(),)
      ],
    );
  }
}

const String _name = "jay";

class message extends StatelessWidget {

  final String textline ;
  message({this.textline});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: CircleAvatar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_name[0]+". "),
                  Text(textline[0].toUpperCase())
                ],
              ),
            ),
          ),
          Column(
            children: [
              Text(_name),
              Text(textline),
            ],
          )
        ],
      ),
    );
  }
}
