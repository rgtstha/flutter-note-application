import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'addnote.dart';
import './model/Task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showDialogBox(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("haha"),
          );
        });
  }

  List<Note> _todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "My Notes",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StaggeredGridView.countBuilder(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        itemCount: _todos.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onLongPress: () => showDialogBox,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: _todos[index].colour,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_todos[index].title,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  _todos[index].description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
      ),
      bottomNavigationBar: new BottomAppBar(
        notchMargin: 4.0,
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(null),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.orange,
        elevation: 0.0,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => addNote(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void addNote() async {
    Note result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddNote()));
    if (result != null) {
      setState(() {
        _todos.add(result);
      });
    }
  }
}
