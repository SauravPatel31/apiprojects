import 'dart:convert';

import 'package:apiprojects/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  
  registerUser({required String name,required String surname,required String email,required String password})async{
    var respo =await http.post(Uri.parse("https://www.sparkstoideas.com/LJ/api/register"),body: {
      "Name":name,
      "SurName":surname,
      "Email":email,
      "Password":password
    });
    if(respo.statusCode==200){
      var userData = jsonDecode(respo.body);
      print(userData);
      if(userData["response_code"]=="1"){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage(),));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${userData["message"]}"),backgroundColor: Colors.green,));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${userData["message"]}"),backgroundColor: Colors.red,));
      }
      setState(() {});
      //Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Register Page"),
              SizedBox(height: 12,),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 12,),
              TextField(
                controller: surNameController,
                decoration: InputDecoration(
                  hintText: "SurName",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 12,),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 12,),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 12,),
              ElevatedButton(onPressed: (){
                if(nameController.text.isNotEmpty && surNameController.text.isNotEmpty && emailController.text.isNotEmpty && passController.text.isNotEmpty){
                  registerUser(name: nameController.text, surname: surNameController.text, email: emailController.text, password: passController.text);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
                }
              }, child: Text("Register",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w900),),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white,minimumSize: Size(double.infinity, 50)),)
            ],
          ),
        ),
      ),
    );
  }
}
