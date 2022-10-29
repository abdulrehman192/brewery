import '/viewModel/viewModel.dart';
import 'package:firebase_core/firebase_core.dart';
import '/view/view.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
            ChangeNotifierProvider(create: (_) => SignupViewModel()),
            ChangeNotifierProvider(create: (_) => BreweryViewModel()),
          ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Brewery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const SignupView(),
      ),
    );
  }
}
