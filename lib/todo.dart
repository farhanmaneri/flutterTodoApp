import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = '';
  List<dynamic> lst = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              color: Colors.amber,
              margin: EdgeInsets.only(top: 15),
              child: ListTile(
                title: Text('${lst[index]}'),
                trailing: Container(
                  width: 50,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Edit item'),
                                    content: TextField(
                                      onChanged: (value) {
                                        output = value;
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              lst.replaceRange(
                                                  index, index + 1, {output});
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: Text('Edit'))
                                    ],
                                  );
                                });
                          },
                          child: Icon(Icons.edit)),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              lst.removeAt(index);
                            });
                          },
                          child: Icon(Icons.delete)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Add item'),
                      content: TextField(
                        onChanged: (value) {
                          output = value;
                        },
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                lst.add(output);
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text('Add'))
                      ],
                    );
                  });
            },
            child: Text('Add')));
  }
}
