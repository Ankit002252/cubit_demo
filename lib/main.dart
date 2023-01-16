import 'package:cubit_demo/cubits/internet_cubit.dart';
import 'package:cubit_demo/cubits/user_cubit.dart';
import 'package:cubit_demo/theme/app_theme.dart';
import 'package:cubit_demo/theme/theme_cubit.dart';
import 'package:cubit_demo/theme/theme_repository.dart';
import 'package:cubit_demo/theme/theme_state.dart';
import 'package:cubit_demo/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_repo.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeRepository = ThemeRepository(
    sharedPreferences: await SharedPreferences.getInstance(),
  );
  runApp(App(
    themeRepository: themeRepository,
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({required this.themeRepository, super.key});
//
//   final ThemeRepository themeRepository;
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => ThemeCubit(
//             themeRepository: context.read<ThemeRepository>(),
//           )..getCurrentTheme(),
//         ),
//         BlocProvider(
//           create: (context) => UserCubit(DataServices()),
//         ),
//         BlocProvider(create: (context) => InternetCubit()),
//       ],
//       child: BlocBuilder<ThemeCubit,  ThemeState>(builder: (context, state) {
//         return MaterialApp(
//             theme: AppTheme.lightTheme,
//             // If ThemeMode is ThemeMode.light, this is selected as app's theme
//             darkTheme: AppTheme.darkTheme,
//             // If ThemeMode is ThemeMode.dark, this is selected as app's theme
//
//             themeMode: state.themeMode,
//             home: UserListScreen());
//       }),
//     );
//   }
// }
