import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future<void> getUserApi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List with Complex JSON Data WithOut Model'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  ReUsableRow(
                                      title: 'Name: ',
                                      value: data[index]['name'].toString()),
                                  ReUsableRow(
                                      title: 'UserName: ',
                                      value: data[index]['username'].toString()),
                                  ReUsableRow(
                                      title: 'Email: ',
                                      value: data[index]['email'].toString()),
                                  ReUsableRow(
                                      title: 'Address: ',
                                      value: data[index]['address']['street'].toString()),
                                  ReUsableRow(
                                      title: 'Geo: ',
                                      value: data[index]['address']['geo'].toString()),
                                  ReUsableRow(
                                      title: 'Geo: ',
                                      value: data[index]['address']['geo']['lat'].toString()),
                                  ReUsableRow(
                                      title: 'Geo: ',
                                      value: data[index]['address']['geo']['lng'].toString()),
                                  ReUsableRow(
                                      title: 'Phone: ',
                                      value: data[index]['phone'].toString()),
                                  ReUsableRow(
                                      title: 'Company Name: ',
                                      value: data[index]['company']['name'].toString()),
                                ],
                              ),
                            );
                          });
                    }
                  })),
        ],
      ),
    );
  }
}

class ReUsableRow extends StatelessWidget {
  String title, value;
  ReUsableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(value),
        ],
      ),
    );
  }
}
