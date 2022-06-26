library row_overflow_count;

import 'package:flutter/material.dart';
import 'row_overflow_count_computation_widget.dart';

class RowOverflowCount extends StatelessWidget {
  final List<String> labels;
  final TextStyle labelTextStyle;
  final EdgeInsets? labelPadding;
  final EdgeInsets? labelMargin;
  final BoxDecoration? labelDecoration;
  final EdgeInsets? overflowPadding;
  final EdgeInsets? overflowMargin;
  final BoxDecoration? overflowDecoration;
  final TextStyle overflowTextStyle;
  final String Function(int count)? overflowTextBuilder;
  final void Function(String lable)? labelClickListener;
  final void Function()? overflowClickListener;

  const RowOverflowCount({
    Key? key,
    required this.labels,
    required this.labelTextStyle,
    this.labelPadding,
    this.labelMargin,
    this.labelDecoration,
    required this.overflowTextStyle,
    this.overflowPadding,
    this.overflowMargin,
    this.overflowDecoration,
    this.overflowTextBuilder,
    this.labelClickListener,
    this.overflowClickListener,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => RowOverflowCountComputationWidget(
        key: key,
        width: constraints.maxWidth,
        labels: labels,
        labelTextStyle: labelTextStyle,
        labelPadding: labelPadding,
        labelMargin: labelMargin,
        labelDecoration: labelDecoration,
        labelClickListener: labelClickListener,
        overflowTextStyle: overflowTextStyle,
        overflowPadding: overflowPadding,
        overflowMargin: overflowMargin,
        overflowDecoration: overflowDecoration,
        overflowTextBuilder: overflowTextBuilder,
        overflowClickListener: overflowClickListener,
      ),
    );
  }
}
