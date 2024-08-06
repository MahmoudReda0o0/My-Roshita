import 'package:flutter/material.dart';
import 'package:my_roshita/controller/roshita_provider.dart';
import 'package:my_roshita/view/splaeh_screen.dart';
import 'package:provider/provider.dart';

import 'view/reshita/reshita_pdf_body.dart';

GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> get navigationKey => _navigationKey;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    RoshitaPdf.fontinit();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderRoshitaDetails())
      ],
      child: MaterialApp(
        navigatorKey: navigationKey,
        debugShowCheckedModeBanner: false,
        title: 'My Roshita',
        home: SplashScreen(),
      ),
    );
  }
}
