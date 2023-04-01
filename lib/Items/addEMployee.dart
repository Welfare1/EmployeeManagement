import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("Open Popup"),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                scrollable: true,
                title: Text('Login'),
                content: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                            icon: Icon(Icons.account_box),
                          ),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(Icons.email),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Message',
                            icon: Icon(Icons.message),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  ElevatedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        // your code
                      })
                ],
              );
            });
      },
    );
  }
}
