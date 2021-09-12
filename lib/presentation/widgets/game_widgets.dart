import 'package:flutter/material.dart';

/// Abstract game card
@immutable
abstract class GameCard extends StatelessWidget {
  final int index;

  GameCard(this.index);
}

/// O widget representation
class OGameCard extends GameCard {
  OGameCard(int index) : super(index);

  @override
  Widget build(BuildContext context) {
    return _buildGameCardWidget(context, 'O');
  }
}

/// X representation
class XGameCard extends GameCard {
  XGameCard(int index) : super(index);

  @override
  Widget build(BuildContext context) {
    return _buildGameCardWidget(context, 'X');
  }
}

/// Blank card
class BlankGameCard extends GameCard {
  final VoidCallback onTapCallbackMethod;

  BlankGameCard(int index, this.onTapCallbackMethod) : super(index);

  @override
  Widget build(BuildContext context) {
    return _buildGameCardWidget(context, '', onTapCallbackMethod);
  }
}

_buildGameCardWidget(BuildContext context, String text, [GestureTapCallback? onTapMethod]) {
  return GestureDetector(
      onTap: onTapMethod ?? () => {},
      child: Card(
        color: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(),
        child: Text(text),
      ));
}
