
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/dom.dart' as dom;
// import 'package:mmg_companion/constants/plan_constants.dart';
// import 'package:mmg_companion/services/data_fetching_layer.dart';

// import 'package:mmg_companion/services/local_storage_service.dart';

// // Authentication Functions

// Future<bool> checkUsernameAndPassword({
//   required String username,
//   required String password,
// }) async {
//   try {
//     String urlTodayOrLastSchoolDay =
//         "http://$username:$password@www.montgelas-gymnasium.de/verps/M_Vertretungsplan_Schueler_heute.htm";
//     final url = Uri.parse(urlTodayOrLastSchoolDay);
//     final response = await http.get(url);
//     if (response.statusCode != 200) {
//       throw HttpException('${response.statusCode}');
//     }
//     dom.Document html = dom.Document.html(response.body);

//     List<String> webpageHeader = html
//         .querySelectorAll(".TextUeberschrift")
//         .map((element) => element.innerHtml.trim())
//         .toList();

//     if (webpageHeader.isNotEmpty) {
//       // print(true);
//       return true;
//     } else {
//       // print(false);
//       return false;
//     }
//   } on SocketException {
//     throw const SocketException('No Internet connection 😑');
//   } on HttpException {
//     throw const HttpException("Couldn't find the post 😱");
//   } on FormatException {
//     throw const FormatException("Bad response format 👎");
//   }
// }

// // Probably not necessary!
// // Future<bool> getConnectionState() async {
// //   final url = Uri.parse(urlTodayOrLastSchoolDay);
// //   try {
// //     await http.get(url);
// //     return true;
// //   } on Exception catch (_) {
// //     return false;
// //   }
// // }

// // Conversion Functions

// // TODO: Fix the removal of the empty column.

// List<List<String>> convertListToPlan(List<String> inputList) {
//   List<List<String>> chunks = [];

//   for (var i = 0; i < inputList.length; i += chunkSize) {
//     chunks.add(
//       inputList.sublist(
//         i,
//         i + chunkSize > inputList.length ? inputList.length : i + chunkSize,
//       ),
//     );
//   }

//   // for (var element in chunks) {
//   //   element.removeAt(5);
//   // }

//   // for (int i = 0; i < chunks.length; i++) {
//   //   List<String> list = chunks[i];
//   //   for (int k = 0; k < list.length; k++) {
//   //     if (list[k].isEmpty) {
//   //       list[k] = "[${columnNames[k]}]";
//   //     }
//   //   }
//   // }

//   return chunks;
// }

// // List<List<String>> convertPlanToIndividualPlanOld(
// //     List<List<String>> inputPlan) {
// //   bool isTeacher = LocalStorage.getIsTeacher()!;
// //   bool isOberstufe = LocalStorage.getIsOberstufe()!;
// //   List<String> studentFilter = [];
// //   String teacherFilter = "";
// //   List<List<String>> generalVertretungsplan = inputPlan;
// //   List<List<String>> individualVertretungsplan = [];
// //   if (isTeacher == false) {
// //     if (isOberstufe == true) {
// //       studentFilter = LocalStorage.getCourses()!.split(", ");
// //     } else if (isOberstufe == false) {
// //       studentFilter = [LocalStorage.getClass()!];
// //     }
// //   } else if (isTeacher == true) {
// //     teacherFilter = LocalStorage.getAbbreviation()!;
// //   }
// //   // Does not work for some reason :(
// //   if (studentFilter.isEmpty && isTeacher == false) {
// //     individualVertretungsplan = generalVertretungsplan;
// //   }
// //   if (studentFilter.isNotEmpty && isTeacher == false) {
// //     for (String className in studentFilter) {
// //       for (List<String> list in generalVertretungsplan) {
// //         if (className == list[0]) {
// //           individualVertretungsplan.add(list);
// //         }
// //       }
// //     }
// //   }
// //   if (isTeacher == true) {
// //     for (List<String> list in generalVertretungsplan) {
// //       if (teacherFilter == list[2]) {
// //         individualVertretungsplan.add(list);
// //       }
// //     }
// //   }
// //   return individualVertretungsplan;
// // }

// List<String> convertPlanToList(List<List<String>> inputPlan) {
//   List<String> outputList = [];

//   for (List<String> row in inputPlan) {
//     for (var value in row) {
//       outputList.add(value);
//     }
//   }
//   return outputList;
// }

// // Initialization Functions

