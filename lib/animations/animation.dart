import 'package:flutter/material.dart';

class AnimationContainer extends StatefulWidget {
  const AnimationContainer({super.key});

  @override
  State<AnimationContainer> createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer>
    with TickerProviderStateMixin {
  late AnimationController _colorAnimationController;
  late Animation _colorAnimation;
  late AnimationController _sizeAnimationController;
  late Animation _sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    _colorAnimation = ColorTween(begin: Colors.blue, end: Colors.pink)
        .animate(_colorAnimationController);
    _colorAnimationController
      ..forward()
      ..repeat(reverse: true);
    _sizeAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 20));
    _sizeAnimation =
        Tween<double>(begin: 0, end: 100).animate(_sizeAnimationController);
    _sizeAnimationController
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated container'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge(
              [_colorAnimationController, _sizeAnimationController]),
          builder: (context, child) => Container(
            color: _colorAnimation.value,
            width: _sizeAnimation.value,
            height: _sizeAnimation.value,
            /*width: _animation.value,
            height: _animation.value,*/
          ),
        ),
      ),
    );
  }
}
