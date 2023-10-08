import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/screens/score_screen.dart';

import '../models/users_model.dart';

class GamePage extends StatefulWidget {
  final User user;

  const GamePage(this.user, {super.key});

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  String? playerSelection = "Nothing";
  String? gameResult = "Press any of these three buttons";
  String? computerSelection = "Nothing";
  int playerWins = 0;
  int computerWins = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _process(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              rockButton(context),
              paperButton(context),
              scissorsButton(context),
            ],
          )
        ],
      ),
    );
  }

  TextButton scoreBoard(BuildContext context) {
    return TextButton(
      child: const Text("Scoreboard"),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ScoreScreen(playerWins, computerWins)));
      },
    );
  }

  ElevatedButton scissorsButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          fixedSize: const Size(80, 80),
          padding: EdgeInsets.zero),
      onPressed: () {
        setState(() {
          computerSelection = computerMove();
          playerSelection = "Scissors";
          gameResult = whoWins("$playerSelection", "$computerSelection");
        });
        if (playerWins + computerWins == widget.user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreScreen(playerWins, computerWins)));
        }
      },
      child: const Image(
        image: AssetImage("assets/images/scissors.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  ElevatedButton paperButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          fixedSize: const Size(80, 80),
          padding: EdgeInsets.zero),
      onPressed: () {
        setState(() {
          computerSelection = computerMove();
          playerSelection = "Paper";
          gameResult = whoWins("$playerSelection", "$computerSelection");
        });
        if (playerWins + computerWins == widget.user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreScreen(playerWins, computerWins)));
        }
      },
      child: const Image(
        image: AssetImage("assets/images/paper.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  ElevatedButton rockButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          fixedSize: const Size(80, 80),
          padding: EdgeInsets.zero),
      onPressed: () {
        setState(() {
          computerSelection = computerMove();
          playerSelection = "Rock";
          gameResult = whoWins("$playerSelection", "$computerSelection");
        });
        if (playerWins + computerWins == widget.user.gameLength) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScoreScreen(playerWins, computerWins)));
        }
      },
      child: image("assets/images/rock.png"),
    );
  }

  Image image(String imageAddress) {
    return Image(
      image: AssetImage(imageAddress),
      fit: BoxFit.cover,
    );
  }

  String computerMove() {
    Random rand = Random();
    int move = rand.nextInt(3);
    String? computerSelection;

    switch (move) {
      case 0:
        debugPrint("Rock");
        computerSelection = "Rock";
        break;
      case 1:
        debugPrint("Paper");
        computerSelection = "Paper";
        break;
      case 2:
        debugPrint("Scissors");
        computerSelection = "Scissors";
        break;
      default:
        break;
    }
    return computerSelection!;
  }

  String whoWins(String playerMove, String computerMove) {
    if (playerMove == computerMove) {
      debugPrint("Tie");
      return "Tie";
    } else if (playerMove == "Rock" && computerMove == "Scissors") {
      debugPrint("You Win!");
      playerWins++;

      return "You Win!";
    } else if (playerMove == "Scissors" && computerMove == "Paper") {
      debugPrint("You Win!");
      playerWins++;

      return "You Win!";
    } else if (playerMove == "Paper" && computerMove == "Rock") {
      debugPrint("You Win!");
      playerWins++;

      return "You Win!";
    } else {
      debugPrint("Computer Wins!");
      computerWins++;
      return "Computer Wins!";
    }
  }

  String movePlayer(String? selection) {
    String? playerSelection;

    switch (selection) {
      case "R":
        debugPrint("Rock");
        playerSelection = "Rock";
        break;
      case "P":
        debugPrint("Paper");
        playerSelection = "Paper";

        break;
      case "S":
        debugPrint("Scissors");
        playerSelection = "Scissors";

        break;
      default:
        debugPrint("Quit");
        break;
    }
    return playerSelection!;
  }

  Column _process() {
    return Column(
      children: [
        const Text(
          "Computer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 14.0,
        ),
        _getImage(_images[computerSelection].toString()),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            "Game result: $gameResult",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        RotatedBox(
            quarterTurns: 2,
            child: _getImage(_images[playerSelection].toString())),
        Text(
          widget.user.username!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  final Map<String, String> _images = {
    "Rock": "assets/images/rock.png",
    "Paper": "assets/images/paper.png",
    "Scissors": "assets/images/scissors.png",
    "Nothing": "assets/images/main.png",
  };

  Image _getImage(String image) => Image.asset(
        image,
        height: 100,
        width: 100,
      );
}
