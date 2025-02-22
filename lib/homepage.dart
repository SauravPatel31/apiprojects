import 'dart:convert';

import 'package:apiprojects/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget{
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<dynamic> mData=[];
  @override
  getData()async{
      var respo =await http.get(Uri.parse("https://dummyjson.com/quotes"));
      if(respo.statusCode==200){
        var data =jsonDecode(respo.body);
        print(data);
        mData=data["quotes"];
        setState(() {});
      }
  }
  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: mData.isNotEmpty?ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(mData[index]['quote'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            subtitle: Text(mData[index]['author'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,),),
          ),
        );
      },):Center(child: CircularProgressIndicator(),),
    );
  }
}