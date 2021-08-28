import 'package:tictactoe/presentation/widgets/game_room.dart';

class GameController {
  _Player _currentPlayer = _Player.X;

  GameRoom _gameRoom = GameRoom();
}

enum _Player { X, O }
