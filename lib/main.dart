import 'package:amc_applicaition/bloc/cinema_bloc/bloc/cinema_bloc.dart';
import 'package:amc_applicaition/bloc/movie_bloc/movie_bloc.dart';
import 'package:amc_applicaition/bloc/nav_bloc/navigation_bloc.dart';
import 'package:amc_applicaition/constant/colors.dart';
import 'package:amc_applicaition/pages/bottom_nav_bar.dart';
import 'package:amc_applicaition/pages/home_page.dart';
import 'package:amc_applicaition/service/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => MovieBloc(),
        ),
        BlocProvider(
          create: (context) => CinemaBloc(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: whiteColor,
                  displayColor: whiteColor,
                ),
          ),
          debugShowCheckedModeBanner: false,
          home: const BottomNavBar()),
    );
  }
}
