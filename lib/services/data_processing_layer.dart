import 'package:html/dom.dart' as dom;
import 'package:mmg_companion/constants/plan_constants.dart';
import 'package:mmg_companion/services/local_storage_service.dart';

// Date

DateTime getPlanDate(dom.Document html) {
  List<String> dates = html
      .querySelectorAll(".TextUeberschrift")
      .map((element) => element.innerHtml.trim())
      .toList();

  String date = dates.first;

  int day = int.parse(date.split(" ").reversed.toList()[0].split(".")[0]);
  int month = int.parse(date.split(" ").reversed.toList()[0].split(".")[1]);
  int year = int.parse(date.split(" ").reversed.toList()[0].split(".")[2]);

  return DateTime(
    year,
    month,
    day,
  );
}

// Last Updated

DateTime getPlanLastUpdated(dom.Document html) {
  List<String> dates = html
      .querySelectorAll(".TextAktuellesDatum")
      .map((element) => element.innerHtml.trim())
      .toList();

  String date = dates.first;

  int hour = int.parse(date.split(" ").reversed.toList()[0].split(":")[0]);
  int minute = int.parse(date.split(" ").reversed.toList()[0].split(":")[1]);

  int day = int.parse(date.split(" ").reversed.toList()[1].split(".")[0]);
  int month = int.parse(date.split(" ").reversed.toList()[1].split(".")[1]);
  int year = int.parse(date.split(" ").reversed.toList()[1].split(".")[2]);

  return DateTime(
    year,
    month,
    day,
    hour,
    minute,
  );
}

// General Plan

List<List<String>> getPlan(dom.Document html) {
  List<List<String>> chunks = [];

  List<String> vertretungen = html
          .querySelectorAll(".UngeradeZelleTabelleVertretungen")
          .map((element) => element.innerHtml.trim())
          .toList() +
      html
          .querySelectorAll(".ZelleGeradeTabelleVertretungen")
          .map((element) => element.innerHtml.trim())
          .toList();

  for (var i = 0; i < vertretungen.length; i += chunkSize) {
    chunks.add(
      vertretungen.sublist(
        i,
        i + chunkSize > vertretungen.length
            ? vertretungen.length
            : i + chunkSize,
      ),
    );
  }

  return chunks;
}

// Individual Plan

List<List<String>> getIndividualPlan(List<List<String>> inputPlan) {
  bool isTeacher = LocalStorage.getIsTeacher()!;
  bool isOberstufe = LocalStorage.getIsOberstufe() ?? false;

  String teacherFilter = LocalStorage.getAbbreviation() ?? "";
  List<String> coursesFilter = LocalStorage.getCourses() == ""
      ? []
      : LocalStorage.getCourses()!.split(", ");

  List<String> classesFilter = LocalStorage.getClasses() == ""
      ? []
      : LocalStorage.getClasses()!.split(", ");

  List<List<String>> generalVertretungsplan = inputPlan;
  List<List<String>> individualVertretungsplan = [];

  // The user hasn't entered anything

  // The user is a student

  // The user is in the 'Oberstufe'

  if (isTeacher == false && isOberstufe == true && coursesFilter.isEmpty) {
    return inputPlan;
  }

  // The user is in the 'Unter-or Mittelstufe'

  if (isTeacher == false && isOberstufe == false && classesFilter.isEmpty) {
    return inputPlan;
  }

  // The user is a teacher

  if (isTeacher == true && teacherFilter.isEmpty) {
    return inputPlan;
  }

  // The user has entered something

  // The user is a student

  // The user is in the 'Oberstufe'

  if (isTeacher == false && isOberstufe == true) {
    for (String className in coursesFilter) {
      for (List<String> list in generalVertretungsplan) {
        if (className == list[0]) {
          individualVertretungsplan.add(list);
        }
      }
    }
    // return individualVertretungsplan;
  }

  // The user is in the 'Unter-or Mittelstufe'

  if (isTeacher == false && isOberstufe == false) {
    for (String className in classesFilter) {
      for (List<String> list in generalVertretungsplan) {
        if (className == list[0]) {
          individualVertretungsplan.add(list);
        }
      }
    }
    // return individualVertretungsplan;
  }

  // The user is a teacher

  if (isTeacher == true) {
    for (List<String> list in generalVertretungsplan) {
      if (teacherFilter == list[2]) {
        individualVertretungsplan.add(list);
      }
    }
    // return individualVertretungsplan;
  }
  return individualVertretungsplan;
}
