import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/group/group_page.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Language Group Chat",
          style: TextStyle(color: Colors.white),
          // textAlign: Center(widthFactor: kToolbarHeight),
        )),
        backgroundColor: Colors.orange[400],
      ),
      body: Center(
          child: TextButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: const Text(
                          "Please enter your name",
                          style: TextStyle(fontSize: 16),
                        ),
                        content: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.length < 3) {
                                return "Please enter name with more than 3 character";
                              }
                              return null;
                            },
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                nameController.clear();
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.red),
                              )),
                          TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  String name = nameController.text;
                                  nameController.clear();
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GroupPage(
                                              name: name, userId: uuid.v1())));
                                }
                              },
                              child: const Text(
                                "Enter",
                                style: TextStyle(color: Colors.green),
                              )),
                        ],
                      )),
              child: const Text(
                "Initiate Group chat",
                style: TextStyle(color: Colors.teal),
              ))),
    );
  }
}
