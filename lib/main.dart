import 'package:flutter/material.dart';
// import 'screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'providers/app_state_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/splash_screen.dart';
// import 'theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppStateProvider(),
      child: const IslamicStudyApp(),
    ),
  );
}

class IslamicStudyApp extends StatelessWidget {
  const IslamicStudyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<LocaleProvider>(context);
    final appState = Provider.of<AppStateProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Islamic Study App',
      
      // Theme Settings
      themeMode: appState.themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF081411),
        primaryColor: const Color(0xFF26A69A),
      ),

      // Language Settings
      locale: appState.locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('ur'),
        Locale('fr'),
        Locale('ms'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const SplashScreen(),
    );
  }
}
