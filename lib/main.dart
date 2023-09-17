import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study_0915/repos/todo_repo.dart';
import 'package:flutter_study_0915/secondDetiall.dart';
import 'package:flutter_study_0915/subDetail.dart';
import 'package:flutter_study_0915/thirdDetail.dart';
import 'package:flutter_study_0915/view_models/todo_vm.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = ToDoRepository(preferences);

  runApp(ProviderScope(
      overrides: [todoProvider.overrideWith(() => ToDoViewModel(repository))],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => const SubDetail(),
        '/second': (context) => const SecondDetail(),
        '/third': (context) => const ThirdDetail(),
      },
    );
  }
}
