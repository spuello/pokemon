import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'injection_container.dart' as di;
import 'pokemon_app.dart';

void main() {
  di.init();
  _setupLogger();
  runApp(PokemonApp());
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
