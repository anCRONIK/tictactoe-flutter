import 'package:flutter/widgets.dart';

import 'application_basic_layout.dart';

/// Class which every page in application should implement to provide easy layout building.
abstract class AbstractApplicationPage extends StatelessWidget {
  const AbstractApplicationPage({Key? key}) : super(key: key);

  /// Return layout for page in portrait mode
  Widget buildPortraitLayout(BuildContext context);

  /// Return layout for page in landscape mode
  Widget buildLandscapeLayout(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return ApplicationBasicLayout(context).addApplicationLayoutToThePage(this);
  }
}
