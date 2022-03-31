import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];
  bool onTurn = true; //first player id o
  var myTextstyle = TextStyle(color: Colors.white, fontSize: 30);
  int ohscroe = 0;
  int exscore = 0;
  int filledbox = 0;

  // static var myNewfont = GoogleFonts.pressStart2p(
  //   textStyle: TextStyle(color: Colors.black, letterSpacing: 3),
  // );
  var myNewFontWhite = TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 15,
      fontFamily: 'PressStart2P');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player O',
                        style: myNewFontWhite,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        ohscroe.toString(),
                        style: myNewFontWhite,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player X',
                        style: myNewFontWhite,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        exscore.toString(),
                        style: myNewFontWhite,
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                          child: Text(
                            displayExOh[index],
                            // index.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'TIC TAC TOE',
                      style: myNewFontWhite,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '@CREATEDBYKINJAL',
                      style: myNewFontWhite,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (onTurn && displayExOh[index] == '') {
        displayExOh[index] = 'o';
        filledbox++;
      } else if (!onTurn && displayExOh[index] == '') {
        displayExOh[index] = 'x';
        filledbox++;
      }
      onTurn = !onTurn;
      _checkwinner();
    });
  }

  void _checkwinner() {
    //1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != "") {
      showWinDialog(displayExOh[0]);
    }
    //2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      showWinDialog(displayExOh[3]);
    }
    //3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      showWinDialog(displayExOh[6]);
    }
    //1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      showWinDialog((displayExOh[0]));
    }
    //2nd column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      showWinDialog(displayExOh[1]);
    }
    //3rd column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      showWinDialog(displayExOh[2]);
    }
    //diagonal 1
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      showWinDialog(displayExOh[6]);
    }
    //diagonal 2
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      showWinDialog(displayExOh[0]);
    } else if (filledbox == 9) {
      _shoeDrawDialog();
    }
  }

  showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER! IS: $winner'),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Text('Play Again!'))
            ],
          );
        });
    if (winner == 'o') {
      ohscroe++;
    } else if (winner == 'x') {
      exscore++;
    }
  }

  void _shoeDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('DRAW'),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Text('Play Again!'))
            ],
          );
        });
  }

  void _clearBoard() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });
    filledbox = 0;
  }
}
