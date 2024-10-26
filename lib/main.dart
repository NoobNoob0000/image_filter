import 'package:flutter/material.dart';
import 'package:image_filter/core/index.dart';
import 'package:image_filter/state/filter_state_controller.dart';
import 'package:image_filter/ui/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(
    FilterStateContainer(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme(),
        home: const Home(),
      ),
    ),
  );
}
