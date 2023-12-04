import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class WalkthroughForm extends StatelessWidget {
  final String image;
  final String text;
  final String mainText;

  const WalkthroughForm(
      {required this.image, required this.text, required this.mainText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: WalkthroughGraphicWidget(imagePath: image),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WalkthroughTextWidget(
                titleText: text,
                mainText: mainText,
              ),
              SizedBox(height: 50),
              WalkthroughButton(() {

                AutoRouter.of(context).pushNamed('check_auth_screen');
              }),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> pages = [
  {
    'image': ImagePaths.walkthroughImage,
    'text': 'Connect easily with your family and friends over countries',
    'mainText': 'Terms & Privacy Policy'
  },
];

class WalkthroughFormScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return WalkthroughForm(
          image: pages[index]['image'],
          text: pages[index]['text'],
          mainText: pages[index]['mainText'],
        );
      },
    );
  }
}

class WalkthroughScreen extends StatelessWidget {
  const WalkthroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WalkthroughFormScreenView();
  }
}
