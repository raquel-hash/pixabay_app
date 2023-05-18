import 'package:flutter/material.dart';
import 'package:pixabay_app/presentation/providers/pixabay_provider.dart';
import 'package:pixabay_app/presentation/screens/home_page.dart';
import 'package:provider/provider.dart';

import 'config/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PixabayProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
        },
        theme: ThemeApp().theme(),
      ),
    );
  }
}
