import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: SafeArea(child: Text('page.error.default_message'.tr)));
  }
}
