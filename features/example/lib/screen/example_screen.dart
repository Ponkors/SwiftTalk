import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  bool isSearching = false;
  TextEditingController searchUserNameController =
    TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExampleScreen',
      home: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: AppDimens.size10),
          child: Column(
            children: [
              Row(
                children: [
                  isSearching
                      ? GestureDetector(
                          onTap: () {
                            isSearching = false;
                            searchUserNameController.text = "";
                            setState(() {});
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: AppDimens.size10),
                            child: Icon(Icons.arrow_back)),
                      )
                      : Container(),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: AppDimens.size10),
                      padding: EdgeInsets.symmetric(horizontal: AppDimens.size10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.grey,
                          width: AppDimens.size1,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(AppDimens.size10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                                controller: searchUserNameController,
                                decoration: InputDecoration(border: InputBorder.none,
                                  hintText: 'Enter username'),
                          )),
                          GestureDetector(
                            onTap: () {
                              if (searchUserNameController.text != "") {
                                isSearching = true;
                                setState(() {

                                });
                              }
                            },
                            child: Icon(Icons.search),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
