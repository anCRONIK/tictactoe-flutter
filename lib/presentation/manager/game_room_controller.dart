import 'dart:async';

import 'package:get/get.dart';

import '../widgets/game_widgets.dart';

class GameRoomController extends GetxController {
  int turn = 0;

  Rx<_Player> currentPlayer = _Player.X.obs;

  late RxList<GameCard> gameCards;

  bool _isGameFinished = false;

  final int x = 3;
  final int y = 3;

  @override
  void onInit() {
    super.onInit();
    gameCards = RxList.generate(9, (index) => _initBlankCard(index));
  }

  GameCard _initBlankCard(int index) {
    return BlankGameCard(index, () {
      if (!_isGameFinished) {
        gameCards.value[index] = currentPlayer.value == _Player.X ? XGameCard(index) : OGameCard(index);
        _nextTurn();
      }
    });
  }

  void _nextTurn() {
    if (_isThereAWinner()) {
      _showWinner();
      _gameFinished();
    }
    currentPlayer.value = currentPlayer.value == _Player.X ? _Player.O : _Player.X;
    ++turn;
    if (turn >= x * y) {
      _noMoreTurns();
    }
  }

  void _noMoreTurns() {
    if (_isThereAWinner()) {
      _showWinner();
      _gameFinished();
      return;
    }
    Get.showSnackbar(GetBar(title: 'Game finished', message: "It's a draw"));
    _gameFinished();
  }

  _showWinner() {
    Get.showSnackbar(GetBar(title: 'Game finished', message: 'Winner is ${currentPlayer.value}'));
  }

  bool _isThereAWinner() {
    final g = gameCards.value;
    return (g[0].runtimeType == g[1].runtimeType && g[0].runtimeType == g[2].runtimeType && g[0].runtimeType != BlankGameCard) ||
        (g[0].runtimeType == g[4].runtimeType && g[0].runtimeType == g[8].runtimeType && g[0].runtimeType != BlankGameCard) ||
        (g[0].runtimeType == g[3].runtimeType && g[0].runtimeType == g[6].runtimeType && g[0].runtimeType != BlankGameCard) ||
        (g[1].runtimeType == g[4].runtimeType && g[1].runtimeType == g[7].runtimeType && g[1].runtimeType != BlankGameCard) ||
        (g[2].runtimeType == g[5].runtimeType && g[2].runtimeType == g[8].runtimeType && g[2].runtimeType != BlankGameCard) ||
        (g[3].runtimeType == g[4].runtimeType && g[3].runtimeType == g[5].runtimeType && g[3].runtimeType != BlankGameCard) ||
        (g[6].runtimeType == g[7].runtimeType && g[6].runtimeType == g[8].runtimeType && g[6].runtimeType != BlankGameCard);
  }

  void _gameFinished() {
    _isGameFinished = true;
    Timer(const Duration(seconds: 3), () => Get.back(closeOverlays: true));
  }
}

enum _Player { X, O }
