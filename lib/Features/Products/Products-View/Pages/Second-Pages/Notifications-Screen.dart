import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Strings/Strings.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Widgets/Notification-Widgets/Notification-App-Bar.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Widgets/Notification-Widgets/Notifications-Widgets.dart';
import 'package:flutter/material.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  @override
  Widget build(BuildContext context) {
    double tabWidth = MediaQuery.of(context).size.width / 3.23;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Notification",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
              Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            NotificationTabBar(tabWidth: tabWidth,),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                "Today",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const NotificationList(
                Buttom: false,
                Subtitle: TodayNotificationMessageSubTitle_1,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_1,
                Width: 140,
                Icons: "assets/Icon_SVG/discount.svg"),
            const NotificationList(
                Buttom: true,
                Subtitle: TodayNotificationMessageSubTitle_2,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_2,
                Width: 140,
                Icons: "assets/Icon_SVG/cart_outLine.svg"),
            const NotificationList(
                Buttom: false,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 100,
                Icons: "assets/Icon_SVG/truck.svg"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "View All",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 17,
                    color: Primary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                "1 Week Ago",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const NotificationList(
                Buttom: true,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 180,
                Icons: "assets/Icon_SVG/truck.svg"),
            const NotificationList(
                Buttom: false,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 100,
                Icons: "assets/Icon_SVG/truck.svg"),
            const NotificationList(
                Buttom: true,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 140,
                Icons: "assets/Icon_SVG/truck.svg"),
            const NotificationList(
                Buttom: false,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 100,
                Icons: "assets/Icon_SVG/truck.svg"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "View All",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 17,
                    color: Primary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                "1 Month Ago",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const NotificationList(
                Buttom: true,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 140,
                Icons: "assets/Icon_SVG/truck.svg"),
            const NotificationList(
                Buttom: false,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 100,
                Icons: "assets/Icon_SVG/truck.svg"),
            const NotificationList(
                Buttom: true,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 140,
                Icons: "assets/Icon_SVG/truck.svg"),
            const NotificationList(
                Buttom: false,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 100,
                Icons: "assets/Icon_SVG/truck.svg"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "View All",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 17,
                    color: Primary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                "1 Year Ago",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const NotificationList(
                Buttom: true,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 140,
                Icons: "assets/Icon_SVG/truck.svg"),
            const NotificationList(
                Buttom: false,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 100,
                Icons: "assets/Icon_SVG/truck.svg"),
            const NotificationList(
                Buttom: true,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 140,
                Icons: "assets/Icon_SVG/truck.svg"),
            const NotificationList(
                Buttom: false,
                Subtitle: TodayNotificationMessageSubTitle_3,
                Timeago: TodayNotificationMessageAgo,
                Title: TodayNotificationMessageTitle_3,
                Width: 100,
                Icons: "assets/Icon_SVG/truck.svg"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "View All",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 17,
                    color: Primary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}



/*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Container(
                width: double.infinity,
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            NotificationTypeSelect = 1;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: NotificationTypeSelect == 1
                                ? Primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "All",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: 18,
                                    color: NotificationTypeSelect == 1
                                        ? Colors.white
                                        : Colors.grey.shade500,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            NotificationTypeSelect = 2;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: NotificationTypeSelect == 2
                                ? Primary
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              "Read",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: 18,
                                    color: NotificationTypeSelect == 2
                                        ? Colors.white
                                        : Colors.grey.shade500,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            NotificationTypeSelect = 3;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            color: NotificationTypeSelect == 3
                                ? Primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Unread",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: 18,
                                    color: NotificationTypeSelect == 3
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade200,
                ),
              ),
            ),*/