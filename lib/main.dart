import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mybasket/bloc/comboBloc/combo_bloc.dart';
import 'package:mybasket/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybasket/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ComboBloc()..add(GetCombos(combos: const []))),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
