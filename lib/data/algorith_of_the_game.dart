import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

String movePlayer() {
  String selection = stdin.readLineSync()!.toUpperCase();
  String? playerSelection;

  switch (selection) {
    case "R":
      playerSelection = "Rock";
      break;
    case "P":
      playerSelection = "Paper";

      break;
    case "S":
      playerSelection = "Scissors";

      break;
    default:
      break;
  }
  return playerSelection!;
}

String moveComputer() {
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
    return "Tie";
  } else if (playerMove == "Rock" && computerMove == "Scissors") {
    return "You Win!";
  } else if (playerMove == "Scissors" && computerMove == "Paper") {
    return "You Win!";
  } else if (playerMove == "Paper" && computerMove == "Rock") {
    return "You Win!";
  } else {
    return "Computer Wins!";
  }
}

void main() {
  while (true) {
    String playerMove = movePlayer();

    if (playerMove == "Quit") {
      return;
    }
  }
}
