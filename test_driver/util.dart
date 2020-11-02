import 'package:flutter_driver_helper/flutter_driver_helper.dart';

TestAction step(
  String name,
  List<TestAction> actions,
) =>
    TestAction(
      () => runTestActions(actions),
      name: 'step "$name"',
    );
