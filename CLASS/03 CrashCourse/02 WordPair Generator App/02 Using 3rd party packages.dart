/* 
Just as we use 3rd party packages with react, we are going to use a 3rd party plugin too that randomly generates words and then we render this in a list

1.  go to https://pub.dev   ==> ds is the npm store of flutter
2.  Search for 'english_words' > click on it to view details > Click on the 'Installing' tab to view installation instructions...
3.  Open pubspec.yaml (Ds is ur package.json), add the new package
dependencies:
  flutter:
    sdk: flutter
  english_words: ^3.1.5
4.  If you are running flutter in debugger mode, this will run 'pub get' in the background to install else, you will need to run pub get manually
 */

//main.dart
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var count = 1;
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random(); //a variable dt takes d value of d return of a function
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple[900]),
  home: Scaffold(
    appBar: AppBar(
      title: Text('WordPair Generator'), 
    ),
    body: Center(child: Text(wordPair.asPascalCase),) // we render the generated word as pascal case
  ),
);
  }
}

//main.dart
import 'package:english_words/english_words.dart';
import 'package:english_words/english_words.dart' as randomWord;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),
        home: FlutterInfityList());
  }
}

/* class RandomWordClass extends StatefulWidget {
  @override
  _RandomWordClassState createState() => _RandomWordClassState();
}
 */
class FlutterInfityList extends StatelessWidget {
  final _randomWordPairs = <WordPair>[];
  Widget _buildList() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (content, index) {
        /* Our index starts at zero, and we want to return a divider btw our list items.. Our divider line sud starts from the bottom of the first item, so since our item starts with 0 index and zero is an even number, we then replace all odd index with a divided, this way, index 0 gets printed, index 1 will be printed as a divider line bcos 1 === odd, index 2 === even so it gets printed too, then after 2, index 3 is odd so 3 turns a divider line below 2 etc */
        if ((index).isOdd) {
          return Divider();
        }
        //If current index is even, use it to render an item
        else {
          /* We want to print index of our items on d left so we can see how many items are rendered but if we do ds, our index will be printed as 0,2,4,6,8 etc bcos the odd indexes are not a real item but a divider line, so to be able to print from 1 and with increment of 1 i.e. 1, 2, 3, 4, 5, we take the current real item index (inside ds else statement, we only have real items and not dividers so indexes that will be taken will be evens), divide it by 2, add 1 to the result and round it up to nearest integer, ds will give us perfect 1, 2, 3, 4 ....... till infinity */
          final i = (index / 2 + 1).round();
          /* We have a variable array defined as "_randomWordPairs", to this array, we generate 10 word pairs using the "randomWord.generateWordPairs().take(10)" and add it to the list  */
          _randomWordPairs.addAll(randomWord.generateWordPairs().take(10));
          return ListTile(
            leading: CircleAvatar(
              child: Text(i.toString()),
            ),
            title: Text(_randomWordPairs[index].asPascalCase),
            trailing: Text("$index"),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Infinity List'),
      ),
      body: _buildList(),
    );
  }
}
