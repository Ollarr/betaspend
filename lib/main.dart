import 'package:flutter/material.dart';
import 'package:betaspend/widgets/expenses_screen.dart';
// import 'package:flutter/services.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(199, 9, 83, 87));

var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(197, 10, 202, 186),
    brightness: Brightness.dark);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // // This is done to lock the screen to portrait as the preffered orientation
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) {
  //   runApp(MaterialApp(
  //     darkTheme: ThemeData.dark().copyWith(
  //       useMaterial3: true,
  //       colorScheme: kDarkColorScheme,
  //       appBarTheme: const AppBarTheme().copyWith(
  //         backgroundColor: kColorScheme.onPrimaryContainer,
  //         foregroundColor: Colors.white60,
  //       ),
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //         style: ElevatedButton.styleFrom(
  //             backgroundColor: kDarkColorScheme.primaryContainer),
  //       ),
  //     ),
  //     theme: ThemeData().copyWith(
  //         useMaterial3: true,
  //         colorScheme: kColorScheme,
  //         appBarTheme: const AppBarTheme().copyWith(
  //           backgroundColor: kColorScheme.onPrimaryContainer,
  //           foregroundColor: kColorScheme.onSecondary,
  //         ),
  //         cardTheme: const CardTheme().copyWith(
  //           color: kColorScheme.secondaryContainer,
  //           margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
  //         ),
  //         elevatedButtonTheme: ElevatedButtonThemeData(
  //           style: ElevatedButton.styleFrom(
  //               // foregroundColor: kColorScheme.onSecondary,
  //               backgroundColor: kColorScheme.primaryContainer),
  //         ),
  //         textTheme: ThemeData().textTheme.copyWith(
  //             titleLarge: TextStyle(
  //                 color: kColorScheme.onTertiary,
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold))
  //         // scaffoldBackgroundColor: const Color.fromARGB(199, 9, 83, 87),
  //         ),
  //     // themeMode: ThemeMode.system, ...this is the default
  //     // themeMode: ThemeMode.dark,

  //     home: const Expenses(),
  //   ));
  // });
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: Colors.white60,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer),
      ),
    ),
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.onSecondary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              // foregroundColor: kColorScheme.onSecondary,
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                color: kColorScheme.onTertiary,
                fontSize: 18,
                fontWeight: FontWeight.bold))
        // scaffoldBackgroundColor: const Color.fromARGB(199, 9, 83, 87),
        ),
    // themeMode: ThemeMode.system, ...this is the default
    // themeMode: ThemeMode.dark,

    home: const Expenses(),
  ));
}
