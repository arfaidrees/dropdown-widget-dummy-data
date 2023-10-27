import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/dropdownmodel.dart'; // Assuming there's a file named posts_model.dart in the Models directory

class DropDownApi extends StatelessWidget {
  const DropDownApi({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _DropDownApiState extends State<DropDownApi> {
  Future<List<Dropdown>> getPostApi ()async{

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')) ;
      final body = json.decode(response.body) as List;
      if(response.statusCode == 200) {

        return  body.map((dynamic json) {
          final map = json as Map<String, dynamic>;
          return  Dropdown(
            id: map['id'] as int,
            title: map['title'] as String,
            body: map['body'] as String,
          );
        }).toList();
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }
    throw Exception('error fetching data');

  }

  var newData ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<PostsModel>>(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton(
                    // Initial Value
                    value: newData,
                    hint: Text('Select value'),
                    isExpanded: true,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: snapshot.data!.map<DropdownMenuItem<int>>((item) { // Assuming 'id' is of type int
                      return DropdownMenuItem<int>(
                        value: item.id,
                        child: Text(item.id.toString()),
                      );
                    }).toList(),

                    onChanged: (value) {
                      newData = value ;
                      setState(() {

                      });
                    },

                  );
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
