import 'package:flutter/material.dart';

class  LayoutSamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: <Widget>[
        Row(
           mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>
      [
      Icon(Icons.star,color: Colors.red,),
      Icon(Icons.star,color: Colors.red),
      Icon(Icons.star,color: Colors.red),
      Icon(Icons.star,color: Colors.red),
      Text("120 Reviews")
      ],
      )
      ],
    );
  }


  
}
