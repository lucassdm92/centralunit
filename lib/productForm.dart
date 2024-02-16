import 'dart:convert';
import 'dart:io';

import 'package:centralunit/UserData.dart';
import 'package:centralunit/productVo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// Define a custom Form widget.
class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  ProductFormState createState() {
    return ProductFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class ProductFormState extends State<ProductForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  late Future<String> futureTes;

  TextEditingController _productNameController = TextEditingController();
  TextEditingController _productDescriptionController = TextEditingController();
  TextEditingController _productQuantityController = TextEditingController();
  TextEditingController _productSizeController = TextEditingController();
  TextEditingController _productAmountController = TextEditingController();

  void _incrementCounter() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _sendInformation() async {
    try {
      ProductVo product = ProductVo(
          _productNameController.text,
          _productDescriptionController.text,
          _productQuantityController.text,
          _productSizeController.text,
          _productAmountController.text);

      var response = await http.post(
          Uri.parse("http://localhost:8080/product/createProduct"),
          body: jsonEncode(product.toJson()),
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
        _productNameController.clear();
        _productDescriptionController.clear();
        _productQuantityController.clear();
        _productSizeController.clear();
        _productAmountController.clear();
      } else {
        print("Teve falha");
      }
    } catch (error, stackTrace) {
      // Captura o erro e imprime o stack trace
      print('Erro durante a solicitação HTTP: $error');
      print('Stack Trace: $stackTrace');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Form'),
          backgroundColor: Colors.lightGreen,
        ),
        body: Padding(
          padding: EdgeInsets.all(60.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _productNameController,
                    decoration:
                        const InputDecoration(labelText: 'Product Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _productDescriptionController,
                    decoration:
                        const InputDecoration(labelText: 'Product Description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _productQuantityController,
                    decoration:
                        const InputDecoration(labelText: 'Product Quantity'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _productSizeController,
                    decoration:
                        const InputDecoration(labelText: 'Product Size'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                      controller: _productAmountController,
                      decoration:
                          const InputDecoration(labelText: 'Product Amount'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o nome';
                        }
                        return null;
                      }),
                  ElevatedButton(
                      onPressed: _sendInformation, child: const Text('Send'))
                ],
              )),
        ));
  }
}
