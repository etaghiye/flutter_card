import 'dart:math';

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
  final Offset? circleOffset;

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
    this.circleOffset,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final GlobalKey _containerKey = GlobalKey();
  double _containerHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_getContainerHeight);
  }

  void _getContainerHeight(_) {
    final RenderBox renderBox =
        _containerKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    setState(() {
      _containerHeight = size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    double minDefaultHeight = 60;
    double minHeight = max(widget.minHeight ?? 0, minDefaultHeight);
    var cardPadding = widget.padding ??
        const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10);

    var containerHeight = max(minHeight, _containerHeight);
    double circleRadius =
        containerHeight - cardPadding.top - cardPadding.bottom;

    return Stack(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: minHeight),
          child: Container(
            key: _containerKey,
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
                            width:
                                circleRadius - (widget.circleOffset?.dx ?? 0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    right: -(circleRadius) - (widget.circleOffset?.dx ?? 0),
                    top: -circleRadius / 2 - (widget.circleOffset?.dy ?? 0),
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
