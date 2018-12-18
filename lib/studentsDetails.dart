import 'package:flutter/material.dart';

class StudentsDetails extends StatefulWidget {
  final dynamic response;
  
  StudentsDetails({this.response});

  @override
  _StudentsDetailsState createState() => new _StudentsDetailsState();

  
}

class _StudentsDetailsState extends State<StudentsDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.response);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Studiantes',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold)),
      ),
      body: Text(widget.response.toString())
    );
  }

}