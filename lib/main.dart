import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'config/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      // routes: [
      //   ShellRoute(
      //     builder: (context, state, child) {
      //       return Scaffold(
      //         body: child,
      //         bottomNavigationBar: BottomNavigationBar(
      //           currentIndex: _calculateSelectedIndex(context),
      //           onTap: (value) {
      //             switch (value) {
      //               case 0:
      //                 const AuthRoute().go(context);
      //                 break;
      //               case 1:
      //                 const SettingsRoute().go(context);
      //                 break;
      //             }
      //           },
      //           items: const [
      //             BottomNavigationBarItem(
      //               icon: Icon(Icons.home),
      //               label: 'Feed',
      //             ),
      //             BottomNavigationBarItem(
      //               icon: Icon(Icons.newspaper),
      //               label: 'Discover',
      //             ),
      //           ],
      //         ),
      //       );
      //     },
      //     routes: $appRoutes,
      //   ),
      // ],
      routes: $appRoutes,
      redirect: (context, state) {
        return null;
        // final isAuth = true;
        // if (isAuth) {
        //   return '/auth';
        // } else {
        //   return null;
        // }
      },
    );
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Learning App',
      routerConfig: router,
    );
  }
}
