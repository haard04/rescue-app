import 'package:flutter/material.dart';
import 'package:rescue/API/APIService.dart';
import 'package:rescue/AgencyWidget.dart';
import 'package:rescue/models/Agency.dart';

class userHomePage extends StatelessWidget {
  List<Agency>agencies;
   userHomePage(this.agencies,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd54339),
        title: Text('Agency Near You',style: TextStyle(color: Colors.white),),
      ),

    body: Container(

      
      child:ListView.builder(
      itemCount: agencies.length,
      itemBuilder: (context, index) {
        return agencyDetail(agencies[index]);
      },
    )
    
    ),
    
    );
  }
}