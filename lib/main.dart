import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_demo/themes/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primaryColor: Colors.red,
      //   textTheme: TextTheme(
      //     displayLarge: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      //     displayMedium: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),
      //   )
      //
      // ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final title;

  const MyHomePage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).primaryColor,

      ),
      body: Center(
        child: Stack(
          children: [
            Container(
                height: 300,
                width: 300,
                color: Theme.of(context).colorScheme.primary),
            Positioned(
              top: 50,
              left: 50,
              child: GestureDetector(
                onTap: (){
                  Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                },
                child: Container(
                  height: 200,
                  width: 200,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Center(child: Text('Press Me')),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
