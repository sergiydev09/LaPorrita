import 'package:flutter/material.dart';
import 'package:laporrita/ui/feature/home/home_state.dart';
import 'package:laporrita/ui/feature/home/home_viewmodel.dart';
import 'package:laporrita/ui/feature/login/firebase_login.dart';

class HomeScreenMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeScreenMobile({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: ValueListenableBuilder(
            valueListenable: viewModel.state,
            builder: (BuildContext context, HomeState value, Widget? child) {
              return ElevatedButton(
                child: const Text("Show login"),
                onPressed: () {
                  showAuthDialog(context, callback: (user) {
                    debugPrint(user?.email ?? "error");
                  });
                },
              );
            },
          ),
        ),
      );
}
