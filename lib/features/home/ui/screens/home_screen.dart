// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:millima/features/features.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserErrorState) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is UserLoadedState) {
          if (state.user.role.name == "student") {
            return const UserScreen();
          } else if (state.user.role.name == 'teacher') {
            return const TeacherScreen();
          } else if (state.user.role.name == 'admin') {
            return const AdminScreen();
          }
        }
        return const Center(
          child: Text("User topilmadi!"),
        );
      }),
    );
  }
}
