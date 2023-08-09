import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

import 'package:mmg_companion/constants/urls.dart';

import 'package:mmg_companion/utilities/widgets/base/custom_generic_appbar_widget.dart';

class StatisticsView extends StatefulWidget {
  const StatisticsView({super.key});

  @override
  State<StatisticsView> createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<StatisticsView> {
  void send() async {
    var form = <String, String>{
      'user': 'miwa',
      'pass': 'M1VVA%',
    };

    var res = await http.post(
      Uri.parse(urlElternportalKrankmeldungen),
      body: form,
    );
    print(res.statusCode);
    print(res.body);
  }

  foo() async {
    String username = 'user';
    String password = 'pass';
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    dev.log(basicAuth);

    http.Response r = await http.get(
      Uri.parse(urlElternportalKrankmeldungen),
      headers: <String, String>{'authorization': basicAuth},
    );
    print(r.statusCode);
    print(r.body);
  }

  postData() async {
    var response = await http.post(
      // Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      Uri.parse(
          "https://mmgyvil.eltern-portal.org/includes/project/auth/login.php"),
      body: {
        // "id": 1.toString(),
        // "name": "gruffelwop",
        // "email": "me@gruffelwop.de",
        "username": "hoiss.monika@web.de",
        "password": "Hallo77",
      },
    );
    dev.log(response.statusCode.toString());
    print(response.body);
  }

  @override
  void initState() {
    postData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomGenericAppBar(
          name: "statistics",
        )
      ],
    );
  }
}
