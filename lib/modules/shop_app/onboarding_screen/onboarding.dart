import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mk/shared/components/components.dart';
import 'package:mk/shared/network/local/cache_helper.dart';
import 'package:mk/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shop_app_login/shop_app_login.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatelessWidget {
  var controller = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboarding1.png',
      body: 'screen body 1',
      title: 'screen title 1',
    ),
    BoardingModel(
      image: 'assets/images/Complete-Fast-checkouts.png',
      body: 'screen body 2',
      title: 'screen title 2',
    ),
    BoardingModel(
      image: 'assets/images/onboarding2.jpg',
      body: 'screen body 3',
      title: 'screen title 3',
    ),
  ];
  void submit(context) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      print(value);
      if (value!) {
        navigateEnd(context, ShopLoginScreen());
      }
    });
  }

  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
              function: () {
                submit(context);
              },
              text: 'skip')
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  boarding.length - 1 == index ? isLast = true : isLast = false;
                },
                physics: BouncingScrollPhysics(),
                controller: controller,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5,
                    expansionFactor: 4,
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit(context);
                    } else {
                      controller.nextPage(
                          duration: Duration(milliseconds: 700),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          SizedBox(
            height: 40.0,
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40.0,
          ),
        ],
      );
}
