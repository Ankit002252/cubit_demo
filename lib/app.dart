import 'package:cubit_demo/cubits/mems_cubit.dart';
import 'package:cubit_demo/cubits/user_cubit.dart';
import 'package:cubit_demo/theme/app_theme.dart';
import 'package:cubit_demo/theme/theme_cubit.dart';
import 'package:cubit_demo/theme/theme_repository.dart';
import 'package:cubit_demo/theme/theme_state.dart';
import 'package:cubit_demo/user_list_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api_repo.dart';
import 'cubits/internet_cubit.dart';

class App extends StatelessWidget {
  const App({required this.themeRepository, super.key});

  final ThemeRepository themeRepository;

  @override
  Widget build(BuildContext context) {
    return
      RepositoryProvider.value(
      value: themeRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ThemeCubit(themeRepository: context.read<ThemeRepository>())
                  ..getCurrentTheme(),

          ),
          BlocProvider(create: (context) => InternetCubit()),
          BlocProvider(create: (context) => UserCubit(DataServices())),
          BlocProvider(create: (context) => MemesCubit()),
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          // If ThemeMode is ThemeMode.light, this is selected as app's theme
          darkTheme: AppTheme.darkTheme,
          // If ThemeMode is ThemeMode.dark, this is selected as app's theme

          // The themeMode is the most important property in showing
          // proper theme. The value comes from ThemeState class.
          themeMode: state.themeMode,
          home: const UserListScreen(),
        );
      },
    );
  }
}
