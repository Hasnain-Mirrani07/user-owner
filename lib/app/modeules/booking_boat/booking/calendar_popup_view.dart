import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_calendar_view.dart';

class CalendarPopupView extends StatefulWidget {
  const CalendarPopupView(
      {Key? key,
      this.initialStartDate,
      this.initialEndDate,
      this.onApplyClick,
      this.barrierDismissible = true,
      this.minimumDate,
      this.maximumDate})
      : super(key: key);

  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final bool barrierDismissible;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;
  final Function(DateTime, DateTime)? onApplyClick;

  @override
  _CalendarPopupViewState createState() => _CalendarPopupViewState();
}

class _CalendarPopupViewState extends State<CalendarPopupView> with TickerProviderStateMixin {
  AnimationController? animationController;
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
    }
    animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            if (widget.barrierDismissible) {
              Navigator.pop(context);
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.grey.withOpacity(0.2), offset: const Offset(4, 4), blurRadius: 8.0),
                  ],
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[



                        ],
                      ),
                      const Divider(
                        height: 1,
                      ),
                      CustomCalendarView(
                        minimumDate: widget.minimumDate,
                        maximumDate: widget.maximumDate,
                        initialEndDate: widget.initialEndDate,
                        initialStartDate: widget.initialStartDate,
                        startEndDateChange: (DateTime startDateData, DateTime endDateData) {
                          setState(() {
                            startDate = startDateData;
                            endDate = endDateData;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
