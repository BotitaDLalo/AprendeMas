import 'package:flutter/material.dart';

class GroupSubjectWidgetOption {
  final int optionId;
  final bool isVisible;
  final String optionText;
  final Widget? widgetOption;

  GroupSubjectWidgetOption(
      {required this.optionId,
      required this.isVisible,
      required this.optionText,
      this.widgetOption});

  static List<GroupSubjectWidgetOption> getlsGroupSubjectOptions(
          List<GroupSubjectWidgetOption> lsGroupSubjectWidgetOptions) =>
      lsGroupSubjectWidgetOptions.where((e) => e.isVisible).map((e) {
        return GroupSubjectWidgetOption(
            optionId: e.optionId,
            isVisible: e.isVisible,
            optionText: e.optionText);
      }).toList();
}
