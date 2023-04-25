// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mmg_companion/constants/app_constant.dart';
// import 'package:mmg_companion/constants/colors.dart';
// import 'package:mmg_companion/services/local_storage_service.dart';
// import 'package:mmg_companion/utilities/widgets/custom_page_scaffold_widget_new.dart';
// import 'package:mmg_companion/views/plan_view.dart';
// import 'package:mmg_companion/views/settings_view.dart';
// import 'package:mmg_companion/views/statistics_view.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   String? startPage;
//   int? currentPageIndex;
//   PageController pageController =
//       PageController(initialPage: LocalStorage.getStartPageIndex()!);
//   @override
//   void initState() {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       systemNavigationBarColor: Color(0xff1b1b1b),
//     ));
//     startPage = LocalStorage.getStartPage();
//     currentPageIndex = siteStringMappedToSiteIndex[startPage];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffoldWithBottomAppBar(
//       bottomNavBar: Container(
//         height: 60,
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           color: Color(0xff343434), // Isn't actually quite the right color.
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(10 * 2),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             IconButton(
//               onPressed: () {
//                 pageController.jumpToPage(0);
//               },
//               icon: Icon(
//                 Icons.add_chart_rounded,
//                 // LocalStorage.getIsTeacher() == false
//                 //     ? Icons.add_chart_rounded
//                 //     : Icons.sticky_note_2_rounded,
//                 color: currentPageIndex == 0 ? Colors.amber : primaryColor,
//                 size: 32,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 pageController.jumpToPage(1);
//               },
//               icon: Icon(
//                 Icons.wysiwyg_rounded,
//                 color: currentPageIndex == 1 ? Colors.amber : primaryColor,
//                 size: 32,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 pageController.jumpToPage(2);
//               },
//               icon: Icon(
//                 Icons.settings_suggest_rounded,
//                 color: currentPageIndex == 2 ? Colors.amber : primaryColor,
//                 size: 32,
//               ),
//             ),
//           ],
//         ),
//       ),
//       child: PageView(
//         physics: const NeverScrollableScrollPhysics(),
//         controller: pageController,
//         onPageChanged: (index) {
//           if (mounted) {
//             FocusScope.of(context).unfocus();
//           }
//           if (mounted) {
//             setState(() {
//               currentPageIndex = index;
//             });
//           }
//         },
//         children: const [
//           StatisticsView(),
//           // LocalStorage.getIsTeacher() == false
//           //     ? const StatisticsView()
//           //     : const AbsencesView(),
//           PlanView(),
//           SettingsView(),
//         ],
//       ),
//     );
//   }
// }
