import 'package:flutter/material.dart';

import 'package:mmg_companion/constants/colors.dart';

TextStyle customBodyTextStyle = TextStyle(
  color: primaryColor,
  fontSize: 16,
  height: 1,
);

TextStyle customBodyMultilineText = TextStyle(
  color: primaryColor,
  fontSize: 16,
  height: 1.5,
);

TextStyle customHeaderTextStyle = TextStyle(
  color: primaryColor,
  fontSize: 48,
  height: 1,
);

TextStyle customAppBarTextStyle = TextStyle(
  color: primaryColor,
  fontSize: 16,
  height: 3,
);

TextStyle customSmallTextStyle = TextStyle(
  color: primaryColor,
  fontSize: 12,
  height: 1,
);

class CustomBodyText extends StatelessWidget {
  final String content;
  const CustomBodyText({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: primaryColor,
        fontSize: 16,
        height: 1,
      ),
    );
  }
}

class CustomColoredBodyText extends StatelessWidget {
  final String content;
  final Color color;
  const CustomColoredBodyText({
    super.key,
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: color,
        fontSize: 16,
        height: 1,
      ),
    );
  }
}

class CustomBodyMultilineText extends StatelessWidget {
  final String content;
  const CustomBodyMultilineText({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: primaryColor,
        fontSize: 16,
        height: 1.5,
      ),
    );
  }
}

class CustomHeaderText extends StatelessWidget {
  final String content;
  const CustomHeaderText({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: primaryColor,
        fontSize: 48,
        height: 1,
      ),
    );
  }
}

class CustomAppBarText extends StatelessWidget {
  final String content;
  const CustomAppBarText({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: primaryColor,
        fontSize: 16,
        height: 3,
      ),
    );
  }
}

class CustomSmallText extends StatelessWidget {
  final String content;
  const CustomSmallText({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: primaryColor,
        fontSize: 12,
        height: 1,
      ),
    );
  }
}
