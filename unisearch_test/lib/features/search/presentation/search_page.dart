// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController varsityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  bool isSubmitted = false;

  _SearchPageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[200],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "UniSearch",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Enter a University name to get the details",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
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
                              isSubmitted = false;
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
                    SizedBox(height: 24),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Enter a username",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
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
                              isSubmitted = false;
                            });
                          },
                          controller: usernameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Enter password",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow[100],
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Center(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              isSubmitted = false;
                            });
                          },
                          controller: passwordController,
                          obscureText: isObscure,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffix: Container(
                              child: isObscure
                                  ? InkWell(
                                      onTap: () {
                                        setState(
                                          () {
                                            isObscure = !isObscure;
                                          },
                                        );
                                      },
                                      child: Text(
                                        "Show",
                                        style: TextStyle(
                                          color: Color.fromRGBO(61, 97, 152, 1),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        setState(
                                          () {
                                            isObscure = !isObscure;
                                          },
                                        );
                                      },
                                      child: Text(
                                        "Hide",
                                        style: TextStyle(
                                          color: Color.fromRGBO(61, 97, 152, 1),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSubmitted = true;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 220,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange[200],
                        ),
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (isSubmitted)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Text("Username: "),
                      SizedBox(height: 20),
                      Text(
                        "Stanford",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Lorem Ipsum",
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Lorem Ipsum",
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Lorem Ipsum",
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
