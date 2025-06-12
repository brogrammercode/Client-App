import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:adapp/core/config/injection.dart';
import 'package:adapp/core/config/routes.dart';
import 'package:adapp/core/config/secrets.dart';
import 'package:adapp/core/config/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: AppSecrets.apiKey,
      authDomain: AppSecrets.authDomain,
      projectId: AppSecrets.projectId,
      storageBucket: AppSecrets.storageBucket,
      messagingSenderId: AppSecrets.messagingSenderId,
      appId: AppSecrets.appId,
    ),
  );
  await Injections.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.dark,
      darkTheme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
