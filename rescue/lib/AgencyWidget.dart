import 'package:flutter/material.dart';
import 'package:rescue/models/Agency.dart';

class agencyDetail extends StatelessWidget {
  Agency agency;
   agencyDetail(this.agency,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text('Name:${agency.name}')
            ],
          ),
          Row(
            children: [
              Text('Address:${agency.address}')
            ],
          ),
          Row(
            children: [
              Text('City:${agency.city}')
            ],
          ),
          Row(
            children: [
              Text('Contact No:${agency.contactNumber}')
            ],
          ),
          Row(
            children: [
              Text('Categories:${agency.categories}')
            ],
          ),
          

        ],
      ),
    );
  }
}