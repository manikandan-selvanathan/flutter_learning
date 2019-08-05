import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListViewSample extends StatefulWidget {
  @override
  _ListViewSampleState createState() => _ListViewSampleState();
}

class _ListViewSampleState extends State<ListViewSample> {
  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: createListView(context),

    );
  }

  Widget createListView(BuildContext context) {
    final listview = ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return Divider();
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(20));
      }
      return _buildRow(_suggestions[index]);
    });
    return listview;
  }

  Widget _buildRow(WordPair suggestion) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
                        Expanded
                        (
                          flex: 2,
                          child:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipOval(
                                child: Image.network(
                                  'https://cdn.hasselblad.com/c81e7ee74fdc106a965f51b35c8dd87503a16f0e_tom-oldham-h6d-50c-sample1.jpg',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fill,
                                )
                            ),
                          )
                        ),
                        Expanded
                        (
                          flex: 8,
                          child: Text(suggestion.asPascalCase, style: TextStyle(fontSize: 20,color: Colors.black),
                          ),
                        )
    ],
    );

    }


}
