import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:nestapp/login/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: SplashScreen(
        title: 'Welcome to Splash',
      ),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  void initState() {
    super.initState();
    print('init state');
  }

  @override
  Widget build(BuildContext context) {
    print('build widget');
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      // padding: EdgeInsets.all(12),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Divider(color: Color.fromARGB(255, 255, 0, 255));
        }
        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RandomWordsState();
  }
}
