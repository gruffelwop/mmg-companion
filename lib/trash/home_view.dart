// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mmg_companion/services/local_storage_service.dart';
// import 'package:mmg_companion/views/plan_view.dart';
// import 'package:mmg_companion/views/plan_view_new.dart';
// import 'package:mmg_companion/views/settings_view.dart';
// import 'package:mmg_companion/views/statistics_view.dart';

// // TODO: Bottom NavBar()

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   PageController pageController =
//       PageController(initialPage: LocalStorage.getStartPageIndex()!);
//   // @override
//   // void initState() {
//   //   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//   //     statusBarColor: Colors.transparent,
//   //     systemNavigationBarColor: Color(0xff1b1b1b),
//   //   ));

//   //   super.initState();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: pageController,
//       onPageChanged: (index) {
//         if (mounted) {
//           FocusScope.of(context).unfocus();
//         }
//       },
//       children: const [
//         StatisticsView(),
//         PlanView(),
//         // PlanViewNew(),
//         SettingsView(),
//       ],
//     );
//   }
// }
