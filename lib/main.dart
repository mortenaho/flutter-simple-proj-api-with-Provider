 import 'package:apitest/providers/UserProvider.dart';
import 'package:apitest/providers/album_provider.dart';
import 'package:apitest/view/counter_view.dart';
import 'package:apitest/view/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/CounterProvider.dart';

void main() {
  runApp(
    /// providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AlbumProvider()),
      ],
      child: const MyApp(),
    ),
  );
}


 class MyApp extends StatelessWidget {

   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return   MaterialApp(
       debugShowCheckedModeBanner: false,
       home:HomeView(),
     );
   }
 }

