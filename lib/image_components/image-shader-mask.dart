import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide Uint8List;

class ImageShaderMask extends StatefulWidget {
  const ImageShaderMask({super.key});

  @override
  State<ImageShaderMask> createState() => _ImageShaderMaskState();
}

class _ImageShaderMaskState extends State<ImageShaderMask> {
  ui.Image? image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadImage("assets/images/traditional-women-yellow.jpeg");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image shader mask"),
      ),
      body: Center(
        child: image == null
            ? SizedBox.shrink(
                child: Text("Image is loading..."),
              )
            : ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => ImageShader(
                    image!,
                    TileMode.repeated,
                    TileMode.repeated,
                    Matrix4.identity().storage),
                child: Text(
                  "Beautiful Image",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
      ),
    );
  }

  Future<void> _loadImage(String imagePath) async {
    final ByteData byteData = await rootBundle.load(imagePath);
    final Uint8List list = byteData.buffer.asUint8List();
    final Completer<ui.Image> completer = Completer();

    ui.decodeImageFromList(
      list,
      (ui.Image uiImage) {
        completer.complete(uiImage);
      },
    );
    image = await completer.future;
    setState(() {
      image;
    });
    print("Image is loaded...");
  }
}
