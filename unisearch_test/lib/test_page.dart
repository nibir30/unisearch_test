import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unisearch_test/searchModel.dart';
import 'package:http/http.dart' as http;

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  TextEditingController varsityController = TextEditingController();
  int searchLength = 0;

  Future<List<SearchModel>> searchResults = getSearchResults("");
  static Future<List<SearchModel>> getSearchResults(String? query) async {
    String url = 'http://universities.hipolabs.com/search?name=';
    if (query != null) {
      url = 'http://universities.hipolabs.com/search?name=' + query.toString();
    } else {
      url = 'http://universities.hipolabs.com/search?name=';
    }
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);
    return body.map<SearchModel>(SearchModel.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            height: 60,
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    //
                    searchLength = value.length;
                    if (value.length > 2) {
                      searchResults = getSearchResults(value);
                    }
                  });
                },
                controller: varsityController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(),
                ),
              ),
            ),
          ),
          if (searchLength > 2)
            Expanded(
              child: Container(
                child: FutureBuilder<List<SearchModel>>(
                  future: searchResults,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      final search = snapshot.data!;
                      return buildResult(search);
                    }
                    return Container();
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget buildResult(List<SearchModel> searchResult) {
  return ListView.builder(
    itemCount: searchResult.length,
    itemBuilder: (context, index) {
      final singleResult = searchResult[index];

      return Card(
        child: ListTile(
          title: Text(singleResult.name!),
          subtitle: Text(singleResult.country!),
        ),
      );
    },
  );
}
