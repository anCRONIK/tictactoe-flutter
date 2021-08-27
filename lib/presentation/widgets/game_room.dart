import 'package:flutter/cupertino.dart';

import 'game_widgets.dart';

/// Widget which creates basic game room to be used accross application.
class GameRoom extends StatelessWidget {
  GameRoom({Key? key}) : super(key: key);

  final List<Widget> gameCards = [];

  final x = 3;
  final y = 3;

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < x * y; ++i) {
      gameCards[i] = const BlankGameCard();
    }

    return GridView.count(
      crossAxisCount: x,
      //FIXME padding
      padding: const EdgeInsets.all(20),
      //FIXME spacing
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: gameCards,
    );
  }
}
