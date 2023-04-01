import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mmg_companion/constants/colors.dart';
import 'package:mmg_companion/services/app_service.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/widgets/custom_margin_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_widgets.dart';

class CustomVertretungsplanWidget0 extends StatefulWidget {
  const CustomVertretungsplanWidget0({super.key});

  @override
  State<CustomVertretungsplanWidget0> createState() =>
      _CustomVertretungsplanWidget0State();
}

class _CustomVertretungsplanWidget0State
    extends State<CustomVertretungsplanWidget0> {
  List<List<String>> _vertretungen = [];
  DateTime _date = DateTime(0);
  String _isOutdated = "";

  @override
  void initState() {
    _fillLocalStorage();
    _getPlanDateAndVertretungen();
    super.initState();
  }

  Future<void> _fillLocalStorage() async {
    await fillLocalStorage();
  }

  Future<void> _getPlanDateAndVertretungen() async {
    late List<List<String>> vertretungen;
    late DateTime date;
    late bool isOutdated;

    DateTime now = DateTime.now();

    DateTime today = DateTime(now.year, now.month, now.day);

    DateTime planDateTodayOrLastSchoolDay;
    DateTime planDateNextSchoolDay;

    List<List<String>> planTodayOrLastSchoolDay;
    List<List<String>> planNextSchoolDay;

    bool isOutdatedTodayOrLastSchoolDay;
    bool isOutdatedNextSchoolDay;

    planDateTodayOrLastSchoolDay = LocalStorage.getDateTodayOrLastSchoolDay();
    planDateNextSchoolDay = LocalStorage.getDateNextSchoolDay();

    planTodayOrLastSchoolDay =
        LocalStorage.getIndividualPlanTodayOrLastSchoolDay();
    planNextSchoolDay = LocalStorage.getIndividualPlanNextSchoolDay();

    isOutdatedTodayOrLastSchoolDay =
        LocalStorage.getIsOutdatedTodayOrLastSchoolDay();
    isOutdatedNextSchoolDay = LocalStorage.getIsOutdatedNextSchoolDay();

    switch (today.weekday) {
      case DateTime.saturday:
        {
          vertretungen = planNextSchoolDay;
          date = planDateNextSchoolDay;
          isOutdated = isOutdatedNextSchoolDay;
          break;
        }
      case DateTime.sunday:
        {
          vertretungen = planNextSchoolDay;
          date = planDateNextSchoolDay;
          isOutdated = isOutdatedNextSchoolDay;
          break;
        }
      default:
        {
          if (planDateNextSchoolDay == today) {
            vertretungen = planNextSchoolDay;
            date = planDateNextSchoolDay;
            isOutdated = isOutdatedNextSchoolDay;
          } else {
            vertretungen = planTodayOrLastSchoolDay;
            date = planDateTodayOrLastSchoolDay;
            isOutdated = isOutdatedTodayOrLastSchoolDay;
          }
          break;
        }
    }

    setState(() {
      _date = date;
      _vertretungen = vertretungen;
      if (isOutdated == true) {
        _isOutdated = "—possibly outdated";
      } else {
        // _isOutdated = "—up-to-date";
        _isOutdated = "";
      }
    });
  }

  Future<void> updatePlanDateAndVertretungen0() async {
    await fillLocalStorage();
    await Future.delayed(const Duration(seconds: 2));
    _getPlanDateAndVertretungen();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _date == DateTime(0)
                ? Container()
                : CustomBodyText(
                    content:
                        "${DateFormat('EEEE').format(_date)}, ${DateFormat('dd.MM').format(_date)}$_isOutdated"
                            .toLowerCase(),
                  ),
          ],
        ),
        const CustomMargin(amount: 10),
        Expanded(
          child: RefreshIndicator(
            onRefresh: updatePlanDateAndVertretungen0,
            color: primaryColor,
            backgroundColor: backgroundColor,
            child: _vertretungen.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: _vertretungen.length,
                    itemBuilder: (context, index) {
                      List<String> list = _vertretungen[index];
                      String space = " ";
                      return Container(
                        width: double.infinity,
                        height: 60,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0x1affffff),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              list[0] +
                                  space +
                                  list[1] +
                                  space +
                                  list[2] +
                                  space +
                                  list[3] +
                                  space +
                                  list[4] +
                                  // list[5] +
                                  space +
                                  list[6],
                              style: const TextStyle(
                                color: Color(0x80ffffff),
                                fontSize: 16,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                // : Container(),
                : ListView(
                    children: const [
                      Center(
                        child: CustomBodyText(
                          content: "Nothing out of the ordinary :(",
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
