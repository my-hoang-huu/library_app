import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'drop_down_button.dart';

class DateFormatter {
  static final yMdhms = DateFormat('yyyy/MM/dd - hh:mm:ss');

  static final monthDayYear = DateFormat('MM/dd/yyyy');
  static final dayMonthYear = DateFormat('dd/MM/yyyy');
  static final yearMonthDay = DateFormat('yyyy/MM/dd');

  static ddMMyyyy(DateTime date) => DateFormat('dd/MM/yyyy').format(date);
  static ddMMyyyyHHmmss(DateTime date) => DateFormat('yyyy/MM/dd - HH:mm:ss').format(date);

  static hms(DateTime date) => DateFormat('hh:mm:ss').format(date);
}

enum _DateRange {
  today,
  yesterday,
  previousSevenDays,
  previousThirtyDays,
  thisMonth,
  previousMonth,
  custom
}

extension TextEditingControllerEx on TextEditingController {
  List<String>? splitDateRange() {
    if (this.text.isEmpty) {
      return null;
    }
    final listDates = this.text.split(" - ");
    if (listDates.length == 2) return listDates;
    return null;
  }
}

class DateRangeDropDown extends StatefulWidget {
  final DateTimeRange? currentDateRange;
  final TextEditingController dateRangeController;
  const DateRangeDropDown({super.key, this.currentDateRange, required this.dateRangeController});

  @override
  State<DateRangeDropDown> createState() => _DateRangeDropDownState();
}

class _DateRangeDropDownState extends State<DateRangeDropDown> {
  late DateTimeRange _dateRange;
  TextEditingController get _dateRangeController => widget.dateRangeController;
  late final _initDateRange;

  _DateRange? dropDownValue;

  String get _getDateRangeString =>
      DateFormatter.ddMMyyyy(_dateRange.start) + " - " + DateFormatter.ddMMyyyy(_dateRange.end);

  @override
  void initState() {
    super.initState();
    _initDateRange = widget.currentDateRange ?? DateTime.now();
    _dateRange = DateTimeRange(
        start: DateTime(_initDateRange.year, _initDateRange.month - 1, _initDateRange.day),
        end: _initDateRange);
    _dateRangeController.text = _getDateRangeString;
  }

  @override
  Widget build(BuildContext context) {
    return dropdownButton<_DateRange>(
      context: context,
      hintText: dropDownValue != null ? dropDownValue.toString() : "--- Chọn thời điểm bắt đầu ---",
      value: dropDownValue,
      listTitle: [
        "Hôm nay",
        "Hôm qua",
        "7 ngày trước",
        "30 ngày trước",
        "Tháng này",
        "Tháng trước",
        "Tùy chỉnh",
      ],
      listSelectedTitleBuilder: [
        "Hôm nay",
        "Hôm qua",
        "7 ngày trước",
        "30 ngày trước",
        "Tháng này",
        "Tháng trước",
        _getDateRangeString,
      ],
      listValue: _DateRange.values,
      onChanged: _onDateDropdownSelected,
    );
  }

  void _onDateDropdownSelected(range) {
    switch (range) {
      case _DateRange.today:
        return _updateDateRange(DateTimeRange(
            start: DateTime(_initDateRange.year, _initDateRange.month, _initDateRange.day, 0),
            end: _initDateRange));
      case _DateRange.yesterday:
        return _updateDateRange(DateTimeRange(
            start: DateTime(_initDateRange.year, _initDateRange.month, _initDateRange.day - 1, 0),
            end: _initDateRange));
      case _DateRange.previousSevenDays:
        return _updateDateRange(DateTimeRange(
            start: DateTime(_initDateRange.year, _initDateRange.month, _initDateRange.day - 7, 0),
            end: _initDateRange));
      case _DateRange.previousThirtyDays:
        return _updateDateRange(DateTimeRange(
            start: DateTime(_initDateRange.year, _initDateRange.month, _initDateRange.day - 30, 0),
            end: _initDateRange));
      case _DateRange.thisMonth:
        return _updateDateRange(DateTimeRange(
            start: DateTime(_initDateRange.year, _initDateRange.month, 1, 0), end: _initDateRange));
      case _DateRange.previousMonth:
        final numberOfDaysInPrevMonth =
            DateTime(_initDateRange.year, _initDateRange.month - 1, 0).day;
        _updateDateRange(DateTimeRange(
            start: DateTime(_initDateRange.year, _initDateRange.month - 1, 1, 0),
            end: DateTime(_initDateRange.year, _initDateRange.month - 1, numberOfDaysInPrevMonth,
                23, 59, 59)));
        return;
      case _DateRange.custom:
        _selectDates();
        return;
      default:
        _selectDates();
    }
  }

  Future<void> _selectDates() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: _dateRange,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(),
          ),
          child: child!,
        );
      },
    );
    if (newDateRange != null) {
      _updateDateRange(newDateRange);
    }
  }

  void _updateDateRange(DateTimeRange newDateRange) {
    _dateRange = newDateRange;
    _dateRangeController.text = _getDateRangeString;
    setState(() {});
  }
}
