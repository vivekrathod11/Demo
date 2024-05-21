

import 'package:flutter/material.dart';
import 'package:nike/controllers/apiController.dart';
import 'package:nike/utils/appColors.dart';
import 'package:nike/utils/appFonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Obx(() =>
       SizedBox(
        width: double.infinity,
        height: 480.0,
        child: apiController.data.value.length != null ?
        PageView.builder(
          controller: pageController,
          itemCount: apiController.data.value.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var items = apiController.data.value[index];
            var images = items['image'];
            return SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Stack(
                     alignment: Alignment.center,
                     children: [
                       Center(
                         child: Padding(
                           padding: const EdgeInsetsDirectional.only(bottom: 40.0),
                           child: ClipRRect(
                             borderRadius: BorderRadius.circular(8.0),
                             child: SizedBox(
                               height: 300,
                               width: 300,
                               child: CachedNetworkImage(
                                 imageUrl: images.toString(),
                                 height: 300,
                                 width: 300,
                                 fit: BoxFit.cover,
                                 errorWidget: (context, url,
                                     error) => const Icon(Icons.error),
                               ),
                             ),
                           ),
                         ),
                       ),
                       Image.asset("assets/dot.png"),
                     ],
                   ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        items['name'] ?? 'Start Journey With Nike',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          height: 1,
                          fontFamily: AppFonts.secFont,
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                   const Text(
                      "Smart, Gorgeous & Fashionable Collection",
                      textAlign: TextAlign.left,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: AppFonts.secFont,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ) :
        const Center(
              child: Text(
                "Please change the api key in the constanst class"
              ),
            )
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
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            currentPage == 2 ? 'Get Started' : 'Next',
            style: const TextStyle(
              fontFamily: AppFonts.secFont,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
