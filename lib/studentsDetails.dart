import 'package:flutter/material.dart';

class StudentsDetails extends StatefulWidget {
  final dynamic response;
  
  StudentsDetails({this.response});

  @override
  _StudentsDetailsState createState() => new _StudentsDetailsState();

  
}

class _StudentsDetailsState extends State<StudentsDetails> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
    void initState() {
      super.initState();
      _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
    }

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
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: "CHATS"),
            new Tab(
              text: "STATUS",
            ),
            new Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: Text(widget.response.toString())
    );
  }

}