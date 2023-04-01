import 'package:mmg_companion/services/conversion_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  static const _keyGender = "gender";
  static const _keyCourses = "courses";
  static const _keyClass = "class";
  static const _keyIsTeacher = "isTeacher";
  static const _keyAbbreviation = "abbreviation";
  static const _keyIsRegistered = "isRegistered";
  static const _keyPlanPassword = "planPassword";
  static const _keyPlanUsername = "planUsername";
  static const _keyIsOberstufe = "isOberstufe";

  // static const _keyPageTodayOrLastSchoolDay = "pageTodayOrLastSchoolDay";
  // static const _keyPageNextSchoolDay = "pageNextSchoolDay";
  // static const _keyPageSchoolDayAfterNextSchoolDay =
  //     "pageSchoolDayAfterNextSchoolDay";

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

  // Experimental

  static Future setString(String key, String value) async {
    await _preferences!.setString(key, value);
  }

  static String? getString(String key) {
    return _preferences!.getString(key);
  }

  static Future setList(String key, List<String> value) async {
    await _preferences!.setStringList(key, value);
  }

  static List<String>? getList(String key) {
    return _preferences!.getStringList(key);
  }

  static Future setBool(String key, bool value) async {
    await _preferences!.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _preferences!.getBool(key);
  }

  // Gender

  static Future setGender(String gender) async {
    await _preferences!.setString(_keyGender, gender);
  }

  static String? getGender() {
    return _preferences!.getString(_keyGender);
  }

  // Courses

  static Future setCourses(String classes) async {
    await _preferences!.setString(_keyCourses, classes);
  }

  static String? getCourses() {
    return _preferences!.getString(_keyCourses);
  }

  // static Future setCourses(List<String> courses) async {
  //   await _preferences!.setStringList(_keyCourses, courses);
  // }

  // static List? getCourses() {
  //   return _preferences!.getStringList(_keyCourses);
  // }

  // Class

  static Future setClass(String cClass) async {
    await _preferences!.setString(_keyClass, cClass);
  }

  static String? getClass() {
    return _preferences!.getString(_keyClass);
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
