import 'package:flutter/material.dart';

class ScoreScreen extends StatefulWidget {
  final int? playerWins;
  final int? computerWins;

  const ScoreScreen(this.playerWins, this.computerWins, {super.key});

  @override
  ScoreScreenState createState() {
    return ScoreScreenState();
  }
}

class ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Scoreboard",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[900]),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: const RoundedRectangleBorder(side: BorderSide()),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "${widget.playerWins} : ${widget.computerWins}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 60.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
