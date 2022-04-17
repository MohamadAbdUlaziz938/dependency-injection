import 'package:flutter/material.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/posts/post_view.dart';
import 'package:mvvm/view/posts/posts_view_assistant.dart';

import 'loading_dialog.dart';

MaterialPageRoute? buildRoute(RouteSettings settings) {
  switch (settings.name) {
    case BaseMain.rout:
      return NoTransitionMaterialRoute(
          builder: (_) => loadingWillPopScope(BaseMain()),
          settings: settings,
          maintainState: true);
    case PostAssistant.rout:
      return NoTransitionMaterialRoute(
          builder: (_) => loadingWillPopScope(PostAssistant()),
          settings: settings,
          maintainState: true);
    case PostView.rout:
      final int postId = settings.arguments as int;
      return MaterialPageRoute(
          builder: (_) => loadingWillPopScope(PostView(
                postId: postId,
              )),
          settings: settings);
  }
}

class NoTransitionMaterialRoute extends MaterialPageRoute {
  NoTransitionMaterialRoute({
    @required builder,
    RouteSettings? settings,
    maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 10);
}
