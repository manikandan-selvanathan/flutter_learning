import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class StartAndEnd extends CustomPainter {
  String start,end;
  StartAndEnd({String start,String end})
  {
    this.start=start;
    this.end=end;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(0, 10);
    final p2 = Offset(0, 90);
    canvas.drawLine(p1, p2, getPaint(Colors.black,2));
    getText(start,size).paint(canvas,Offset(12, 5));
    getText(end,size).paint(canvas,Offset(12, 85));
    canvas.drawCircle(p1, 6, getPaint(Colors.green,2));
    canvas.drawCircle(p2, 6, getPaint(Colors.red,2));                                  
  }
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }

TextPainter getText(String message,Size size)
{
   final textStyle = TextStyle(
    color: Colors.black,
    fontSize: 10,
  );
  final textSpan = TextSpan(
    text: message,
    style: textStyle,
  );
  final textPainter = TextPainter(
    text: textSpan,
    textDirection: TextDirection.ltr,
  );
  textPainter.layout(
    minWidth: 0,
    maxWidth:  size.width
  );
  return textPainter;
}
  Paint getPaint(Color color,double size)
  {
    final paint = Paint()
    ..color = color
    ..isAntiAlias=true
    ..strokeWidth = size;
  
    return paint;
  }
}
