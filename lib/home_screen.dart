import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/internet_cubit.dart';
import 'cubits/internet_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body:
      BlocConsumer<InternetCubit, InternetState>(
        listener: (context, state) {
          if (state is NotConnectedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ConnectedState) {
            return Text(
              state.message,
              style: const TextStyle(fontSize: 20),
            );
          } else if (state is NotConnectedState) {
            return Text(
              state.message,
              style: const TextStyle(fontSize: 20),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
