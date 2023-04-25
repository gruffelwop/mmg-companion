// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:intl/intl.dart';

// import 'package:mmg_companion/services/app_service.dart';
// import 'package:mmg_companion/services/local_storage_service.dart';
// import 'package:mmg_companion/utilities/widgets/custom_generic_container_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_page_scaffold_widget_new.dart';
// import 'package:mmg_companion/utilities/widgets/custom_plan_appbar_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_margin_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_page_scaffold_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_refresh_indicator_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_scrollable_list_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_section_header_widget.dart';

// // TODO: Error Handeling in case of password being wrong (when the password changes for example)

// // TODO: Push Notifications
// // TODO: save the plan’s data to the local storage using multiple threads
// // TODO: Save the html files in dedicated local storage objects
// // TODO: app should automatically update on midnight (Dates & Vertretungen)
// // TODO: automatically update the plan views every 2 minutes or so when between 07:30 and 08:00
// // TODO: could add profiles, so you can quickly switch between your friends’ plan and yours.
// // TODO: Option to disable push notifications
// // TODO: (Swappable column views when swiped to the right. So you can swipe on a Column view and that replaces it with maybe the column view from the day after tomorrow. This would be saved.) [very difficult to do, because the SchoolDayAfterNextSchoolDay View is the only view I can work with, but it’s already frequently used. Give it a try nonetheless] [really??]
// // TODO: input fields should span over multiple lines

// class PlanViewNew extends StatefulWidget {
//   const PlanViewNew({super.key});

//   @override
//   State<PlanViewNew> createState() => _PlanViewNewState();
// }

// class _PlanViewNewState extends State<PlanViewNew> {
//   List<List<String>> _vertretungen0 = [];
//   List<List<String>> _vertretungen1 = [];
//   DateTime _date0 = DateTime(0);
//   DateTime _date1 = DateTime(0);
//   String _isOutdated0 = "";
//   String _isOutdated1 = "";

//   @override
//   void initState() {
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       systemNavigationBarColor:
//           Color(0xff343434), // This is the secondaryColor without transparency.
//     ));
//     if (LocalStorage.getIsRegistered() == true) {
//       _getPlanDateAndVertretungen();
//     }
//     super.initState();
//   }

//   void _getPlanDateAndVertretungen() {
//     late List<List<String>> vertretungen0;
//     late List<List<String>> vertretungen1;
//     late DateTime date0;
//     late DateTime date1;
//     late bool isOutdated0;
//     late bool isOutdated1;

//     DateTime now = DateTime.now();

//     DateTime today = DateTime(now.year, now.month, now.day);

//     DateTime planDateTodayOrLastSchoolDay;
//     DateTime planDateNextSchoolDay;
//     DateTime planDateSchoolDayAfterNextSchoolDay;

//     List<List<String>> planTodayOrLastSchoolDay;
//     List<List<String>> planNextSchoolDay;
//     List<List<String>> planSchoolDayAfterNextSchoolDay;

//     bool isOutdatedTodayOrLastSchoolDay;
//     bool isOutdatedNextSchoolDay;
//     bool isOutdatedSchoolDayAfterNextSchoolDay;

//     planDateTodayOrLastSchoolDay = LocalStorage.getDateTodayOrLastSchoolDay();
//     planDateNextSchoolDay = LocalStorage.getDateNextSchoolDay();
//     planDateSchoolDayAfterNextSchoolDay =
//         LocalStorage.getDateSchoolDayAfterNextSchoolDay();

//     planTodayOrLastSchoolDay =
//         LocalStorage.getIndividualPlanTodayOrLastSchoolDay();
//     planNextSchoolDay = LocalStorage.getIndividualPlanNextSchoolDay();
//     planSchoolDayAfterNextSchoolDay =
//         LocalStorage.getIndividualPlanSchoolDayAfterNextSchoolDay();

//     isOutdatedTodayOrLastSchoolDay =
//         LocalStorage.getIsOutdatedTodayOrLastSchoolDay();
//     isOutdatedNextSchoolDay = LocalStorage.getIsOutdatedNextSchoolDay();
//     isOutdatedSchoolDayAfterNextSchoolDay =
//         LocalStorage.getIsOutdatedSchoolDayAfterNextSchoolDay();

