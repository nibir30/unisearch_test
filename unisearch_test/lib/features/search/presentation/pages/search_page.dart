// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unisearch_test/features/search/domain/entities/search_request_entity.dart';
import 'package:unisearch_test/features/search/domain/entities/search_result_entity.dart';
import 'package:unisearch_test/features/search/presentation/searchBloc/search_bloc.dart';

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
  SearchBloc searchBloc = SearchBloc();

  bool isPasswordObscure = true;
  bool isAllSubmitted = false;
  bool isThereResult = false;
  bool isSelected = false;
  bool isDropDownVisible = false;
  SearchResultEntity? selectedVarsity;
  int searchLength = 0;

  //validation
  bool isPassword6char = true;
  bool isPasswordstrong = true;

  bool isUsernameSmall = false;

  bool validatePassword(String pass) {
    RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  void refreshUsernameInputs() {
    isAllSubmitted = false;
    isThereResult = false;
    isUsernameSmall = false;
  }

  void refreshPasswordInputs() {
    isAllSubmitted = false;
    isThereResult = false;
    isPassword6char = true;
    isPasswordstrong = true;
  }

  _SearchPageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[200],
        body: SingleChildScrollView(
          child: Stack(
            children: [
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  setState(() {
                    isThereResult = false;
                  });
                },
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
                      BlocListener(
                        bloc: searchBloc,
                        listener: (BuildContext context, state) {
                          if (state is SearchCreatedState) {
                            print("paisiiiiiiiiiiiiiiiiiiiii " + state.getSearchResultsEntity.results!.length.toString());
                            setState(() {
                              if (state.getSearchResultsEntity.results!.isNotEmpty) {
                                isThereResult = true;
                              } else {
                                isThereResult = false;
                              }
                            });
                          }
                        },
                        child: Container(),
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
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Center(
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      searchLength = value.length;
                                      if (value.length > 2) {
                                        searchBloc.add(RequestSearchEvent(SearchRequestEntity(value)));
                                      }
                                      isSelected = false;
                                      isAllSubmitted = false;
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
                          ),
                          if (!isSelected)
                            Column(
                              children: [
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "Please select a valid University",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
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
                                    refreshUsernameInputs();
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
                          if (isUsernameSmall)
                            Column(
                              children: [
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "•	Username must contain atleast 4 characters",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
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
                                    refreshPasswordInputs();
                                  });
                                },
                                controller: passwordController,
                                obscureText: isPasswordObscure,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffix: Container(
                                    child: isPasswordObscure
                                        ? InkWell(
                                            onTap: () {
                                              setState(
                                                () {
                                                  isPasswordObscure = !isPasswordObscure;
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
                                                  isPasswordObscure = !isPasswordObscure;
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
                          if (!isPasswordstrong)
                            Column(
                              children: [
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "•	Password should contain atleast a Capital letter, a small letter, a Number and a Special Character",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          if (!isPassword6char)
                            Column(
                              children: [
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    "• Password length should be atleast 6",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
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
                                FocusScopeNode currentFocus = FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                isAllSubmitted = true;
                                if (passwordController.text.length < 6) isPassword6char = false;
                                isPasswordstrong = validatePassword(passwordController.text);

                                if (usernameController.text.length < 4) {
                                  isUsernameSmall = true;
                                }
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
                      if (isAllSubmitted && isSelected && (isPassword6char && isPasswordstrong && !isUsernameSmall))
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Text("Username: " + usernameController.text),
                            SizedBox(height: 20),
                            Text(
                              "Univeristy: " + selectedVarsity!.name!,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Country: " + selectedVarsity!.country!,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Alpha Two Code: " + selectedVarsity!.alpha_two_code!,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Website: " + selectedVarsity!.web_pages![0],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              if (isThereResult && !isSelected)
                Positioned(
                  top: 204,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: 70,
                        maxHeight: 250,
                      ),
                      width: size.width - 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: BlocBuilder(
                        bloc: searchBloc,
                        builder: (BuildContext context, SearchState state) {
                          if (state is SearchLoadingState) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is SearchErrorState) {
                            return Text(state.errorMsg, style: TextStyle(color: Colors.red));
                          } else if (state is SearchCreatedState) {
                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: state.getSearchResultsEntity.results!.length,
                              itemBuilder: (context, index) {
                                final singleResult = state.getSearchResultsEntity.results![index];

                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSelected = true;
                                      selectedVarsity = singleResult;
                                      varsityController.text = singleResult.name!;
                                    });
                                  },
                                  child: ListTile(
                                    title: Text(singleResult.name!),
                                    subtitle: Text(singleResult.country!),
                                  ),
                                );
                              },
                            );
                            ;
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
