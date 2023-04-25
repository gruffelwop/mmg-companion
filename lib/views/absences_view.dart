import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

import 'package:mmg_companion/services/app_service.dart';
import 'package:mmg_companion/services/local_storage_service.dart';
import 'package:mmg_companion/utilities/widgets/custom_absences_appbar_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_margin_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_refresh_indicator_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_scrollable_list_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_section_header_widget.dart';
import 'package:mmg_companion/utilities/widgets/custom_text_container_widget.dart';

class AbsencesView extends StatefulWidget {
  const AbsencesView({super.key});

  @override
  State<AbsencesView> createState() => _AbsencesViewState();
}

class _AbsencesViewState extends State<AbsencesView> {
  List<List<String>> _vertretungen0 = [];
  List<List<String>> _vertretungen1 = [];
  DateTime _date0 = DateTime(0);
  DateTime _date1 = DateTime(0);
  DateTime _lastUpdated0 = DateTime(0);
  DateTime _lastUpdated1 = DateTime(0);
  String _isOutdated0 = "";
  String _isOutdated1 = "";

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor:
          Color(0xff343434), // This is the secondaryColor without transparency.
    ));
    if (LocalStorage.getIsRegistered() == true) {
      _getPlanDateAndVertretungen();
    }
    super.initState();
  }

  void _getPlanDateAndVertretungen() {
    late List<List<String>> vertretungen0;
    late List<List<String>> vertretungen1;
    late DateTime date0;
    late DateTime date1;
    late DateTime lastUpdated0;
    late DateTime lastUpdated1;
    late bool isOutdated0;
    late bool isOutdated1;

    DateTime now = DateTime.now();

    DateTime today = DateTime(now.year, now.month, now.day);

    DateTime planDateTodayOrLastSchoolDay;
    DateTime planDateNextSchoolDay;
    DateTime planDateSchoolDayAfterNextSchoolDay;

    DateTime planLastUpdatedTodayOrLastSchoolDay;
    DateTime planLastUpdatedNextSchoolDay;
    DateTime planLastUpdatedSchoolDayAfterNextSchoolDay;

    List<List<String>> planTodayOrLastSchoolDay;
    List<List<String>> planNextSchoolDay;
    List<List<String>> planSchoolDayAfterNextSchoolDay;

    bool isOutdatedTodayOrLastSchoolDay;
    bool isOutdatedNextSchoolDay;
    bool isOutdatedSchoolDayAfterNextSchoolDay;

    planDateTodayOrLastSchoolDay = LocalStorage.getDateTodayOrLastSchoolDay();
    planDateNextSchoolDay = LocalStorage.getDateNextSchoolDay();
    planDateSchoolDayAfterNextSchoolDay =
        LocalStorage.getDateSchoolDayAfterNextSchoolDay();

    planLastUpdatedTodayOrLastSchoolDay =
        LocalStorage.getLastUpdatedTodayOrLastSchoolDay();
    planLastUpdatedNextSchoolDay = LocalStorage.getLastUpdatedNextSchoolDay();
    planLastUpdatedSchoolDayAfterNextSchoolDay =
        LocalStorage.getLastUpdatedSchoolDayAfterNextSchoolDay();

    planTodayOrLastSchoolDay =
        LocalStorage.getIndividualPlanTodayOrLastSchoolDay();
    planNextSchoolDay = LocalStorage.getIndividualPlanNextSchoolDay();
    planSchoolDayAfterNextSchoolDay =
        LocalStorage.getIndividualPlanSchoolDayAfterNextSchoolDay();

    isOutdatedTodayOrLastSchoolDay =
        LocalStorage.getIsOutdatedTodayOrLastSchoolDay();
    isOutdatedNextSchoolDay = LocalStorage.getIsOutdatedNextSchoolDay();
    isOutdatedSchoolDayAfterNextSchoolDay =
        LocalStorage.getIsOutdatedSchoolDayAfterNextSchoolDay();

    switch (today.weekday) {
      case DateTime.saturday:
        {
          vertretungen0 = planNextSchoolDay;
          date0 = planDateNextSchoolDay;
          lastUpdated0 = planLastUpdatedNextSchoolDay;
          isOutdated0 = isOutdatedNextSchoolDay;
          break;
        }
      case DateTime.sunday:
        {
          vertretungen0 = planNextSchoolDay;
          date0 = planDateNextSchoolDay;
          lastUpdated0 = planLastUpdatedNextSchoolDay;
          isOutdated0 = isOutdatedNextSchoolDay;
          break;
        }
      default:
        {
          if (planDateNextSchoolDay == today) {
            vertretungen0 = planNextSchoolDay;
            date0 = planDateNextSchoolDay;
            lastUpdated0 = planLastUpdatedNextSchoolDay;
            isOutdated0 = isOutdatedNextSchoolDay;
          } else if (today != planDateTodayOrLastSchoolDay) {
            vertretungen0 = planNextSchoolDay;
            date0 = planDateNextSchoolDay;
            lastUpdated0 = planLastUpdatedNextSchoolDay;
            isOutdated0 = isOutdatedNextSchoolDay;
          } else {
            vertretungen0 = planTodayOrLastSchoolDay;
            date0 = planDateTodayOrLastSchoolDay;
            lastUpdated0 = planLastUpdatedTodayOrLastSchoolDay;
            isOutdated0 = isOutdatedTodayOrLastSchoolDay;
          }
          break;
        }
    }
    switch (today.weekday) {
      case DateTime.saturday:
        {
          vertretungen1 = planSchoolDayAfterNextSchoolDay;
          date1 = planDateSchoolDayAfterNextSchoolDay;
          lastUpdated1 = planLastUpdatedSchoolDayAfterNextSchoolDay;
          isOutdated1 = isOutdatedSchoolDayAfterNextSchoolDay;
          break;
        }
      case DateTime.sunday:
        {
          vertretungen1 = planSchoolDayAfterNextSchoolDay;
          date1 = planDateSchoolDayAfterNextSchoolDay;
          lastUpdated1 = planLastUpdatedSchoolDayAfterNextSchoolDay;
          isOutdated1 = isOutdatedSchoolDayAfterNextSchoolDay;
          break;
        }
      default:
        {
          if (planDateNextSchoolDay == today) {
            vertretungen1 = planSchoolDayAfterNextSchoolDay;
            date1 = planDateSchoolDayAfterNextSchoolDay;
            lastUpdated1 = planLastUpdatedSchoolDayAfterNextSchoolDay;
            isOutdated1 = isOutdatedSchoolDayAfterNextSchoolDay;
          } else if (today != planDateTodayOrLastSchoolDay) {
            vertretungen1 = planSchoolDayAfterNextSchoolDay;
            date1 = planDateSchoolDayAfterNextSchoolDay;
            lastUpdated1 = planLastUpdatedSchoolDayAfterNextSchoolDay;
            isOutdated1 = isOutdatedSchoolDayAfterNextSchoolDay;
          } else {
            vertretungen1 = planNextSchoolDay;
            date1 = planDateNextSchoolDay;
            lastUpdated1 = planLastUpdatedNextSchoolDay;
            isOutdated1 = isOutdatedNextSchoolDay;
          }
          break;
        }
    }

    if (mounted) {
      setState(() {
        _vertretungen0 = vertretungen0;
        _vertretungen1 = vertretungen1;

        _date0 = date0;
        _date1 = date1;

        _lastUpdated0 = lastUpdated0;
        _lastUpdated1 = lastUpdated1;

        _isOutdated0 = isOutdated0 == true ? "(outdated)" : "";
        _isOutdated1 = isOutdated1 == true ? "(outdated)" : "";
      });
    }
  }

  Future<void> _updatePlanDateAndVertretungen() async {
    await fillLocalStorage();
    await Future.delayed(const Duration(seconds: 2));
    _getPlanDateAndVertretungen();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAbsencesAppBar(),
        const CustomMargin(amount: 40),
        // const CustomMargin(amount: 20),
        CustomScrollableList(
          nonScrollableTitle: CustomSectionHeader(
            name:
                "${DateFormat('EEEE').format(_date0)}, ${DateFormat('dd.MM').format(_date0)} (${DateFormat('dd.MM, H:m').format(_lastUpdated0)}) $_isOutdated0"
                    .toLowerCase(),
            // as of...
          ),
          scrollable: CustomRefreshIndicator(
              onRefresh: _updatePlanDateAndVertretungen,
              conditon: _vertretungen0.isNotEmpty,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: _vertretungen0.length,
                itemBuilder: (context, index) {
                  List<String> list = _vertretungen0[index];
                  String space = " ";
                  return CustomTextContainer(
                    content: list[0] +
                        space +
                        list[1] +
                        space +
                        list[2] +
                        space +
                        list[3] +
                        space +
                        list[4] +
                        space +
                        list[6],
                  );
                },
              )),
        ),
        // const CustomMargin(amount: 40),
        const CustomMargin(amount: 20),
        CustomScrollableList(
          nonScrollableTitle: CustomSectionHeader(
            name:
                "${DateFormat('EEEE').format(_date1)}, ${DateFormat('dd.MM').format(_date1)} (${DateFormat('dd.MM, H:m').format(_lastUpdated1)}) $_isOutdated1"
                    .toLowerCase(),
          ),
          scrollable: CustomRefreshIndicator(
              onRefresh: _updatePlanDateAndVertretungen,
              conditon: _vertretungen1.isNotEmpty,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: _vertretungen1.length,
                itemBuilder: (context, index) {
                  List<String> list = _vertretungen1[index];
                  String space = " ";
                  return CustomTextContainer(
                    content: list[0] +
                        space +
                        list[1] +
                        space +
                        list[2] +
                        space +
                        list[3] +
                        space +
                        list[4] +
                        space +
                        list[6],
                  );
                },
              )),
        ),
        // const CustomMargin(amount: 40),
        const CustomMargin(amount: 20),
        // Container(
        //   height: 60,
        //   decoration: BoxDecoration(
        //     color: secondaryColor,
        //     borderRadius: const BorderRadius.vertical(
        //       top: Radius.circular(10 * 2),
        //     ),
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Icon(
        //         Icons.graphic_eq,
        //         color: primaryColor,
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
