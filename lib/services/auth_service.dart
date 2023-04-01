import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

// Checking username and password by passing them to the function

Future<bool> checkUsernameAndPassword({
  required String username,
  required String password,
}) async {
  try {
    String urlTodayOrLastSchoolDay =
        "http://$username:$password@www.montgelas-gymnasium.de/verps/M_Vertretungsplan_Schueler_heute.htm";
    final url = Uri.parse(urlTodayOrLastSchoolDay);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw HttpException('${response.statusCode}');
    }
    dom.Document html = dom.Document.html(response.body);

    List<String> webpageHeader = html
        .querySelectorAll(".TextUeberschrift")
        .map((element) => element.innerHtml.trim())
        .toList();

    if (webpageHeader.isNotEmpty) {
      // print(true);
      return true;
    } else {
      // print(false);
      return false;
    }
  } on SocketException {
    throw const SocketException('No Internet connection 😑');
  } on HttpException {
    throw const HttpException("Couldn't find the post 😱");
  } on FormatException {
    throw const FormatException("Bad response format 👎");
  }
}

// Checking username and password without passing them to the function

// Future checkUsernameAndPasswordExp() {}
