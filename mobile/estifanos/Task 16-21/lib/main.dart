import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'Features/todo/Presentation/bloc/home/home_bloc.dart';
import 'Features/todo/Presentation/pages/Search_product.dart';
import 'Features/todo/Presentation/pages/getStartedPage.dart';
import 'Features/todo/Presentation/pages/home.dart';
import 'Features/todo/Presentation/pages/splashScreen.dart';
import 'HomeChat.dart';
import 'authentication/Features/todo/Presentation/bloc/Auth/auth_bloc.dart';
import 'dependency_injection.dart'; // Import the service locator file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // Initialize the service locator

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => sl.get<AuthBloc>(),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => sl.get<HomeBloc>()..add(StarterEvent()),
          ),
        ],

      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/second': (context) => const GetStartedPage(),
          '/third': (context) => const Home(),
          '/fourth': (context) => const SearchApp(),
        },

        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
