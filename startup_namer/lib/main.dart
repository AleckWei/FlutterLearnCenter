import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
      // title: '这个title好像看不到',
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Hello World！'),
      //   ),
      //   body: Center(
      //     // child: Text('Hello World!'),
      //     // child: Text(wordPair.asPascalCase),//  PascalCase：驼峰样例，第一个字母大写
      //     child: RandomWords(),
      //   ),
      // ),
      title: '名字生成器', // 这个title的优先级好像没有Scaffold渲染的title的高
      theme: new ThemeData(
        primaryColor: Colors.deepOrangeAccent,
      ),
      home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildSuggetions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);

    // 在下面的写法当中，_RandomWordsState的构造方法会从
    // 简单的随机生成一个英文单词，变成构造一个ListView，然后在
    // ListView里面做一个随机单词的生成
    void _pushSaved(){
      Navigator.of(context).push(
        new MaterialPageRoute<void>(
            builder: (BuildContext context){
              final Iterable<ListTile> tiles = _saved.map(
                  (WordPair pair){
                    return new ListTile(
                      title: new Text(
                        pair.asPascalCase,
                        style: _biggerFont,
                      ),
                    );
                  },
              );
              final List<Widget> divided = ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
              )
              .toList();

              return new Scaffold(
                appBar: new AppBar(
                  title: const Text('收藏的词'),
                ),
                body: new ListView(children: divided),
              );
            },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('名字生成器'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)
        ]
      ),
      body: _buildSuggetions(),
    );


  }
}