// // Future<void> initializeLocalStorageWithoutErrorHandling() async {
// //   if (LocalStorage.getIsRegistered() == true) {
// //     // TODO: Use multiple threads for this repetitive task.
// //     await LocalStorage.setDateTodayOrLastSchoolDay(
// //       getPlanDate(await getPageTodayOrLastSchoolDay()),
// //     );
// //     await LocalStorage.setDateNextSchoolDay(
// //       getPlanDate(await getPageNextSchoolDay()),
// //     );
// //     await LocalStorage.setDateSchoolDayAfterNextSchoolDay(
// //       getPlanDate(await getPageSchoolDayAfterNextSchoolDay()),
// //     );
// //     await LocalStorage.setPlanTodayOrLastSchoolDay(
// //       getPlan(await getPageTodayOrLastSchoolDay()),
// //     );
// //     await LocalStorage.setPlanNextSchoolDay(
// //       getPlan(await getPageNextSchoolDay()),
// //     );
// //     await LocalStorage.setPlanSchoolDayAfterNextSchoolDay(
// //       getPlan(await getPageSchoolDayAfterNextSchoolDay()),
// //     );
// //     await LocalStorage.setIndividualPlanTodayOrLastSchoolDay(
// //       convertPlanToIndividualPlan(LocalStorage.getPlanTodayOrLastSchoolDay()),
// //     );
// //     await LocalStorage.setIndividualPlanNextSchoolDay(
// //       convertPlanToIndividualPlan(LocalStorage.getPlanNextSchoolDay()),
// //     );
// //     await LocalStorage.setIndividualPlanSchoolDayAfterNextSchoolDay(
// //       convertPlanToIndividualPlan(
// //           LocalStorage.getPlanSchoolDayAfterNextSchoolDay()),
// //     );
// //   }
// // }

// // this is still not the most efficient it can get. we are still requesting the page multiple times for date and plan.
// // TODO: I should store this in the LocalStorage!
// // TODO: Use multiple threads for this repetitive task.

// Future<void> fillLocalStorage() async {
//   if (LocalStorage.getIsRegistered() == true) {
//     try {
//       await LocalStorage.setDateTodayOrLastSchoolDay(
//         getPlanDate(await getPageTodayOrLastSchoolDay()),
//       );
//     } on SocketException {
//       DoNothingAction;
//     }

//     try {
//       await LocalStorage.setDateNextSchoolDay(
//         getPlanDate(await getPageNextSchoolDay()),
//       );
//     } on SocketException {
//       DoNothingAction;
//     }

//     try {
//       await LocalStorage.setDateSchoolDayAfterNextSchoolDay(
//         getPlanDate(await getPageSchoolDayAfterNextSchoolDay()),
//       );
//     } on SocketException {
//       DoNothingAction;
//     }

//     try {
//       await LocalStorage.setPlanTodayOrLastSchoolDay(
//         getPlan(await getPageTodayOrLastSchoolDay()),
//       );
//     } on SocketException {
//       DoNothingAction;
//     }

//     try {
//       await LocalStorage.setPlanNextSchoolDay(
//         getPlan(await getPageNextSchoolDay()),
//       );
//     } on SocketException {
//       DoNothingAction;
//     }

//     try {
//       await LocalStorage.setPlanSchoolDayAfterNextSchoolDay(
//         getPlan(await getPageSchoolDayAfterNextSchoolDay()),
//       );
//     } on SocketException {
//       DoNothingAction;
//     }

//     try {
//       await LocalStorage.setIndividualPlanTodayOrLastSchoolDay(
//         convertPlanToIndividualPlan(LocalStorage.getPlanTodayOrLastSchoolDay()),
//       );
//     } on Exception {
//       DoNothingAction;
//     }

//     try {
//       await LocalStorage.setIndividualPlanNextSchoolDay(
//         convertPlanToIndividualPlan(LocalStorage.getPlanNextSchoolDay()),
//       );
//     } on Exception {
//       DoNothingAction;
//     }

//     try {
//       await LocalStorage.setIndividualPlanSchoolDayAfterNextSchoolDay(
//         convertPlanToIndividualPlan(
//             LocalStorage.getPlanSchoolDayAfterNextSchoolDay()),
//       );
//     } on Exception {
//       DoNothingAction;
//     }
//   }
// }
// // Date

// // Individual Plan

// // TODO: Does the same thing as convertPlanToIndividualPlan()

// // List<List<String>> getIndividualPlan(List<List<String>> generalPlan) {
// //   bool isTeacher = LocalStorage.getIsTeacher()!;
// //   bool isOberstufe = LocalStorage.getIsOberstufe()!;

// //   List<String> studentFilter = [];
// //   String teacherFilter = "";

// //   List<List<String>> individualVertretungsplan = [];

// //   if (isTeacher == false) {
// //     if (isOberstufe == true) {
// //       studentFilter = LocalStorage.getCourses()!.split(", ");
// //     } else if (isOberstufe == false) {
// //       studentFilter = [LocalStorage.getClass()!];
// //     }
// //   } else if (isTeacher == true) {
// //     teacherFilter = LocalStorage.getAbbreviation()!;
// //   }

// //   if (isTeacher == false) {
// //     for (String className in studentFilter) {
// //       for (List<String> list in generalPlan) {
// //         if (className == list[0]) {
// //           individualVertretungsplan.add(list);
// //         }
// //       }
// //     }
// //   } else if (isTeacher == true) {
// //     for (List<String> list in generalPlan) {
// //       if (teacherFilter == list[2]) {
// //         individualVertretungsplan.add(list);
// //       }
// //     }
// //   }
// //   return individualVertretungsplan;
// // }
