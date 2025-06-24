import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Carts/Carts-View/Pages/Main-Pages/cart_screen.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Models/Get-Data-Cart.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Pages/Main-Pages/Home-Products.dart';
import 'package:fashion_e_commerce_mobile_app/Features/User-Profile/User-Profile-View/Pages/Main-Pages/Main-Profile-Page.dart';
import 'package:fashion_e_commerce_mobile_app/Features/WishList/WishList-View/Pages/WishList_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';



class main_navigation extends StatefulWidget {
  const main_navigation({super.key});

  @override
  State<main_navigation> createState() => MainNavigationState();
}

class MainNavigationState extends State<main_navigation> {
  ValueNotifier<bool> home = ValueNotifier(false);
  ValueNotifier<bool> list = ValueNotifier(false);
  ValueNotifier<bool> timer = ValueNotifier(false);
  ValueNotifier<bool> user = ValueNotifier(false);

  ValueNotifier<int> IndexPage = ValueNotifier(3);
  ValueNotifier<String> navegitor = ValueNotifier("home");

  List<Builder> pages = [
    Builder(builder: (context) {
      return const ProfileScreen();
    }),
    Builder(builder: (context) {
      return const cart_screen();
    }),
    Builder(builder: (context) {
      return const Wishlist();
    }),
    Builder(builder: (context) {
      return const Homepage();
    }),
  ];

  // int Counter_Notifications = 3;
  DateTime timeBack = DateTime.now();
  Get_Cart_Products Data = Get_Cart_Products();

// This widget is the root of your application.
  @override
  void initState() {
    super.initState();
  }

