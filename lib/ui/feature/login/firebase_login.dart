import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:laporrita/domain/model/user_model.dart';

typedef AuthCallback = void Function(UserModel? user);

class _AuthScreen extends StatefulWidget {
  const _AuthScreen({required this.callback});

  final AuthCallback callback;

  @override
  State<_AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<_AuthScreen> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 600,
    height: 600,
    child: Navigator(
          key: _navigatorKey,
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case '/forgotPassword':
                builder = (BuildContext context) => const ForgotPasswordScreen();
                break;
              case '/':
              default:
                builder = (BuildContext context) => SignInScreen(
                      providers: [
                        EmailAuthProvider(),
                        GoogleProvider(clientId: "822169801130-8ltku62j96u5onvvopkb95asu5gmipcp.apps.googleusercontent.com"),
                        AppleProvider(),
                      ],
                      actions: [
                        AuthStateChangeAction((context, state) {
                          switch(state) {
                            case SignedIn(user: final user): widget.callback(user?.toModel());
                            case AuthFailed(): widget.callback(null);
                          }
                        }),
                        ForgotPasswordAction((context, email) {
                          _navigatorKey.currentState?.pushNamed('/forgotPassword');
                        }),
                      ],
                      resizeToAvoidBottomInset: false,
                      showPasswordVisibilityToggle: true,
                    );
                break;
            }
            return MaterialPageRoute(builder: builder, settings: settings);
          },
        ),
  );

}

extension StringExtension on auth.User? {
  UserModel? toModel() {
    if(this != null) {
      return UserModel(id: this!.uid, email: this!.email!, name: this!.displayName!, image: this?.photoURL);
    } else {
      return null;
    }
  }
}

void showAuthDialog(BuildContext context, {required AuthCallback callback}) async => showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        child: _AuthScreen(
          callback: (UserModel? user) {
            callback(user);
            Navigator.pop(context);
          },
        ),
      ),
    );
