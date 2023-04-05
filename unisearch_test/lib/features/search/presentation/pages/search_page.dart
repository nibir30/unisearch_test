// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unisearch_test/constants/app_constant.dart';
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
  /// controllers for text editors
  TextEditingController usernameController = TextEditingController();
  TextEditingController varsityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// bloc for getting results from api
  SearchBloc searchBloc = SearchBloc();

  SearchResultEntity? selectedVarsity;

  /// search wont work for queries with search length of 2 or less
  int searchLength = 0;

  /// to keep password obscured
  bool isPasswordObscure = true;

  /// to keep track if the submit button pressed or not
  bool isSubmitted = false;

  /// to keep stop showing results when inputs are changed
  bool showResults = false;

  /// to keep track if any varsity is selected or not
  bool isVarsitySelected = false;

  /// to show drop down widget on search
  bool showDropDown = false;

  /// for validation purposes
  bool isPassword6char = true;
  bool isPasswordstrong = true;
  bool isUsernameSmall = false;

  //password validation checker
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  _SearchPageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// to check and unfocus of every textfield
    FocusScopeNode currentFocus = FocusScope.of(context);

    /// device size
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstants.backGround_color,
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
                            color: AppConstants.textField_color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Center(
                              child: FocusScope(
                                /// focus to open and close the drop down efficiently
                                child: Focus(
                                  onFocusChange: (focus) {
                                    setState(() {
                                      /// drop down button opens when focused
                                      showDropDown = focus;
                                    });
                                  },
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        showResults = false;
                                        showDropDown = true;
                                        searchLength = value.length;
                                        if (value.length > 2) {
                                          /// calls api if the query is at least of 3 characters
                                          /// requesting data for query
                                          searchBloc.add(RequestSearchEvent(SearchRequestEntity(value)));
                                        }

                                        /// turns off the results, asks for submission
                                        isVarsitySelected = false;
                                        isSubmitted = false;
                                        showResults = false;
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
                          ),
                        ),

                        /// if submitted without selecting any varsity, this warning will show up
                        if (!isVarsitySelected && isSubmitted)
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
                            color: AppConstants.textField_color,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  /// checks validation
                                  if (value.length < 4) {
                                    isUsernameSmall = true;
                                  } else {
                                    isUsernameSmall = false;
                                  }

                                  /// hides result
                                  showResults = false;
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

                        /// if submitted with a username length of less than 4, this warning will show up
                        if (isUsernameSmall)
                          Column(
                            children: [
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "•	Username must contain at least 4 characters",
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
                            color: AppConstants.textField_color,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Center(
                            child: TextField(
                              onChanged: (value) {
                                setState(() {
                                  //checks validation
                                  if (value.length < 6) {
                                    isPassword6char = false;
                                  } else {
                                    isPassword6char = true;
                                  }

                                  String _password = value.trim();
                                  if (pass_valid.hasMatch(_password)) {
                                    isPasswordstrong = true;
                                  } else {
                                    isPasswordstrong = false;
                                  }

                                  /// hides result
                                  showResults = false;
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
                                                /// password is showed upon clicking the button
                                                isPasswordObscure = !isPasswordObscure;
                                              },
                                            );
                                          },
                                          child: Text(
                                            "Show",
                                            style: TextStyle(
                                              color: AppConstants.primary_color_dark,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(
                                              () {
                                                /// password is hidden upon clicking the button
                                                isPasswordObscure = !isPasswordObscure;
                                              },
                                            );
                                          },
                                          child: Text(
                                            "Hide",
                                            style: TextStyle(
                                              color: AppConstants.primary_color_dark,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// if submitted with a weak password this warning will show up
                        if (!isPasswordstrong)
                          Column(
                            children: [
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "•	Password should contain at least a Capital letter, a small letter, a Number and a Special Character",
                                  style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        /// if submitted with a small password this warning will show up
                        if (!isPassword6char)
                          Column(
                            children: [
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "• Password length should be at least 6",
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
                                //onsubmission, focuses are removed from textfields
                                currentFocus.unfocus();
                              }

                              /// submit clicked, results will be shown if validation stands on password and username
                              isSubmitted = true;
                              showResults = true;

                              /// password validation recheck on submission
                              if (passwordController.text.length < 6) {
                                isPassword6char = false;
                              } else {
                                isPassword6char = true;
                              }
                              RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

                              String _password = passwordController.text.trim();
                              if (pass_valid.hasMatch(_password)) {
                                isPasswordstrong = true;
                              } else {
                                isPasswordstrong = false;
                              }

                              /// username validation recheck on submission
                              if (usernameController.text.length < 4) {
                                isUsernameSmall = true;
                              } else {
                                isUsernameSmall = false;
                              }
                            });
                          },
                          child: Container(
                            height: 60,
                            width: 220,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppConstants.primary_color,
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
                    //checking everything after submission
                    if (isVarsitySelected && showResults && (isPassword6char && isPasswordstrong && !isUsernameSmall))
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Text("Username: " + usernameController.text),
                          SizedBox(height: 20),
                          Text(
                            "University: " + selectedVarsity!.name!,
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

              /// the DropDownWidget call
              if (showDropDown)
                Positioned(
                  top: 204,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),

                    /// if varsity is not selected already, show dropdown results of search
                    child: (!isVarsitySelected && searchLength > 2)
                        ? Container(
                            constraints: BoxConstraints(
                              minHeight: 40,
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
                                  if (state.getSearchResultsEntity.results!.isNotEmpty) {
                                    ///if there are results on search, show the results
                                    return ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: state.getSearchResultsEntity.results!.length,
                                      itemBuilder: (context, index) {
                                        final singleResult = state.getSearchResultsEntity.results![index];

                                        return InkWell(
                                          onTap: () {
                                            if (!currentFocus.hasPrimaryFocus) {
                                              currentFocus.unfocus();
                                            }
                                            setState(() {
                                              /// upon university selection, close dropdown
                                              showDropDown = false;
                                              isVarsitySelected = true;

                                              /// save the selected varstiy
                                              selectedVarsity = singleResult;

                                              /// show the university name on textfield
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
                                  } else {
                                    /// for invalid searches, there is no result, show warning
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      constraints: BoxConstraints(
                                        minHeight: 40,
                                      ),
                                      width: size.width - 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text("Enter a valid University name"),
                                    );
                                  }
                                }

                                /// must return a widget in this builder
                                return Container();
                              },
                            ),
                          )

                        /// if search query is smaller than 3 characters and the varsity is already selected, show nothing
                        : isVarsitySelected
                            ? Container()
                            :

                            /// if the varsity is not selected yet, and search query is smaller than 3 characters
                            Container(
                                padding: EdgeInsets.all(10),
                                constraints: BoxConstraints(
                                  minHeight: 40,
                                ),
                                width: size.width - 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text("Enter at least 3 characters for suggestions"),
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
