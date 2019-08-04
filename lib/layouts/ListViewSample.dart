import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewSample extends StatefulWidget {
  @override
  _ListViewSampleState createState() => _ListViewSampleState();
}

class _ListViewSampleState extends State<ListViewSample> {
  final _suggestions = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView sample")),
        body: createListView(context),
    );
  }
  Widget createListView(BuildContext context)
  {
    final listview=ListView.builder(itemBuilder: (context,i )
    {
      if(i.isOdd) return Divider();
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(20));
      }
      return _buildRow(_suggestions[index]);
    });
    return listview;
  }

  Widget _buildRow(WordPair suggestion) {
    return new ListTile(
      title: new Text(suggestion.asPascalCase, style: TextStyle(fontSize: 20)),
    );
  }
}
