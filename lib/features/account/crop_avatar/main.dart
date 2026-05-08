import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:solid/core/ui/widget/widgets.dart';

import 'crop_avatar_style.dart';
import 'presentation/bloc/crop_avatar_bloc.dart';
import 'presentation/bloc/crop_avatar_event.dart';
import 'presentation/bloc/crop_avatar_state.dart';
import 'presentation/widgets/crop_avatar_body.dart';

@RoutePage()
class CropAvatarPage extends StatelessWidget {
  const CropAvatarPage({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CropAvatarBloc>(
      create: (BuildContext context) =>
          GetIt.I<CropAvatarBloc>()
            ..add(CropAvatarInitialized(imagePath: imagePath)),
      child: BlocListener<CropAvatarBloc, CropAvatarState>(
        listenWhen: (CropAvatarState previous, CropAvatarState current) =>
            current.popResultPath != null,
        listener: (BuildContext context, CropAvatarState state) {
          final String path = state.popResultPath ?? '';
          if (path.isEmpty) {
            return;
          }

          context.read<CropAvatarBloc>().add(const CropAvatarPopHandled());
          context.router.maybePop(path);
        },
        child: Scaffold(
          backgroundColor: CropAvatarColors.background,
          body: SafeArea(
            top: false,
            child: Column(
              children: <Widget>[
                CommonPageHeader(
                  title: 'CROP PHOTO',
                  leading: IconButton(
                    onPressed: () => context.router.maybePop(),
                    icon: const Icon(Icons.close, size: 18),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        context.read<CropAvatarBloc>().add(
                          const CropAvatarSavePressed(),
                        );
                      },
                      child: Text('Save', style: CropAvatarTypography.action),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                Expanded(
                  child: BlocBuilder<CropAvatarBloc, CropAvatarState>(
                    builder: (BuildContext context, CropAvatarState state) {
                      return CropAvatarBody(
                        imagePath: state.imagePath,
                        controller: state.controller,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
