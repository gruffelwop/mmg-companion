import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

import 'package:mmg_companion/constants/urls.dart';
import 'package:mmg_companion/services/local_storage_service.dart';

// getter for PageTodayOrLastSchoolDay

Future<dom.Document> getPageTodayOrLastSchoolDay() async {
  try {
    final url = Uri.parse(urlTodayOrLastSchoolDay);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw HttpException('${response.statusCode}');
    }
    LocalStorage.setIsOutdatedTodayOrLastSchoolDay(false);
    return dom.Document.html(response.body);
  } on SocketException {
    LocalStorage.setIsOutdatedTodayOrLastSchoolDay(true);
    throw const SocketException('No Internet connection 😑');
  } on HttpException {
    LocalStorage.setIsOutdatedTodayOrLastSchoolDay(true);
    throw const HttpException("Couldn't find the post 😱");
  } on FormatException {
    LocalStorage.setIsOutdatedTodayOrLastSchoolDay(true);
    throw const FormatException("Bad response format 👎");
  }
}

// getter for PageNextSchoolDay

Future<dom.Document> getPageNextSchoolDay() async {
  try {
    final url = Uri.parse(urlNextSchoolDay);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw HttpException('${response.statusCode}');
    }
    LocalStorage.setIsOutdatedNextSchoolDay(false);
    return dom.Document.html(response.body);
  } on SocketException {
    LocalStorage.setIsOutdatedNextSchoolDay(true);
    throw const SocketException('No Internet connection 😑');
  } on HttpException {
    LocalStorage.setIsOutdatedNextSchoolDay(true);
    throw const HttpException("Couldn't find the post 😱");
  } on FormatException {
    LocalStorage.setIsOutdatedNextSchoolDay(true);
    throw const FormatException("Bad response format 👎");
  }
}

// getter for PageSchoolDayAfterNextSchoolDay

Future<dom.Document> getPageSchoolDayAfterNextSchoolDay() async {
  try {
    final url = Uri.parse(urlSchoolDayAfterNextSchoolDay);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw HttpException('${response.statusCode}');
    }
    LocalStorage.setIsOutdatedSchoolDayAfterNextSchoolDay(false);
    return dom.Document.html(response.body);
  } on SocketException {
    LocalStorage.setIsOutdatedSchoolDayAfterNextSchoolDay(true);
    throw const SocketException('No Internet connection 😑');
  } on HttpException {
    LocalStorage.setIsOutdatedSchoolDayAfterNextSchoolDay(true);
    throw const HttpException("Couldn't find the post 😱");
  } on FormatException {
    LocalStorage.setIsOutdatedSchoolDayAfterNextSchoolDay(true);
    throw const FormatException("Bad response format 👎");
  }
}
