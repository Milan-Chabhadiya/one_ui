import 'package:flutter/material.dart';
import 'package:one_ui/src/effects/ink_ripple.dart';

class OneUIContainedButton extends ElevatedButton {
  const OneUIContainedButton({
    Key? key,
    required VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipbehavior = Clip.none,
    required Widget? child,
    this.splashFactory = OneUIInkRipple.splashFactory,
  }) : super(
          key: key,
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipbehavior,
          child: child,
        );

  final InteractiveInkFeatureFactory? splashFactory;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final EdgeInsetsGeometry scaledPadding = ButtonStyleButton.scaledPadding(
      const EdgeInsets.symmetric(horizontal: 16),
      const EdgeInsets.symmetric(horizontal: 8),
      const EdgeInsets.symmetric(horizontal: 4),
      MediaQuery.maybeOf(context)?.textScaler.scale(1.0) ?? 1.0,
    );

    return ElevatedButton.styleFrom(
      foregroundColor: colorScheme.onPrimary, backgroundColor: colorScheme.primary, disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38), disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
      shadowColor: theme.shadowColor,
      elevation: 2,
      textStyle: theme.textTheme.labelLarge,
      padding: scaledPadding,
      minimumSize: const Size(64, 36),
      maximumSize: Size.infinite,
      side: null,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
      enabledMouseCursor: SystemMouseCursors.click,
      disabledMouseCursor: SystemMouseCursors.forbidden,
      visualDensity: theme.visualDensity,
      tapTargetSize: theme.materialTapTargetSize,
      animationDuration: kThemeChangeDuration,
      enableFeedback: true,
      alignment: Alignment.center,
      splashFactory: splashFactory,
    );
  }
}
