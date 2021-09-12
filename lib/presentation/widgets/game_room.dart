import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../manager/game_room_controller.dart';

/// Widget which creates basic game room to be used accross application.
class GameRoom extends GetView<GameRoomController> {
  const GameRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            color: Theme.of(context).primaryColor,
            child: ObxValue(
                (player) => Column(
                      children: [
                        Text('Turn: $player', style: TextStyle(color: Theme.of(context).backgroundColor)),
                        ObxValue(
                            (_gameCards) => GridView.count(
                                crossAxisCount: controller.x,
                                //FIXME padding
                                padding: const EdgeInsets.all(20),
                                //FIXME spacing
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                shrinkWrap: true,
                                children: _gameCards as List<Widget>),
                            controller.gameCards)
                      ],
                    ),
                controller.currentPlayer)));
  }
}
