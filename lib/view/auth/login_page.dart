import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    final mqsize = MediaQuery.of(context).size;
    return  Scaffold(
    appBar: AppBar(),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Center(

          ),
          SizedBox(height: mqsize.height*0.1,),
          
        ],
      ),
    ),

    );
  }
}