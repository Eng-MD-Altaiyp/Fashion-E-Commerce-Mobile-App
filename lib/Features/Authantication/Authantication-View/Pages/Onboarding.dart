import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Authantication/Authantication-Controller/Onboarding-Get-Height-Images.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Authantication/Authantication-Models/content_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';



class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  ImagesHeight Data = ImagesHeight();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: ScreenHeight,
        child: LayoutBuilder(builder: (context, sizes) {
          double w1 = sizes.maxWidth;
          double h1 = sizes.maxHeight;
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(
                width: w1,
                height: h1 / 1.4,
                // color: Colors.red,
                child: PageView.builder(
                  // reverse: true,
                  controller: _controller,
                  itemCount: contents.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    currentIndex = i;
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, right: 15, left: 15),
                      child: SizedBox(
                        width: double.infinity,
                        height: ScreenHeight! / 2.5,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 9,
                              child: Stack(
                                children: [
                                  MasonryGridView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    itemBuilder: (context, index) {
                                      double randomHeight = Data.HeoghtImage(index);
                                      return Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 15, left: 15, right: 15),
                                        height: randomHeight,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  contents[i].image),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      );
                                    },
                                    itemCount: 5,
                                  ),
                                  Positioned(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          stops: const [0.7,1],
                                          colors: [Colors.white.withOpacity(0.1),White.withOpacity(0.8),],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                contents[i].title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                contents[i].discription,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: w1,
                height: h1 / 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                    (index) => buildDot(index, context),
                  ),
                ),
              ),
              SizedBox(
                width: w1,
                height: h1 / 7,
                child: GestureDetector(
                  onTap: () {
                    if (currentIndex == contents.length - 1) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/login_screen',
                        (route) => false,
                      );
                    }
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/login_screen',
                              (route) => false,
                            );
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 2,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              currentIndex == contents.length - 1
                                  ? "LOGIN"
                                  : "Next",
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          );
        }),
      ),
      extendBody: true,
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ?Primary:Grey200,
      ),
    );
  }
}
