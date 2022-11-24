import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_sample/db/functions/db_functions.dart';
import 'package:hive_sample/db/models/data_model.dart';

import 'package:hive_sample/screen/screen_main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(
      StudentModelAdapter(),
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: ScreenMain(),
    );
  }
}
