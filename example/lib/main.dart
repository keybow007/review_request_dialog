import 'package:flutter/material.dart';
import 'package:review_request_dialog/review_request_dialog.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //TODO ローカライズ設定必要
      localizationsDelegates: const [
        // Add the localization delegate of your package
        ReviewRequestLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      //TODO ローカライズ設定必要
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        //brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Review Request Dialog Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showReviewRequestDialog(
          context: context,
          iOSAppStoreId: "6730112960",
          //isIncrement: false,
          //launchCountIntervals: 5
        ),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
