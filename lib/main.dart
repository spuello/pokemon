import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:pokemon/pokemon/presentation/screen/pokemon_list_screen.dart';

import 'app_router.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  _setupLogger();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: router.generateRoute,

    );
  }
}

void _setupLogger() {
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(
      (rec) {
        print('${rec.level.name}: ${rec.time}: ${rec.message}');
      },
    );
  }
}
