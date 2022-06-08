import 'dart:ui';

import 'package:flutter/material.dart';

/// {@template hero_dialog_route}
/// Custom [PageRoute] that creates an overlay dialog (popup effect).
///
/// Best used with a [Hero] animation.
/// {@endtemplate}
abstract class HeroDialogRoute<T> extends ModalRoute<T> {
  /// {@macro hero_dialog_route}
  HeroDialogRoute({
    required RouteSettings settings,
    this.fullscreenDialog = false,
  }) : super(
            settings: settings,
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0));

  final bool fullscreenDialog;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  bool canTransitionTo(TransitionRoute<dynamic> nextRoute) =>
      nextRoute is PageRoute;

  @override
  bool canTransitionFrom(TransitionRoute<dynamic> previousRoute) =>
      previousRoute is PageRoute;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;
}

Widget _defaultTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return child;
}

class HeroDialogueRouteBuilder<T> extends HeroDialogRoute<T> {
  HeroDialogueRouteBuilder({
    RouteSettings? settings,
    required this.builder,
    this.transitionsBuilder = _defaultTransitionsBuilder,
    this.transitionDuration = const Duration(milliseconds: 1000),
    this.reverseTransitionDuration = const Duration(milliseconds: 300),
    this.opaque = false,
    this.barrierDismissible = false,
    this.barrierColor = Colors.transparent,
    this.barrierLabel,
    this.maintainState = true,
    bool fullscreenDialog = false,
  })  : assert(builder != null),
        assert(transitionsBuilder != null),
        assert(opaque != null),
        assert(barrierDismissible != null),
        assert(maintainState != null),
        assert(fullscreenDialog != null),
        super(settings: settings!);

  /// {@template flutter.widgets.pageRouteBuilder.pageBuilder}
  /// Used build the route's primary contents.
  ///
  /// See [ModalRoute.buildPage] for complete definition of the parameters.
  /// {@endtemplate}
  final WidgetBuilder builder;

  /// {@template flutter.widgets.pageRouteBuilder.transitionsBuilder}
  /// Used to build the route's transitions.
  ///
  /// See [ModalRoute.buildTransitions] for complete definition of the parameters.
  /// {@endtemplate}
  final RouteTransitionsBuilder transitionsBuilder;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
