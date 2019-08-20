import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPaintingSamplePage extends StatefulWidget {
  @override
  _CustomPaintingSamplePageState createState() => _CustomPaintingSamplePageState();
}

class _CustomPaintingSamplePageState extends State<CustomPaintingSamplePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child:Column( 
      children: <Widget>[
      Container(height:200,width:200,child:CustomPaint(foregroundPainter: StartAndEnd(start:"Chennai, India",end:"Sault Ste Marie, Canada"))),
      CustomPaint(foregroundPainter: new PathExample())
      ]));
  }
}


class PathExample extends CustomPainter
{
  double strokeWidth=5;
  @override
  void paint(Canvas canvas, Size size) {
    var paint=new Paint();
    paint.color=Colors.red;
    paint.strokeWidth=strokeWidth;
    paint.style=PaintingStyle.stroke;
    var path=new Path(); 
    path.lineTo(size.width,0); 
    path.lineTo(0,size.height);
    path.close();
    canvas.drawPath(path, paint);
    
    paint.color=Colors.green;
    paint.style=PaintingStyle.fill;
    canvas.drawCircle(new Offset(size.width/2,size.height/2),size.width/2, paint);
    //path.moveTo(x, y)
    //canvas.drawCircle(new Offset(size.height/2, size.width/2),size.height/3,paint);
    // var timer = Timer.periodic(Duration(seconds: 5), (t){
    //   paint.strokeWidth=strokeWidth;
    //   strokeWidth=strokeWidth+5;
    //   canvas.drawPaint(paint);
    //  //this.paint(canvas, size);
    // });
    //canvas.drawOval(Rect.fromCircle(center:new Offset(size.height/2, size.width/2),radius:size.height/2), paint);
  }



  @override
  bool shouldRepaint(CustomPainter oldDelegate) { 
    return false;
  }

}


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
