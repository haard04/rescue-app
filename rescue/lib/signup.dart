import 'package:flutter/material.dart';

class adminPanel extends StatelessWidget {
  const adminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => adminPanel(),));
        }, child: Text('efsdf')),
      ),
    );
  }
}