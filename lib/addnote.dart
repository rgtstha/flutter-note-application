import 'package:flutter/material.dart';
import 'package:learning/model/Task.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController inputTitle = TextEditingController();
  TextEditingController inputDescription = TextEditingController();
  Color selectedColor = Colors.white;

  List<Color> _colors = [
    Colors.lime,
    Colors.redAccent,
    Colors.orange,
    Colors.indigoAccent,
    Colors.lightGreenAccent,
    Colors.cyan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Note",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Title can not be empty";
                    } else
                      return null;
                  },
                  controller: inputTitle,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      border: InputBorder.none,
                      hintText: "Enter Title",
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                    color: selectedColor,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Title can not be empty";
                      } else
                        return null;
                    },
                    controller: inputDescription,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                        border: InputBorder.none,
                        hintText: "Enter Title",
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 50.0,
                child: ListView.builder(
                    itemCount: _colors.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedColor = _colors[index];
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10.0),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _colors[index]),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _popScreen();
                  }
                },
                child: Text("Add Note"),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _popScreen() {
    Navigator.pop(
        context,
        Note(
            title: inputTitle.text,
            description: inputDescription.text,
            colour: selectedColor));
  }
}