//     switch (today.weekday) {
//       case DateTime.saturday:
//         {
//           vertretungen0 = planNextSchoolDay;
//           date0 = planDateNextSchoolDay;
//           isOutdated0 = isOutdatedNextSchoolDay;
//           break;
//         }
//       case DateTime.sunday:
//         {
//           vertretungen0 = planNextSchoolDay;
//           date0 = planDateNextSchoolDay;
//           isOutdated0 = isOutdatedNextSchoolDay;
//           break;
//         }
//       default:
//         {
//           if (planDateNextSchoolDay == today) {
//             vertretungen0 = planNextSchoolDay;
//             date0 = planDateNextSchoolDay;
//             isOutdated0 = isOutdatedNextSchoolDay;
//           } else if (today != planDateTodayOrLastSchoolDay) {
//             vertretungen0 = planNextSchoolDay;
//             date0 = planDateNextSchoolDay;
//             isOutdated0 = isOutdatedNextSchoolDay;
//           } else {
//             vertretungen0 = planTodayOrLastSchoolDay;
//             date0 = planDateTodayOrLastSchoolDay;
//             isOutdated0 = isOutdatedTodayOrLastSchoolDay;
//           }
//           break;
//         }
//     }
//     switch (today.weekday) {
//       case DateTime.saturday:
//         {
//           vertretungen1 = planSchoolDayAfterNextSchoolDay;
//           date1 = planDateSchoolDayAfterNextSchoolDay;
//           isOutdated1 = isOutdatedSchoolDayAfterNextSchoolDay;
//           break;
//         }
//       case DateTime.sunday:
//         {
//           vertretungen1 = planSchoolDayAfterNextSchoolDay;
//           date1 = planDateSchoolDayAfterNextSchoolDay;
//           isOutdated1 = isOutdatedSchoolDayAfterNextSchoolDay;
//           break;
//         }
//       default:
//         {
//           if (planDateNextSchoolDay == today) {
//             vertretungen1 = planSchoolDayAfterNextSchoolDay;
//             date1 = planDateSchoolDayAfterNextSchoolDay;
//             isOutdated1 = isOutdatedSchoolDayAfterNextSchoolDay;
//           } else if (today != planDateTodayOrLastSchoolDay) {
//             vertretungen1 = planSchoolDayAfterNextSchoolDay;
//             date1 = planDateSchoolDayAfterNextSchoolDay;
//             isOutdated1 = isOutdatedSchoolDayAfterNextSchoolDay;
//           } else {
//             vertretungen1 = planNextSchoolDay;
//             date1 = planDateNextSchoolDay;
//             isOutdated1 = isOutdatedNextSchoolDay;
//           }
//           break;
//         }
//     }

//     if (mounted) {
//       setState(() {
//         _date0 = date0;
//         _date1 = date1;

//         _vertretungen0 = vertretungen0;
//         _vertretungen1 = vertretungen1;

//         _isOutdated0 = isOutdated0 == true ? "—outdated" : "";
//         _isOutdated1 = isOutdated1 == true ? "—outdated" : "";
//       });
//     }
//   }

//   Future<void> _updatePlanDateAndVertretungen() async {
//     await fillLocalStorage();
//     await Future.delayed(const Duration(seconds: 2));
//     _getPlanDateAndVertretungen();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomPageScaffoldNew(
//       child: Column(
//         children: [
//           const CustomPlanAppBar(),
//           const CustomMargin(amount: 40),
//           CustomScrollableList(
//             nonScrollableTitle: CustomSectionHeader(
//               name:
//                   "${DateFormat('EEEE').format(_date0)}, ${DateFormat('dd.MM').format(_date0)}$_isOutdated0"
//                       .toLowerCase(),
//             ),
//             scrollable: CustomRefreshIndicator(
//                 onRefresh: _updatePlanDateAndVertretungen,
//                 conditon: _vertretungen0.isNotEmpty,
//                 child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   padding: EdgeInsets.zero,
//                   shrinkWrap: true,
//                   itemCount: _vertretungen0.length,
//                   itemBuilder: (context, index) {
//                     List<String> list = _vertretungen0[index];
//                     String space = " ";
//                     return CustomTextContainer(
//                       content: list[0] +
//                           space +
//                           list[1] +
//                           space +
//                           list[2] +
//                           space +
//                           list[3] +
//                           space +
//                           list[4] +
//                           space +
//                           list[6],
//                     );
//                   },
//                 )),
//           ),
//           // const CustomMargin(amount: 20),
//           // CustomScrollableList(
//           //   nonScrollableTitle: CustomSectionHeader(
//           //     name:
//           //         "${DateFormat('EEEE').format(_date1)}, ${DateFormat('dd.MM').format(_date1)}$_isOutdated1"
//           //             .toLowerCase(),
//           //   ),
//           //   scrollable: CustomRefreshIndicator(
//           //       onRefresh: _updatePlanDateAndVertretungen,
//           //       conditon: _vertretungen1.isNotEmpty,
//           //       child: ListView.builder(
//           //         scrollDirection: Axis.vertical,
//           //         padding: EdgeInsets.zero,
//           //         shrinkWrap: true,
//           //         itemCount: _vertretungen1.length,
//           //         itemBuilder: (context, index) {
//           //           List<String> list = _vertretungen1[index];
//           //           String space = " ";
//           //           return CustomTextContainer(
//           //             content: list[0] +
//           //                 space +
//           //                 list[1] +
//           //                 space +
//           //                 list[2] +
//           //                 space +
//           //                 list[3] +
//           //                 space +
//           //                 list[4] +
//           //                 space +
//           //                 list[6],
//           //           );
//           //         },
//           //       )),
//           // ),
//           // const CustomMargin(amount: 20),
//         ],
//       ),
//     );
//   }
// }
