import 'package:flutter/material.dart';

import 'package:mmg_companion/constants/app_constant.dart';
import 'package:mmg_companion/constants/colors.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/views/plan_view.dart';
import 'package:mmg_companion/views/settings_view.dart';
import 'package:mmg_companion/views/statistics_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? currentPageIndex;

  List<Widget> body = const [
    StatisticsView(),
    PlanView(),
    SettingsView(),
  ];

  @override
  void initState() {
    currentPageIndex = siteStringMappedToSiteIndex[LocalStorage.getStartPage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
        child: body[currentPageIndex!],
        // IndexedStack(
        //   index: currentPageIndex,
        //   children: body,
        // ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff343434), // Isn't actually quite the right color.
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentPageIndex = 0;
                });
              },
              icon: Icon(
                Icons.add_chart_rounded,
                color: currentPageIndex == 0 ? Colors.amber : primaryColor,
                size: 32,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPageIndex = 1;
                });
              },
              icon: Icon(
                Icons.wysiwyg_rounded,
                color: currentPageIndex == 1 ? Colors.amber : primaryColor,
                size: 32,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentPageIndex = 2;
                });
              },
              icon: Icon(
                Icons.settings_suggest_rounded,
                color: currentPageIndex == 2 ? Colors.amber : primaryColor,
                size: 32,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     resizeToAvoidBottomInset: true,
  //     backgroundColor: backgroundColor,
  //     body: Padding(
  //       padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
  //       child: body[currentPageIndex!],
  //     ),
  //     bottomNavigationBar: SizedBox(
  //       height: 60,
  //       width: double.infinity,
  //       child: ClipRRect(
  //         borderRadius: const BorderRadius.vertical(
  //           top: Radius.circular(10 * 2),
  //         ),
  //         child: BottomNavigationBar(
  //           type: BottomNavigationBarType.fixed,
  //           backgroundColor: fakePrimaryColor,
  //           elevation: 0,
  //           unselectedIconTheme: IconThemeData(color: primaryColor, size: 32),
  //           selectedIconTheme:
  //               const IconThemeData(color: Colors.amber, size: 32),
  //           selectedItemColor: Colors.amber,
  //           selectedLabelStyle: const TextStyle(height: 0, fontSize: 0),
  //           unselectedLabelStyle: const TextStyle(height: 0, fontSize: 0),
  //           showSelectedLabels: false,
  //           showUnselectedLabels: false,
  //           currentIndex: currentPageIndex!,
  //           onTap: (int newIndex) {
  //             setState(() {
  //               currentPageIndex = newIndex;
  //             });
  //           },
  //           items: const [
  //             BottomNavigationBarItem(
  //               label: "statistics",
  //               icon: Icon(Icons.add_chart_rounded),
  //             ),
  //             BottomNavigationBarItem(
  //               label: "plan",
  //               icon: Icon(Icons.wysiwyg_rounded),
  //             ),
  //             BottomNavigationBarItem(
  //               label: "settings",
  //               icon: Icon(Icons.settings_suggest_rounded),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     resizeToAvoidBottomInset: true,
  //     backgroundColor: backgroundColor,
  //     body: Padding(
  //       padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
  //       child: body[currentPageIndex!],
  //     ),
  //     bottomNavigationBar: SizedBox(
  //       height: 60,
  //       width: double.infinity,
  //       child: ClipRRect(
  //         borderRadius: const BorderRadius.vertical(
  //           top: Radius.circular(10 * 2),
  //         ),
  //         child: BottomAppBar(
  //           type: BottomNavigationBarType.fixed,
  //           backgroundColor: fakePrimaryColor,
  //           elevation: 0,
  //           unselectedIconTheme: IconThemeData(color: primaryColor, size: 32),
  //           selectedIconTheme:
  //               const IconThemeData(color: Colors.amber, size: 32),
  //           selectedItemColor: Colors.amber,
  //           selectedLabelStyle: const TextStyle(height: 0, fontSize: 0),
  //           unselectedLabelStyle: const TextStyle(height: 0, fontSize: 0),
  //           showSelectedLabels: false,
  //           showUnselectedLabels: false,
  //           currentIndex: currentPageIndex!,
  //           onTap: (int newIndex) {
  //             setState(() {
  //               currentPageIndex = newIndex;
  //             });
  //           },
  //           items: const [
  //             BottomNavigationBarItem(
  //               label: "statistics",
  //               icon: Icon(Icons.add_chart_rounded),
  //             ),
  //             BottomNavigationBarItem(
  //               label: "plan",
  //               icon: Icon(Icons.wysiwyg_rounded),
  //             ),
  //             BottomNavigationBarItem(
  //               label: "settings",
  //               icon: Icon(Icons.settings_suggest_rounded),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
