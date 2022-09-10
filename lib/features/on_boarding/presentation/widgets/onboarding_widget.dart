import 'package:algoriza_weather/config/const/strings.dart';
import 'package:algoriza_weather/features/home/presentation/pages/home_page.dart';
import 'package:algoriza_weather/features/on_boarding/presentation/widgets/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingWidget extends StatefulWidget {
  const OnBoardingWidget({Key? key}) : super(key: key);

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

int initialPage = 0;

final controller = PageController(
  initialPage: initialPage,
);

bool firstPage = true;
bool secondPage = false;

_onPageViewChange(int page) {
  if (page == 0) {
    firstPage = true;
    secondPage = false;
  } else {
    firstPage = false;
    secondPage = true;
  }
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Wrap(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 300,
                          maxWidth: MediaQuery.of(context).size.width),
                      child: PageView(
                        controller: controller,
                        onPageChanged: (int page) {
                          setState(() {
                            _onPageViewChange(page);
                            initialPage = page;
                          });
                        },
                        children: [
                          OnBoarding(headerText: headerTextBoarding1, subText: subTextBoarding1, img: imgBoarding1),
                          OnBoarding(headerText: headerTextBoarding2, subText: subTextBoarding2, img: imgBoarding2),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 90),
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            final showOnBoarding = await SharedPreferences.getInstance();
                            showOnBoarding.setBool('showHome', true);
                            setState(() {
                              if (initialPage == 0) {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                                initialPage = 1;
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => const HomePage(),
                                  ),
                                );
                              }
                            });
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: firstPage ? Colors.black : Colors.black12,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: secondPage ? Colors.black : Colors.black12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
