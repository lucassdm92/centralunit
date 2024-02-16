import 'dart:convert';
import 'dart:io';

import 'package:centralunit/UserData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  late Future<String> futureTes;

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _storeLocation = TextEditingController();

  void _incrementCounter() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _sendInformation() async {
    var response;

    try {
      StoreEntity storeEntity = StoreEntity(
          _nomeController.text, _description.text, _storeLocation.text);
      print(storeEntity.toJson().toString());
      var encoded = jsonEncode(storeEntity.toJson());
      print(encoded);
      response = await http.post(
          Uri.parse("http://localhost:8080/store/createStore"),
          body: encoded,
          headers: {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Credentials": "true",
            "Access-Control-Allow-Headers":
                "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
            "Access-Control-Allow-Methods": "POST, OPTIONS"
          });

      if (response.statusCode == 200) {
        print("Funcionou");
        _nomeController.clear();
        _description.clear();
        _storeLocation.clear();
      } else {
        print("Teve falha");
      }
    } catch (error, stackTrace) {
      // Captura o erro e imprime o stack trace
      print('Erro durante a solicitação HTTP: $error');
      print('Stack Trace: $stackTrace');
    }
  }

  String _sendInformation2() {
    //String jsonData =  jsonDecode(storeEntity.toJson().toString());
    return "";
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Store Form'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(labelText: 'Store Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _description,
                    decoration:
                        const InputDecoration(labelText: 'Store Description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _storeLocation,
                    decoration:
                        const InputDecoration(labelText: 'Store Location'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: _sendInformation, child: const Text('Send'))
                ],
              )),
        ));
  }
}
