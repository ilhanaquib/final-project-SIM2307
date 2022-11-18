import 'dart:io';

import 'package:app_two/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class toSell extends StatefulWidget {
  const toSell({Key? key,required this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  State<toSell> createState() => _toSellState();
}

class _toSellState extends State<toSell> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController typeController = new TextEditingController();


  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Describe your item'),
      ),
      body: ListView(
        children: [
          Image.file(File('${widget.imagePath}')),
          Padding(padding: EdgeInsets.only(bottom: 40)),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Item name'
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          TextField(
            controller: priceController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'price : RM'
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          TextField(
            controller: descController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Item description'
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20)),
          TextField(
            controller: typeController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Item type'
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 40)),
          TextButton(onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return homeScreen();
            }));
          }, child: Text('Submit',style: TextStyle(fontSize: 20),))
        ],
      ),
    );
  }
}