  // CartCounter Cart_Counters = CartCounter();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBack);
        final isExitWarning = difference >= const Duration(seconds: 2);
        timeBack = DateTime.now();
        if (isExitWarning) {
          const message = "          Press again to exit          ";
          Fluttertoast.showToast(
            msg: message,
            fontSize: 18,
            backgroundColor: Primary,
          );
          return false;
        } else {
          Fluttertoast.cancel();
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2,
                      bottom: 2,
                      left: 13,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/NotificationsScreen',
                        );
                      },
                      child: SizedBox(
                        width: 45,
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            'assets/Icon_SVG/notification.svg',
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 6,
                    child: Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.4,
                            color: Colors.white,
                          )),
                      child: Center(
                        child: Text(
                          '3',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning!",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Mohammed",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: IndexPage,
          builder: (context, value, child) {
            return pages[IndexPage.value];
          },
        ),
        extendBody: true,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 70,
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if (IndexPage.value == 3) {
                            home.value = false;
                          } else {
                            home.value = true;
                          }
                          // BlocProvider.of<ProductBloc>(context).add(
                          //   ChangeCategories(
                          //     onSelect: "All",
                          //     selectStore: "SELECT * FROM products",
                          //   ),
                          // );
                          navegitor.value = 'home';
                          IndexPage.value = 3;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 1, bottom: 5),
                          child: ValueListenableBuilder(
                            valueListenable: navegitor,
                            builder: (context, value, child) {
                              return SvgPicture.asset(
                                navegitor.value == 'home'
                                    ? 'assets/Icon_SVG/Home.svg'
                                    : 'assets/Icon_SVG/Home-2.svg',
                                color: navegitor.value == 'home'
                                    ? Primary
                                    : Colors.grey,
                                width: 40,
                                // color: navegitor != 'home' ? primary100 : accent100,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if (IndexPage.value == 2) {
                            list.value = false;
                          } else {
                            list.value = true;
                          }

                          // BlocProvider.of<ProductBloc>(context).add(
                          //   ChangeCategories(
                          //     onSelect: "All",
                          //     selectStore: """SELECT * FROM products WHERE "products_favorite" = 1""",
                          //   ),
                          // );

                          // هذا المتغير يقوم التحكم بلون ايقونة الصفحة المفتوحة
                          navegitor.value = 'list';
                          // ينقل للصفحة رقم 1 في المصفوفة صفحة الاشعارات
                          IndexPage.value = 2;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 1, bottom: 5),
                          child: ValueListenableBuilder(
                              valueListenable: navegitor,
                              builder: (context, value, child) {
                                return SvgPicture.asset(
                                  navegitor.value == 'list'
                                      ? 'assets/Icon_SVG/Favo.svg'
                                      : 'assets/Icon_SVG/Favorite-2.svg',
                                  color: navegitor.value == 'list'
                                      ? Primary
                                      : Colors.grey,
                                  width: 40,
                                  // color: navegitor != 'list' ? primary100 : accent100,
                                );
                              }),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if (IndexPage.value == 1) {
                            timer.value = false;
                          } else {
                            timer.value = true;
                          }
                          // هذا المتغير يقوم التحكم بلون ايقونة الصفحة المفتوحة
                          navegitor.value = 'timer';
                          // ينقل للصفحة رقم 1 في المصفوفة صفحة الاشعارات
                          IndexPage.value = 1;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 35, right: 20, top: 0, bottom: 5),
                          child: ValueListenableBuilder(
                              valueListenable: navegitor,
                              builder: (context, value, child) {
                                return Stack(
                                  children: [
                                    SvgPicture.asset(
                                      navegitor.value == 'timer'
                                          ? 'assets/Icon_SVG/Cart.svg'
                                          : 'assets/Icon_SVG/buttom-nav-bar-icon-3.svg',
                                      // color: navegitor != 'timer' ? primary100 : accent100,
                                      // width: 30,
                                      // height: 30,
                                    ),
                                    Positioned(
                                        right: 5,
                                        top: 4,
                                        child: ValueListenableBuilder(
                                          valueListenable: CountersForCart,
                                          builder: (context, value, child) {
                                            return
                                              CountersForCart.value >= 1
                                                  ? Container(
                                                width: 17,
                                                height: 17,
                                                decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10),
                                                    border: Border.all(
                                                      width: 1.4,
                                                      color: Colors.white,
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    '${CountersForCart.value}',
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .bodySmall
                                                        ?.copyWith(
                                                        color:
                                                        Colors.white),
                                                  ),
                                                ),
                                              )
                                                  : const SizedBox();
                                          },)
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if (IndexPage.value == 0) {
                            user.value = false;
                          } else {
                            user.value = true;
                          }
                          navegitor.value = 'user';
                          IndexPage.value = 0;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 1, bottom: 5),
                          child: ValueListenableBuilder(
                              valueListenable: navegitor,
                              builder: (context, value, child) {
                                return Center(
                                  child: InkWell(
                                    onTap: () {
                                      if (IndexPage.value == 0) {
                                        user.value = false;
                                      } else {
                                        user.value = true;
                                      }

                                      // هذا المتغير يقوم التحكم بلون ايقونة الصفحة المفتوحة
                                      navegitor.value = 'user';
                                      // ينقل للصفحة رقم 1 في المصفوفة صفحة الاشعارات
                                      IndexPage.value = 0;
                                    },
                                    child: SvgPicture.asset(
                                      navegitor.value == 'user'
                                          ? 'assets/Icon_SVG/User.svg'
                                          : 'assets/Icon_SVG/User-2.svg',
                                      // color: navegitor != 'user' ? primary100 : accent100,
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: 4,
                            width: 20,
                            child: Text(
                              "Home",
                              style: TextStyle(
                                  color: navegitor.value == 'home'
                                      ? Primary
                                      : Colors.grey,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: 4,
                            width: 20,
                            child: Text(
                              "data",
                              style: TextStyle(
                                color: navegitor.value == 'list'
                                    ? Primary
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: 4,
                            width: 20,
                            child: Text(
                              "data",
                              style: TextStyle(
                                color: navegitor.value == 'timer'
                                    ? Primary
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: 4,
                            width: 20,
                            child: Text(
                              "data",
                              style: TextStyle(
                                color: navegitor.value == 'user'
                                    ? Primary
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
