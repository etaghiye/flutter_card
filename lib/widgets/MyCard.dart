import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final double? minHeight;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? contentPadding;
  final String text;
  final Color? circleColor;
  final Image? image;

  const MyCard({
    super.key,
    this.minHeight,
    this.padding,
    this.backgroundColor,
    this.foregroundColor,
    this.contentPadding,
    required this.text,
    this.circleColor,
    this.image,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    double minHeight = 60;
    double height = widget.minHeight ?? minHeight;
    var cardPadding = widget.padding ??
        const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10);
    double circleRadius = height - cardPadding.top - cardPadding.bottom;

    return Stack(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: height),
          child: Container(
            padding: widget.padding ??
                const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
            color: widget.backgroundColor ?? Colors.white,
            child: Container(
              color: widget.foregroundColor ?? Colors.grey,
              padding: widget.contentPadding,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.text,
                              overflow: TextOverflow.visible,
                            ),
                          ),
                          SizedBox(
                            width: circleRadius,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    right: -(circleRadius),
                    top: -circleRadius / 2,
                    child: Container(
                      height: circleRadius * 2,
                      width: circleRadius * 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(circleRadius),
                        color: widget.circleColor ?? Colors.red,
                      ),
                      child: widget.image != null
                          ? ClipOval(
                              child: widget.image,
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
