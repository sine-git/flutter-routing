import 'package:flutter/material.dart';

class GradientText extends StatefulWidget {
  const GradientText({super.key});

  @override
  State<GradientText> createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gradient text"),
      ),
      body: Center(
        child: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
                  //stops: [1, 2, 4],
                  colors: [Colors.pink, Colors.purple],
                  tileMode: TileMode.repeated)
              .createShader(bounds),
          child: Text(
            "Beautiful Text",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
