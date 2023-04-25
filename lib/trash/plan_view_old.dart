// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:intl/intl.dart';

// import 'package:mmg_companion/constants/colors.dart';
// import 'package:mmg_companion/services/app_service.dart';
// import 'package:mmg_companion/services/local_storage_service.dart';
// import 'package:mmg_companion/utilities/widgets/custom_plan_appbar_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_margin_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_page_scaffold_widget.dart';
// import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

// class PlanView extends StatefulWidget {
//   const PlanView({super.key});

//   @override
//   State<PlanView> createState() => _PlanViewState();
// }

// class _PlanViewState extends State<PlanView> {
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
//       systemNavigationBarColor: Color(0xff1b1b1b),
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
//     // else {
//     //   print("unmounted");
//     // }
//   }

//   Future<void> _updatePlanDateAndVertretungen() async {
//     await fillLocalStorage();
//     await Future.delayed(const Duration(seconds: 2));
//     _getPlanDateAndVertretungen();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomPageScaffold(
//       child: Column(
//         children: [
//           const CustomPlanAppBar(),
//           const CustomMargin(amount: 40),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _date0 == DateTime(0)
//                         ? Container()
//                         : CustomBodyText(
//                             content:
//                                 "${DateFormat('EEEE').format(_date0)}, ${DateFormat('dd.MM').format(_date0)}$_isOutdated0"
//                                     .toLowerCase(),
//                           ),
//                   ],
//                 ),
//                 const CustomMargin(amount: 10),
//                 Expanded(
//                   child: RefreshIndicator(
//                     onRefresh: _updatePlanDateAndVertretungen,
//                     color: primaryColor,
//                     backgroundColor: backgroundColor,
//                     child: _vertretungen0.isNotEmpty
//                         ? ListView.builder(
//                             scrollDirection: Axis.vertical,
//                             padding: EdgeInsets.zero,
//                             shrinkWrap: true,
//                             itemCount: _vertretungen0.length,
//                             itemBuilder: (context, index) {
//                               List<String> list = _vertretungen0[index];
//                               String space = " ";
//                               return Container(
//                                 width: double.infinity,
//                                 height: 60,
//                                 margin: const EdgeInsets.only(bottom: 10.0),
//                                 decoration: const BoxDecoration(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10)),
//                                   color: Color(0x1affffff),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text(
//                                       list[0] +
//                                           space +
//                                           list[1] +
//                                           space +
//                                           list[2] +
//                                           space +
//                                           list[3] +
//                                           space +
//                                           list[4] +
//                                           // list[5] +
//                                           space +
//                                           list[6],
//                                       style: const TextStyle(
//                                         color: Color(0x80ffffff),
//                                         fontSize: 16,
//                                         height: 1,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           )
//                         : ListView(
//                             children: const [
//                               // I could show a GIF here that changes on every reload.
//                             ],
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const CustomMargin(amount: 40),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _date1 == DateTime(0)
//                         ? Container()
//                         : CustomBodyText(
//                             content:
//                                 "${DateFormat('EEEE').format(_date1)}, ${DateFormat('dd.MM').format(_date1)}$_isOutdated1"
//                                     .toLowerCase(),
//                           ),
//                   ],
//                 ),
//                 const CustomMargin(amount: 10),
//                 Expanded(
//                   child: RefreshIndicator(
//                     onRefresh: _updatePlanDateAndVertretungen,
//                     color: primaryColor,
//                     backgroundColor: backgroundColor,
//                     child: _vertretungen1.isNotEmpty
//                         ? ListView.builder(
//                             scrollDirection: Axis.vertical,
//                             padding: EdgeInsets.zero,
//                             shrinkWrap: true,
//                             itemCount: _vertretungen1.length,
//                             itemBuilder: (context, index) {
//                               List<String> list = _vertretungen1[index];
//                               String space = " ";
//                               return Container(
//                                 width: double.infinity,
//                                 height: 60,
//                                 margin: const EdgeInsets.only(bottom: 10.0),
//                                 decoration: const BoxDecoration(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10)),
//                                   color: Color(0x1affffff),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 20),
//                                   child: Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text(
//                                       list[0] +
//                                           space +
//                                           list[1] +
//                                           space +
//                                           list[2] +
//                                           space +
//                                           list[3] +
//                                           space +
//                                           list[4] +
//                                           // list[5] +
//                                           space +
//                                           list[6],
//                                       style: const TextStyle(
//                                         color: Color(0x80ffffff),
//                                         fontSize: 16,
//                                         height: 1,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           )
//                         : ListView(
//                             children: const [
//                               // I could show a GIF here that changes on every reload.
//                             ],
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const CustomMargin(amount: 40),
//         ],
//       ),
//     );
//   }
// }
