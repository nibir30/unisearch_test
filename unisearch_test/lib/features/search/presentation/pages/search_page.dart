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
  bool isPasswordObscure = true;
  bool isAllSubmitted = false;
  bool isThereResult = false;
  bool isSelected = false;
  SearchResultEntity? selectedVarsity;
  int searchLength = 0;

  SearchBloc searchBloc = SearchBloc();

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
              Padding(
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
                                    isAllSubmitted = false;
                                    isSelected = false;
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
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24),
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
                                  isAllSubmitted = false;
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
                                  isAllSubmitted = false;
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
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isAllSubmitted = true;
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
                    if (isAllSubmitted)
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
