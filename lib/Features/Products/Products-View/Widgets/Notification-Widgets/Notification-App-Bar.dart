import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:flutter/material.dart';


class NotificationTabBar extends StatefulWidget {
  final double tabWidth;
  const NotificationTabBar({super.key,required this.tabWidth});

  @override
  State<NotificationTabBar> createState() => _NotificationTabBarState();
}

class _NotificationTabBarState extends State<NotificationTabBar> {

  ValueNotifier<int> selectedTab = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.shade200,
        ),
        child: ValueListenableBuilder(valueListenable: selectedTab, builder: (context, value, child) {
          return
            Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: (selectedTab.value - 1) * widget.tabWidth,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: widget.tabWidth,
                    decoration: BoxDecoration(
                      color: Primary,
                      borderRadius: selectedTab.value == 1
                          ? const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      )
                          : selectedTab.value == 2
                          ? BorderRadius.circular(0)
                          : const BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                // Row containing the tab buttons
                Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            selectedTab.value = 1;
                          },
                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "All",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                  fontSize: 18,
                                  color: selectedTab.value == 1
                                      ? Colors.white
                                      : Colors.grey.shade500,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Tab 2: Read
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            selectedTab.value = 2;
                          },
                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "Read",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                  fontSize: 18,
                                  color: selectedTab.value == 2
                                      ? Colors.white
                                      : Colors.grey.shade500,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Tab 3: Unread
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            selectedTab.value = 3;
                          },
                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "Unread",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                  fontSize: 18,
                                  color: selectedTab.value == 3
                                      ? Colors.white
                                      : Colors.grey.shade500,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
        },),
      ),
    );
  }
}
