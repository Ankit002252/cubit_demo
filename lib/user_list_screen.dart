import 'package:cubit_demo/memes_screen.dart';
import 'package:cubit_demo/theme/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/user_cubit.dart';
import 'cubits/user_state.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  void initState() {
    print("--------------userlist-----inti");
    // TODO: implement initState
    context.read<UserCubit>().getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ThemeCubit>().switchTheme(),
        tooltip: 'Switch Theme',
        child: context.read<ThemeCubit>().state.themeMode == ThemeMode.light
            ? const Icon(Icons.dark_mode)
            : const Icon(Icons.light_mode),
      ),


      appBar: AppBar(
        title: Text("UseList", style: Theme.of(context).textTheme.bodyText1),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is LoadedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(""),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is WelcomeState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(8),
              itemCount: state.userModel!.data!.length,
              itemBuilder: (context, i) {
                return Container(
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 14),
                  child: Card(
                    elevation: 10,
                    color: Colors.blue,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MemesScreen()),
                            );
                          },
                          child: ListTile(
                            title: Text(
                              state.userModel!.data![i].firstName.toString(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
