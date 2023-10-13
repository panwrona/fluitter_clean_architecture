import 'package:alfred_interview/ui/cryptocurrency/list/bpi_list_state.dart';
import 'package:flutter/material.dart';

class BPIAnimatedText extends StatefulWidget {
  final CurrencyRateChange currencyRateChange;

  const BPIAnimatedText({
    super.key,
    required this.currencyRateChange,
  });

  @override
  State<BPIAnimatedText> createState() => _BPIAnimatedTextState();
}

class _BPIAnimatedTextState extends State<BPIAnimatedText>
    with SingleTickerProviderStateMixin {
  final Animatable<Color?> _lowerRateAnimation = TweenSequence<Color?>([
    TweenSequenceItem(
        tween: ColorTween(
          begin: Colors.black,
          end: Colors.red,
        ),
        weight: 1.0),
    TweenSequenceItem(
        tween: ColorTween(
          begin: Colors.red,
          end: Colors.black,
        ),
        weight: 1.0)
  ]);
  final Animatable<Color?> _higherRateAnimation = TweenSequence<Color?>([
    TweenSequenceItem(
        tween: ColorTween(
          begin: Colors.black,
          end: Colors.green,
        ),
        weight: 1.0),
    TweenSequenceItem(
        tween: ColorTween(
          begin: Colors.green,
          end: Colors.black,
        ),
        weight: 1.0)
  ]);
  late final AnimationController _controller;
  late Animation<Color?> _lowerAnim;
  late Animation<Color?> _higherAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _lowerAnim = _lowerRateAnimation.animate(_controller);
    _higherAnim = _higherRateAnimation.animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    _controller
      ..reset()
      ..forward();
    return AnimatedBuilder(
        animation: widget.currencyRateChange.isLower ? _lowerAnim : _higherAnim,
        builder: (context, _) {
          final color = widget.currencyRateChange.isLower
              ? _lowerAnim.value
              : _higherAnim.value;
          return Text(
            widget.currencyRateChange.current.rateFloat.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: color ?? Colors.black,
            ),
          );
        });
  }

  @override
  void dispose() {
    print('dispose');
    _controller.dispose();
    super.dispose();
  }
}
