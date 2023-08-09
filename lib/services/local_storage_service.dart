import 'package:mmg_companion/constants/app_constant.dart';
import 'package:mmg_companion/services/conversion_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  // static const _keyGender = "gender";
  static const _keyCourses = "courses";
  static const _keyClasses = "classes";
  static const _keyIsG9 = "isG9";
  // static const _keyClass = "class";
  static const _keyIsTeacher = "isTeacher";
  static const _keyAbbreviation = "abbreviation";
  static const _keyIsRegistered = "isRegistered";
  static const _keyPlanPassword = "planPassword";
  static const _keyPlanUsername = "planUsername";
  static const _keyIsOberstufe = "isOberstufe";
  static const _keyAutomaticCourseEnrollment = "automaticCourseEnrollment";

  static const _keyStartPage = "startPage";

  static const _keyLastUpdatedTodayOrLastSchoolDay =
      "lastUpdatedTodayOrLastSchoolDay";
  static const _keyLastUpdatedNextSchoolDay = "lastUpdatedNextSchoolDay";
  static const _keyLastUpdatedSchoolDayAfterNextSchoolDay =
      "lastUpdatedSchoolDayAfterNextSchoolDay";

  static const _keyDateTodayOrLastSchoolDay = "dateTodayOrLastSchoolDay";
  static const _keyDateNextSchoolDay = "dateNextSchoolDay";
  static const _keyDateSchoolDayAfterNextSchoolDay =
      "dateSchoolDayAfterNextSchoolDay";

  static const _keyPlanTodayOrLastSchoolDay = "planTodayOrLastSchoolDay";
  static const _keyPlanNextSchoolDay = "planNextSchoolDay";
  static const _keyPlanSchoolDayAfterNextSchoolDay =
      "planSchoolDayAfterNextSchoolDay";

  static const _keyIndividualPlanTodayOrLastSchoolDay =
      "individualPlanTodayOrLastSchoolDay";
  static const _keyIndividualPlanNextSchoolDay = "individualPlanNextSchoolDay";
  static const _keyIndividualPlanSchoolDayAfterNextSchoolDay =
      "individualPlanSchoolDayAfterNextSchoolDay";

  static const _keyIsOutdatedTodayOrLastSchoolDay =
      "isOutdatedTodayOrLastSchoolDay";
  static const _keyIsOutdatedNextSchoolDay = "isOutdatedNextSchoolDay";
  static const _keyIsOutdatedSchoolDayAfterNextSchoolDay =
      "isOutdatedSchoolDayAfterNextSchoolDay";

  // Initialization

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Automatic Course Enrollment

  static Future setAutomaticCourseEnrollment(bool value) async {
    await _preferences!.setBool(_keyAutomaticCourseEnrollment, value);
  }

  static bool? getAutomaticCourseEnrollment() {
    return _preferences!.getBool(_keyAutomaticCourseEnrollment);
  }

  // Start Page

  static Future setStartPage(String value) async {
    await _preferences!.setString(_keyStartPage, value);
  }

  static String? getStartPage() {
    return _preferences!.getString(_keyStartPage);
  }

  static int? getStartPageIndex() {
    return siteStringMappedToSiteIndex[_preferences!.getString(_keyStartPage)];
  }

  static Future setIsG9(bool isG9) async {
    await _preferences!.setBool(_keyIsG9, isG9);
  }

  static bool? getIsG9() {
    return _preferences!.getBool(_keyIsG9);
  }

  // Classes and Courses

  static Future setCourses(String courses) async {
    await _preferences!.setString(_keyCourses, courses);
  }

  static String? getCourses() {
    return _preferences!.getString(_keyCourses);
  }

  static Future setClasses(String classes) async {
    await _preferences!.setString(_keyClasses, classes);
  }

  static String? getClasses() {
    return _preferences!.getString(_keyClasses);
  }

  // Teacher

  static Future setIsTeacher(bool isTeacher) async {
    await _preferences!.setBool(_keyIsTeacher, isTeacher);
  }

  static bool? getIsTeacher() {
    return _preferences!.getBool(_keyIsTeacher);
  }

  // Abbreviation

  static Future setAbbreviation(String abbreviation) async {
    await _preferences!.setString(_keyAbbreviation, abbreviation);
  }

  static String? getAbbreviation() {
    return _preferences!.getString(_keyAbbreviation);
  }

  // Register

  static Future setIsRegistered(bool isRegistered) async {
    await _preferences!.setBool(_keyIsRegistered, isRegistered);
  }

  static bool? getIsRegistered() {
    return _preferences!.getBool(_keyIsRegistered);
  }

  // Password & Username

  static Future setPlanPassword(String planPassword) async {
    await _preferences!.setString(_keyPlanPassword, planPassword);
  }

  static String? getPlanPassword() {
    return _preferences!.getString(_keyPlanPassword);
  }

  static Future setPlanUsername(String planUsername) async {
    await _preferences!.setString(_keyPlanUsername, planUsername);
  }

  static String? getPlanUsername() {
    return _preferences!.getString(_keyPlanUsername);
  }

  // Oberstufe

  static Future setIsOberstufe(bool isOberstufe) async {
    await _preferences!.setBool(_keyIsOberstufe, isOberstufe);
  }

  static bool? getIsOberstufe() {
    return _preferences!.getBool(_keyIsOberstufe);
  }

  // General Plans

  static Future setPlanTodayOrLastSchoolDay(List<List<String>> plan) async {
    final list = convertPlanToList(plan);
    await _preferences!.setStringList(_keyPlanTodayOrLastSchoolDay, list);
  }

  static List<List<String>> getPlanTodayOrLastSchoolDay() {
    final list = _preferences!.getStringList(_keyPlanTodayOrLastSchoolDay);
    return convertListToPlan(list!);
  }

  static Future setPlanNextSchoolDay(List<List<String>> plan) async {
    final list = convertPlanToList(plan);
    await _preferences!.setStringList(_keyPlanNextSchoolDay, list);
  }

  static List<List<String>> getPlanNextSchoolDay() {
    final list = _preferences!.getStringList(_keyPlanNextSchoolDay);
    return convertListToPlan(list!);
  }

  static Future setPlanSchoolDayAfterNextSchoolDay(
      List<List<String>> plan) async {
    final list = convertPlanToList(plan);
    await _preferences!
        .setStringList(_keyPlanSchoolDayAfterNextSchoolDay, list);
  }

  static List<List<String>> getPlanSchoolDayAfterNextSchoolDay() {
    final list =
        _preferences!.getStringList(_keyPlanSchoolDayAfterNextSchoolDay);
    return convertListToPlan(list!);
  }

  // Individual Plans

  static Future setIndividualPlanTodayOrLastSchoolDay(
      List<List<String>> plan) async {
    final list = convertPlanToList(plan);
    await _preferences!
        .setStringList(_keyIndividualPlanTodayOrLastSchoolDay, list);
  }

  static List<List<String>> getIndividualPlanTodayOrLastSchoolDay() {
    final list =
        _preferences!.getStringList(_keyIndividualPlanTodayOrLastSchoolDay);
    return convertListToPlan(list!);
  }

  static Future setIndividualPlanNextSchoolDay(List<List<String>> plan) async {
    final list = convertPlanToList(plan);
    await _preferences!.setStringList(_keyIndividualPlanNextSchoolDay, list);
  }

  static List<List<String>> getIndividualPlanNextSchoolDay() {
    final list = _preferences!.getStringList(_keyIndividualPlanNextSchoolDay);
    return convertListToPlan(list!);
  }

  static Future setIndividualPlanSchoolDayAfterNextSchoolDay(
      List<List<String>> plan) async {
    final list = convertPlanToList(plan);
    await _preferences!
        .setStringList(_keyIndividualPlanSchoolDayAfterNextSchoolDay, list);
  }

  static List<List<String>> getIndividualPlanSchoolDayAfterNextSchoolDay() {
    final list = _preferences!
        .getStringList(_keyIndividualPlanSchoolDayAfterNextSchoolDay);
    return convertListToPlan(list!);
  }

  // Last Updated

  static Future setLastUpdatedTodayOrLastSchoolDay(DateTime date) async {
    final dateString = date.toIso8601String();
    await _preferences!
        .setString(_keyLastUpdatedTodayOrLastSchoolDay, dateString);
  }

  static DateTime getLastUpdatedTodayOrLastSchoolDay() {
    final dateString =
        _preferences!.getString(_keyLastUpdatedTodayOrLastSchoolDay);
    return DateTime.tryParse(dateString!)!;
  }

  static Future setLastUpdatedNextSchoolDay(DateTime date) async {
    final dateString = date.toIso8601String();
    await _preferences!.setString(_keyLastUpdatedNextSchoolDay, dateString);
  }

  static DateTime getLastUpdatedNextSchoolDay() {
    final dateString = _preferences!.getString(_keyLastUpdatedNextSchoolDay);
    return DateTime.tryParse(dateString!)!;
  }

  static Future setLastUpdatedSchoolDayAfterNextSchoolDay(DateTime date) async {
    final dateString = date.toIso8601String();
    await _preferences!
        .setString(_keyLastUpdatedSchoolDayAfterNextSchoolDay, dateString);
  }

  static DateTime getLastUpdatedSchoolDayAfterNextSchoolDay() {
    final dateString =
        _preferences!.getString(_keyLastUpdatedSchoolDayAfterNextSchoolDay);
    return DateTime.tryParse(dateString!)!;
  }

  // Dates

  static Future setDateTodayOrLastSchoolDay(DateTime date) async {
    final dateString = date.toIso8601String();
    await _preferences!.setString(_keyDateTodayOrLastSchoolDay, dateString);
  }

  static DateTime getDateTodayOrLastSchoolDay() {
    final dateString = _preferences!.getString(_keyDateTodayOrLastSchoolDay);
    return DateTime.tryParse(dateString!)!;
  }

  static Future setDateNextSchoolDay(DateTime date) async {
    final dateString = date.toIso8601String();
    await _preferences!.setString(_keyDateNextSchoolDay, dateString);
  }

  static DateTime getDateNextSchoolDay() {
    final dateString = _preferences!.getString(_keyDateNextSchoolDay);
    return DateTime.tryParse(dateString!)!;
  }

  static Future setDateSchoolDayAfterNextSchoolDay(DateTime date) async {
    final dateString = date.toIso8601String();
    await _preferences!
        .setString(_keyDateSchoolDayAfterNextSchoolDay, dateString);
  }

  static DateTime getDateSchoolDayAfterNextSchoolDay() {
    final dateString =
        _preferences!.getString(_keyDateSchoolDayAfterNextSchoolDay);
    return DateTime.tryParse(dateString!)!;
  }

  // Outdated

  static Future setIsOutdatedTodayOrLastSchoolDay(bool value) async {
    await _preferences!.setBool(_keyIsOutdatedTodayOrLastSchoolDay, value);
  }

  static bool getIsOutdatedTodayOrLastSchoolDay() {
    return _preferences!.getBool(_keyIsOutdatedTodayOrLastSchoolDay)!;
  }

  static Future setIsOutdatedNextSchoolDay(bool value) async {
    await _preferences!.setBool(_keyIsOutdatedNextSchoolDay, value);
  }

  static bool getIsOutdatedNextSchoolDay() {
    return _preferences!.getBool(_keyIsOutdatedNextSchoolDay)!;
  }

  static Future setIsOutdatedSchoolDayAfterNextSchoolDay(bool value) async {
    await _preferences!
        .setBool(_keyIsOutdatedSchoolDayAfterNextSchoolDay, value);
  }

  static bool getIsOutdatedSchoolDayAfterNextSchoolDay() {
    return _preferences!.getBool(_keyIsOutdatedSchoolDayAfterNextSchoolDay)!;
  }

  // HTML Documents

  // Note: Parsing a String to a dom.Document doesn't seem to work.

  // static Future setPageTodayOrLastSchoolDay(dom.Document page) async {
  //   String htmlString = page.toString();
  //   print(htmlString);
  //   await _preferences!.setString(_keyPageTodayOrLastSchoolDay, htmlString);
  // }

  // static dom.Document getPageTodayOrLastSchoolDay() {
  //   final page = _preferences!.getString(_keyPageTodayOrLastSchoolDay);
  //   return Document.(page!);
  // }

  // static Future setPlanNextSchoolDay(List<List<String>> plan) async {
  //   final list = convertPlanToList(plan);
  //   await _preferences!.setStringList(_keyPlanNextSchoolDay, list);
  // }

  // static List<List<String>> getPlanNextSchoolDay() {
  //   final list = _preferences!.getStringList(_keyPlanNextSchoolDay);
  //   return convertListToPlan(list!);
  // }

  // static Future setPlanSchoolDayAfterNextSchoolDay(
  //     List<List<String>> plan) async {
  //   final list = convertPlanToList(plan);
  //   await _preferences!
  //       .setStringList(_keyPlanSchoolDayAfterNextSchoolDay, list);
  // }

  // static List<List<String>> getPlanSchoolDayAfterNextSchoolDay() {
  //   final list =
  //       _preferences!.getStringList(_keyPlanSchoolDayAfterNextSchoolDay);
  //   return convertListToPlan(list!);
  // }
}
