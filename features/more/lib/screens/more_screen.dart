import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool isSearching = false;
  TextEditingController searchUserNameController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'More Screen',
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: AppDimens.size_10),
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
                        padding: EdgeInsets.only(right: AppDimens.size_10),
                        child: Icon(Icons.arrow_back)),
                  )
                      : Container(),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: AppDimens.size_10),
                      padding: EdgeInsets.symmetric(horizontal: AppDimens.size_10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.grey,
                          width: AppDimens.size_1,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(AppDimens.size_10),
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
