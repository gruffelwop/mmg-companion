class Regex {
  static RegExp classesRegexG8 =
      RegExp(r'^(10|[56789])[a-zA-Z]+[0-9]?(,\s(10|[56789])[a-zA-Z]+[0-9]?)*$');

  static RegExp classesRegexG9 = RegExp(
      r'^(10|11|[56789])[a-zA-Z]+[0-9]?(,\s(10|11|[56789])[a-zA-Z]+[0-9]?)*$');

  static RegExp coursesRegexG8 =
      RegExp(r'^[12][a-zA-Z]+[0-9](,\s[12][a-zA-Z]+[0-9])*$');

  static RegExp coursesRegexG9 =
      RegExp(r'^[23][a-zA-Z]+[0-9](,\s[23][a-zA-Z]+[0-9])*$');

  static RegExp teacherRegex = RegExp(r'^[a-zA-Z]{4}$');
  static RegExp emptyRegex = RegExp(r'^[a-zA-Z]{0}$');
}
