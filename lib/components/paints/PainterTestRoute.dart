import 'package:flutter/material.dart';
import 'SignaturePainter.dart';

class PainterTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PainterTestState();
  }
}

class PainterTestState extends State<PainterTestRoute> {
  List<Offset> _points = <Offset>[];

  Widget build(BuildContext context) {
    return new GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        print("onPanUpdate");
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
              referenceBox.globalToLocal(details.globalPosition);
          _points = new List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: new CustomPaint(
        size: Size(400, 400),
          painter: new SignaturePainter(_points)
      ),
    );
  }
}
