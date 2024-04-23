import 'package:flutter/material.dart';
import 'package:nymble_pet_adoption/Theme/Theme_dark.dart';
import 'package:nymble_pet_adoption/Theme/Theme_light.dart';
import 'package:nymble_pet_adoption/components/Navigation.dart';
import 'package:nymble_pet_adoption/provider/provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeControl>(
          create: (context) => ThemeControl(),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Provider.of<ThemeControl>(context).value
                  ? themelight
                  : themedark,
              home: const Navigation(),
            );
          },
        )
      ],
    );
  }
}
