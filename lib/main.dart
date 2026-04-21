import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/core/bloc/changeprofile/profile_bloc.dart';
import 'package:solid/core/bloc/auth/auth_bloc.dart';
import 'package:solid/core/bloc/auth/auth_event.dart';
import 'package:solid/core/bloc/auth/auth_state.dart';
import 'package:solid/core/bloc/cart/cart_bloc.dart';
import 'package:solid/core/bloc/wishlist/wishlist_bloc.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AuthBloc>(
          create: (_) => sl<AuthBloc>()..add(const AuthStatusRequested()),
        ),
        BlocProvider<GlobalProfileBloc>(
          create: (_) => sl<GlobalProfileBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (_) => sl<CartBloc>(),
        ),
        BlocProvider<WishlistBloc>(
          create: (_) => sl<WishlistBloc>(),
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (BuildContext context, AuthState state) {
          final AppRouter appRouter = AppRouter(
            isAuthenticated: state.isAuthenticated,
          );

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Solid',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
            ),
            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}
