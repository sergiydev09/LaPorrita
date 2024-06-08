import 'package:flutter/material.dart';
import 'package:laporrita/di/get_it.dart';
import 'package:laporrita/ui/feature/home/home_viewmodel.dart';
import 'package:laporrita/ui/feature/home/screen/desktop/home_screen_desktop.dart';
import 'package:laporrita/ui/feature/home/screen/mobile/home_screen_mobile.dart';
import 'package:laporrita/ui/navigation/feature_route.dart';


class HomeRoute extends FeatureRoute {
  HomeRoute(super.context);

  final _homeViewModel = getIt<HomeViewModel>();

  @override
  Widget get mobileScreen => HomeScreenMobile(viewModel: _homeViewModel);

  @override
  Widget get desktopScreen => HomeScreenDesktop(viewModel: _homeViewModel);
}
