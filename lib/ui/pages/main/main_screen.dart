import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_meat_apps/ui/pages/main/history_order/history_order_page.dart';
import 'package:get_meat_apps/ui/pages/main/home/cubit/home_cubit.dart';
import 'package:get_meat_apps/ui/pages/main/home/home_page.dart';
import 'package:get_meat_apps/ui/pages/main/profile/cubit/profile_cubit.dart';
import 'package:get_meat_apps/ui/pages/main/profile/profile_page.dart';
import 'package:get_meat_apps/ui/widget/widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.initalPage = 0}) : super(key: key);

  final int initalPage;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  int oldIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => HomeCubit()),
      ],
      child: SafeArea(
        child: Scaffold(
          body: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 500),
            reverse: oldIndex > currentIndex,
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
                transitionType: SharedAxisTransitionType.horizontal,
              );
            },
            child: const [
              HomePage(),
              HistoryOrderPage(),
              ProfilePage(),
            ][currentIndex],
          ),
          bottomNavigationBar: GetMeatBottomNavigation(
            selectedIndex: currentIndex,
            onTap: (index) {
              setState(() {
                oldIndex = currentIndex;
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
