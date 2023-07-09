import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_app/presentation/bloc/courses/courses_bloc.dart';
import 'package:learning_app/presentation/bloc/topics/topics_bloc.dart';

import 'config/router/app_router.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              body: child,
              // bottomNavigationBar: BottomNavigationBar(
              //   currentIndex: _calculateSelectedIndex(context),
              //   onTap: (value) {
              //     switch (value) {
              //       case 0:
              //         const AuthRoute().go(context);
              //         break;
              //       case 1:
              //         const SettingsRoute().go(context);
              //         break;
              //     }
              //   },
              //   items: const [
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.home),
              //       label: 'Feed',
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.newspaper),
              //       label: 'Discover',
              //     ),
              //   ],
              // ),
            );
          },
          routes: $appRoutes,
        ),
      ],
      // routes: $appRoutes,
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

    return MultiBlocProvider(
      providers: [
        BlocProvider<CoursesBloc>(create: (_) => di.sl.get<CoursesBloc>()),
        BlocProvider<TopicsBloc>(create: (_) => di.sl.get<TopicsBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Learning App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        routerConfig: router,
        // routeInformationParser: router.routeInformationParser,
        // routeInformationProvider: router.routeInformationProvider,
        // routerDelegate: router.routerDelegate,
      ),
    );

    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Learning App',
    //   theme: ThemeData(
    //     scaffoldBackgroundColor: Colors.white,
    //   ),
    //   routerConfig: router,
    //   // routeInformationParser: router.routeInformationParser,
    //   // routeInformationProvider: router.routeInformationProvider,
    //   // routerDelegate: router.routerDelegate,
    // );
  }
}
