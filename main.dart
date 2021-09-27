import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool firstPlayerTurn = true;
  List<String> _displayGrid = ['', '', '', '', '', '', '', '', ''];

  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Player X',
                      style: myTextStyle,
                    ),
                    Text(
                      'Player O',
                      style: myTextStyle,
                    )
                  ]),
            ),
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: Text(
                          _displayGrid[index],
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (firstPlayerTurn && _displayGrid[index] == '') {
        _displayGrid[index] = 'O';
      } else if (!firstPlayerTurn && _displayGrid[index] == '') {
        _displayGrid[index] = 'X';
      }

      firstPlayerTurn = !firstPlayerTurn;
      _checkWin();
    });
  }

  void _checkWin() {
    if (_displayGrid[0] == _displayGrid[1] &&
        _displayGrid[0] == _displayGrid[2] &&
        _displayGrid[0] != '') {
      _winnerDialouge(_displayGrid[0]);
    }

    if (_displayGrid[3] == _displayGrid[4] &&
        _displayGrid[3] == _displayGrid[5] &&
        _displayGrid[3] != '') {
      _winnerDialouge(_displayGrid[3]);
    }
    if (_displayGrid[6] == _displayGrid[7] &&
        _displayGrid[6] == _displayGrid[8] &&
        _displayGrid[6] != '') {
      _winnerDialouge(_displayGrid[6]);
    }
    if (_displayGrid[0] == _displayGrid[3] &&
        _displayGrid[0] == _displayGrid[6] &&
        _displayGrid[0] != '') {
      _winnerDialouge(_displayGrid[0]);
    }
    if (_displayGrid[1] == _displayGrid[4] &&
        _displayGrid[1] == _displayGrid[7] &&
        _displayGrid[1] != '') {
      _winnerDialouge(_displayGrid[1]);
    }
    if (_displayGrid[2] == _displayGrid[5] &&
        _displayGrid[2] == _displayGrid[8] &&
        _displayGrid[2] != '') {
      _winnerDialouge(_displayGrid[2]);
    }
    if (_displayGrid[6] == _displayGrid[4] &&
        _displayGrid[6] == _displayGrid[2] &&
        _displayGrid[6] != '') {
      _winnerDialouge(_displayGrid[6]);
    }
    if (_displayGrid[0] == _displayGrid[4] &&
        _displayGrid[0] == _displayGrid[8] &&
        _displayGrid[0] != '') {
      _winnerDialouge(_displayGrid[0]);
    }
  }

  void _winnerDialouge(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner is: ' + winner),
          );
        });
  }
}
