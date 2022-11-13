library shimmer_pro;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

enum ShimmerProLight { lighter, darker }

class ShimmerPro extends StatefulWidget {
  final Duration duration;
  int depth;
  int? maxLine;
  double? textSize;
  double? borderRadius;
  double? width;
  double? height;
  bool isText = false;
  bool isSized = false;
  bool isGenerated = false;
  Widget? child;
  Alignment? alignment;
  ShimmerProLight? light;

  ShimmerPro.sized({
    super.key,
    this.depth = 20,
    this.duration = const Duration(seconds: 1),
    this.borderRadius = 10,
    this.alignment = Alignment.center,
    this.light = ShimmerProLight.lighter,
    required this.height,
    required this.width,
  }) {
    isSized = true;
  }

  ShimmerPro.text(
      {super.key,
      this.depth = 20,
      this.duration = const Duration(seconds: 1),
      this.maxLine = 3,
      this.textSize = 14,
      this.borderRadius = 10,
      this.alignment = Alignment.center,
      this.light = ShimmerProLight.lighter,
      this.width}) {
    isText = true;
  }

  ShimmerPro.generated(
      {super.key,
      this.depth = 20,
      this.duration = const Duration(seconds: 1),
      this.borderRadius = 10,
      this.alignment = Alignment.center,
      this.light = ShimmerProLight.lighter,
      this.width,
      this.height,
      required this.child}) {
    isGenerated = true;
  }

  @override
  State<ShimmerPro> createState() => _ShimmerProState();
}

class _ShimmerProState extends State<ShimmerPro> {
  late Timer _timer;

  int _colorInt = 5;
  late final Brightness _brightness;
  bool _isStart = true;

  @override
  void initState() {
    _brightness = widget.light == ShimmerProLight.lighter
        ? Brightness.light
        : Brightness.dark;

    _colorInt = _brightness == Brightness.dark
        ? 5
        : (_brightness == Brightness.light
            ? -50
            : (_brightness == Brightness.dark ? 5 : -50));
    // _brightness == Brightness.light ? widget.depth = widget.depth + 10 : null;
    print(widget.depth);

    onReady();
    log(name: "BatuShimmer", '\x1B[32mInitialized\x1B[0m');

    super.initState();
  }

  onReady() async {
    await Future.delayed(const Duration(microseconds: 1));
    setState(() {
      if (_isStart) {
        _colorInt = _colorInt + widget.depth;
      } else {
        _colorInt = _colorInt - widget.depth;
      }
    });
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        if (_isStart) {
          _colorInt = _colorInt - widget.depth;
        } else {
          _colorInt = _colorInt + widget.depth;
        }
        _isStart = !_isStart;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    if (_timer.isActive) {
      _timer.cancel();
    }
    log(name: "BatuShimmer", '\x1B[32mDeleted\x1B[0m');
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor = Theme.of(context).scaffoldBackgroundColor;

    int textWDepth = _brightness == Brightness.dark ? 10 : -10;
    final Color textAndGeneratedWColor = Color.fromARGB(
        bgColor.alpha,
        bgColor.red + textWDepth,
        bgColor.green + textWDepth,
        bgColor.blue + textWDepth);
    final Color textWColorTextAndSize = Color.fromARGB(
        bgColor.alpha,
        bgColor.red + _colorInt + 10,
        bgColor.green + _colorInt + 10,
        bgColor.blue + _colorInt + 10);

    if (widget.isGenerated) {
      return Align(
        alignment: widget.alignment!,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius!),
            color: textAndGeneratedWColor,
          ),
          duration: widget.duration,
          margin: const EdgeInsets.all(10),
          width: widget.width,
          height: widget.height,
          child: widget.child,
        ),
      );
    } else if (widget.isSized) {
      return Align(
        alignment: widget.alignment!,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius!),
            color: textWColorTextAndSize,
          ),
          duration: widget.duration,
          //TODO -20 değeri uygulamanın paddingi olacak
          margin: const EdgeInsets.all(10),
          height: widget.height,

          width: widget.width,
        ),
      );
    } else {
      return Align(
        alignment: widget.alignment!,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius!),
            color: textAndGeneratedWColor,
          ),
          duration: widget.duration,
          height: (widget.maxLine! * (widget.textSize! + 10) + 10),
          //TODO -20 değeri uygulamanın paddingi olacak
          width: widget.width ?? context.size!.width - 20,
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
                widget.maxLine!,
                (index) => AnimatedContainer(
                      duration: widget.duration,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius!),
                        color: textWColorTextAndSize,
                      ),
                      margin: const EdgeInsets.only(
                          right: 10, left: 10, bottom: 5, top: 5),
                      height: widget.textSize,
                      width: (widget.maxLine! - 1) == index
                          ? (widget.maxLine != 1
                              ? (widget.width ?? context.size!.width) / 3
                              : null)
                          : null,
                    ))
              ..insert(
                  0,
                  const SizedBox(
                    height: 5,
                  ))
              ..add(const SizedBox(
                height: 5,
              )),
          ),
        ),
      );
    }
  }
}
