import 'package:flutter/material.dart';

class RowOverflowCountComputationWidget extends StatefulWidget {
  final List<String> labels;
  final TextStyle labelTextStyle;
  final EdgeInsets? labelPadding;
  final EdgeInsets? labelMargin;
  final BoxDecoration? labelDecoration;
  final EdgeInsets? overflowPadding;
  final EdgeInsets? overflowMargin;
  final BoxDecoration? overflowDecoration;
  final TextStyle overflowTextStyle;
  final double width;
  final String Function(int count)? overflowTextBuilder;
  final Function(String)? labelClickListener;
  final Function()? overflowClickListener;

  const RowOverflowCountComputationWidget({
    Key? key,
    required this.width,
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
  State<RowOverflowCountComputationWidget> createState() =>
      _RowOverflowCountComputationWidgetState();
}

class _RowOverflowCountComputationWidgetState
    extends State<RowOverflowCountComputationWidget> {
  double overflowTextWidth = 0;
  double maxWidth = 0;
  int numberOfCommunitiesToShowInRow = 0;
  List<Widget> rowItems = [];

  Size calcTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
    )..layout();
    return textPainter.size;
  }

  @override
  void didUpdateWidget(RowOverflowCountComputationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.width != widget.width ||
        oldWidget.labels != widget.labels ||
        oldWidget.labelDecoration != widget.labelDecoration ||
        oldWidget.labelPadding != widget.labelPadding ||
        oldWidget.labelMargin != widget.labelMargin ||
        oldWidget.labelTextStyle != widget.labelTextStyle ||
        oldWidget.overflowDecoration != widget.overflowDecoration ||
        oldWidget.overflowPadding != widget.overflowPadding ||
        oldWidget.overflowMargin != widget.overflowMargin) {
      computeRowItems();
    }
  }

  void computeRowItems() {
    String moreText = widget.overflowTextBuilder != null
        ? widget.overflowTextBuilder!(widget.labels.length)
        : '+${widget.labels.length}';
    overflowTextWidth = calcTextSize(
          moreText,
          widget.overflowTextStyle,
        ).width +
        (widget.overflowPadding != null
            ? widget.overflowPadding!.horizontal
            : 0) +
        (widget.overflowMargin != null ? widget.overflowMargin!.horizontal : 0);

    maxWidth = widget.width - overflowTextWidth;
    rowItems.clear();

    double currentWidth = 0;
    for (var i = 0; i < widget.labels.length; i++) {
      double localWidth = currentWidth +
          calcTextSize(
            widget.labels[i],
            widget.labelTextStyle,
          ).width +
          (widget.labelPadding != null ? widget.labelPadding!.horizontal : 0) +
          (widget.labelMargin != null ? widget.labelMargin!.horizontal : 0);
      if (localWidth <= maxWidth) {
        currentWidth = localWidth;
        rowItems.add(
          InkWell(
            onTap: (widget.labelClickListener != null)
                ? () {
                    widget.labelClickListener!(widget.labels[i]);
                  }
                : null,
            child: Container(
              margin: widget.labelMargin,
              padding: widget.labelPadding,
              decoration: widget.labelDecoration,
              child: Text(
                widget.labels[i],
                style: widget.labelTextStyle,
              ),
            ),
          ),
        );
      } else {
        numberOfCommunitiesToShowInRow = i;
        rowItems.add(
          InkWell(
            onTap: (widget.overflowClickListener != null)
                ? () {
                    widget.overflowClickListener!();
                  }
                : null,
            child: Container(
              margin: widget.overflowMargin,
              padding: widget.overflowPadding,
              decoration: widget.overflowDecoration,
              child: Text(
                widget.labels.length - i > 1
                    ? widget.overflowTextBuilder != null
                        ? widget.overflowTextBuilder!(widget.labels.length - i)
                        : '+${widget.labels.length - i}'
                    : "",
                style: widget.overflowTextStyle,
              ),
            ),
          ),
        );
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Row(
        children: rowItems,
      ),
    );
  }
}
