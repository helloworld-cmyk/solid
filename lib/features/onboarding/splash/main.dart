import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid/core/di/injection.dart';
import 'package:solid/core/router/app.router.gr.dart';

import 'presentation/bloc/splash_bloc.dart';
import 'presentation/bloc/splash_state.dart';
import 'presentation/widget/splash_background.dart';
import 'presentation/widget/splash_footer.dart';
import 'presentation/widget/splash_logo.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (_) => sl<SplashBloc>()..start(),
      child: BlocConsumer<SplashBloc, SplashState>(
        listenWhen: (SplashState previous, SplashState current) {
          return !previous.shouldNavigateToOnboard &&
              current.shouldNavigateToOnboard;
        },
        listener: (BuildContext context, SplashState state) {
          context.read<SplashBloc>().consumeNavigation();
          context.router.replace(OnboardRoute());
        },
        buildWhen: (SplashState previous, SplashState current) {
          return previous.animationProgress != current.animationProgress;
        },
        builder: (BuildContext context, SplashState state) {
          return Scaffold(
            body: Stack(
              children: <Widget>[
                const Positioned.fill(child: SplashBackground()),
                SafeArea(
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: SplashLogo(progress: state.animationProgress),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SplashFooter(progress: state.animationProgress),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
