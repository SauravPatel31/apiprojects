import 'dart:convert';

import 'package:apiprojects/qModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget{

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    getData();
  }
  List<dynamic> quotesData=[];
  quotes_model?mData;
  getData()async{
    String url = "https://dummyjson.com/quotes";
    var respo =await http.get(Uri.parse(url));
    if(respo.statusCode==200){
      var data =jsonDecode(respo.body);
      print(data);
      print(data["quote"]);
      mData= quotes_model.fromJson(data);
      setState(() {});
    }else{
      print("Error");
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: mData!.quotes!.length,
        itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            title: Text(mData!.quotes![index].quote!),
            subtitle: Text(mData!.quotes![index].author!),
          ),
        );
      },)
    );
  }
}