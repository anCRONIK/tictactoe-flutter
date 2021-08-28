import 'package:flutter/material.dart';

/// O widget representation
class OGameCard extends StatelessWidget {
  const OGameCard({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('O');
  }
}

/// X representation
class XGameCard extends StatelessWidget {
  const XGameCard({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('X');
  }
}

/// Blank card
class BlankGameCard extends StatelessWidget {
  const BlankGameCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildGameCardWidget(context);
  }
}

_buildGameCardWidget(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(),
    child: Text(''),
  );
}
