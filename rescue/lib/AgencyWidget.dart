import 'package:flutter/material.dart';
import 'package:rescue/models/Agency.dart';
import 'package:url_launcher/url_launcher.dart';

class agencyDetail extends StatelessWidget {
  Agency agency;
   agencyDetail(this.agency,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future _launchCaller(number) async {
    String url = 'tel:${number}';   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   
}

    return Container(
      height: 300,
      color: (agency.availability==true)?Colors.green:Colors.red.withOpacity(0.5),
      child: Column(
        children: [
          Row(
            children: [
              
                 Expanded(
                  child: Text(
                    'Name:${agency.name}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                
              )
            ],
          ),
          Row(
            children: [
              Expanded(child: Text('Address:${agency.address}',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),))
            ],
          ),
          Row(
            children: [
              Text('City:${agency.city}',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),)
            ],
          ),
          Row(
            children: [
              Text('Contact No:${agency.contactNumber}',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),)
            ],
          ),
          Row(
            children: [
              Expanded(child: Text('Categories:${agency.categories}',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),))
            ],
          ),

          Row(
            children: [
              ElevatedButton(onPressed: (){
                _launchCaller(agency.contactNumber);
              }, child: Text('Call Now'))
            ],
          )
          

        ],
      ),
    );
  }
}