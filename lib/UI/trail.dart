import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/controllers/apiController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';


class Trail extends StatefulWidget {
  const Trail({super.key});

  @override
  State<Trail> createState() => _TrailState();
}

class _TrailState extends State<Trail> {
  ApiController apiController = Get.put(ApiController());
  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: true,
        right: true,
        bottom: true,
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            pageViewWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 4.0,
                      spacing: 8.0,
                      radius: 100.0,
                      dotWidth: 8.0,
                      dotHeight: 5.0,
                      dotColor: Colors.grey,
                      activeDotColor: Color(0xff5B9EE1),
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                  customButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pageViewWidget() {
    return SizedBox(
      width: double.infinity,
      height: 502.0,
      child: PageView.builder(
        controller: pageController,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Stack(
                   children: [
                     Center(
                       child: Padding(
                         padding: const EdgeInsetsDirectional.only(bottom: 40.0),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(8.0),
                           child: Container(
                             decoration: const BoxDecoration(),
                             height: 300,
                             width: 300,
                             child: Image.network(
                               "https://i.pinimg.com/564x/6a/b8/f7/6ab8f71806bd568e4d229658e7e979f6.jpg",
                               height: 300,
                               width: 300,
                               fit: BoxFit.cover,
                             ),
                           ),
                         ),
                       ),
                     ),
                     Image.asset("assets/dot.png"),
                     Opacity(
                       opacity: 0.3,
                       child: Image.asset(
                           "assets/nike.png",
                         colorBlendMode: BlendMode.clear,
                       ),
                     ),
                   ],
                 ),
                 const SizedBox(
                    width: 250,
                    child: Text(
                       'Start Journey With Nike',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 1,
                        fontFamily: 'Airbnb Cereal App',
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Text(
                    "Smart, Gorgeous & Fashionable Collection",
                    textAlign: TextAlign.left,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Airbnb Cereal App',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget customButton() {
    return GestureDetector(
      onTap: () {
        if (currentPage < 2) {
          pageController.animateToPage(
              currentPage + 1,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease);
        } else {}
      },
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xff5B9EE1),
        ),
        child: Center(
          child: Text(
            currentPage == 2 ? 'Get Started' : 'Next',
            style: const TextStyle(
              fontFamily: 'Airbnb Cereal App',
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
