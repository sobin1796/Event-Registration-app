import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:registration_app/view/Eventlist.dart';
import 'package:registration_app/view_model/notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegistrationProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => EventModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Eventlist(),
      ),
    );
  }
}
