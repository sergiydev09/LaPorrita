
import 'package:flutter/material.dart';
import 'package:laporrita/ui/feature/home/home_state.dart';
import 'package:laporrita/ui/feature/home/home_viewmodel.dart';
import 'package:laporrita/ui/feature/login/firebase_login.dart';

class HomeScreenDesktop extends StatelessWidget {
  final HomeViewModel viewModel;

  const HomeScreenDesktop({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;
    return ValueListenableBuilder(
        valueListenable: viewModel.state,
        builder: (BuildContext context, HomeState state, Widget? child) => Scaffold(
              appBar: AppBar(
                backgroundColor: appBarTheme.backgroundColor,
                title: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "AudioLibAI",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 26),
                      ),
                      TextSpan(
                        text: " . Beta",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
                centerTitle: true,
                actions: [
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      if (state.user == null)
                        PopupMenuItem(
                            child: const ListTile(
                              leading: Icon(Icons.login, color: Colors.white,),
                              title: Text('Iniciar sesión', style: TextStyle(color: Colors.white, fontSize: 16)),
                            ),
                            onTap: () => showAuthDialog(context, callback: viewModel.onLoginResult),
                        ),
                      if (state.user != null)
                        PopupMenuItem(
                          child: const ListTile(
                            leading: Icon(Icons.person, color: Colors.white,),
                            title: Text('Perfil', style: TextStyle(color: Colors.white, fontSize: 16)),
                          ),
                          onTap: () {},
                        ),
                      if (state.user != null)
                        PopupMenuItem(
                        child: const ListTile(
                          leading: Icon(Icons.logout, color: Colors.white,),
                          title: Text('Cerrar sesión', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                        onTap: () {},
                      ),
                    ],
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          child: Image.network(
                            state.user?.image ?? "",
                            errorBuilder: (context, error, stackTrace) => Icon(Icons.person_off_outlined),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Colors.white,)
                      ],
                    ),
                    offset: const Offset(0, 62),
                  ),
                ],
              ),
              body: Container(),
            ));
  }
}
