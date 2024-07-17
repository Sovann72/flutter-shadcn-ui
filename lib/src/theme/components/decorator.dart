import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadcn_ui/src/theme/theme.dart';

@immutable
class ShadBorder {
  const ShadBorder({
    this.merge = true,
    this.width,
    this.color,
    this.radius,
    this.padding,
  });

  static const ShadBorder none = ShadBorder(merge: false);

  /// The width of the border, defaults to 1.0.
  final double? width;

  /// The color of the border, defaults to Colors.black.
  final Color? color;

  /// The radius of the border, defaults to null.
  final BorderRadiusGeometry? radius;

  /// The padding of the border, defaults to null.
  final EdgeInsets? padding;

  /// Whether to merge with another border, defaults to true.
  final bool merge;

  static ShadBorder? lerp(
    ShadBorder? a,
    ShadBorder? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    return ShadBorder(
      width: lerpDouble(a?.width, b?.width, t),
      color: Color.lerp(a?.color, b?.color, t),
      radius: BorderRadiusGeometry.lerp(a?.radius, b?.radius, t),
      padding: EdgeInsets.lerp(a?.padding, b?.padding, t),
    );
  }

  ShadBorder copyWith({
    double? width,
    Color? color,
    BorderRadiusGeometry? radius,
    EdgeInsets? padding,
  }) {
    return ShadBorder(
      width: width ?? this.width,
      color: color ?? this.color,
      radius: radius ?? this.radius,
      padding: padding ?? this.padding,
    );
  }

  ShadBorder mergeWith(ShadBorder? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      width: other.width ?? width,
      color: other.color ?? color,
      radius: other.radius ?? radius,
      padding: other.padding ?? padding,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadBorder &&
        other.width == width &&
        other.color == color &&
        other.radius == radius &&
        other.padding == padding;
  }

  @override
  int get hashCode {
    return width.hashCode ^ color.hashCode ^ radius.hashCode ^ padding.hashCode;
  }

  @override
  String toString() {
    return '''ShadBorder(width: $width, color: $color, radius: $radius, padding: $padding)''';
  }
}

@immutable
class ShadDecoration {
  const ShadDecoration({
    this.merge = true,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.secondaryBorder,
    this.secondaryFocusedBorder,
    this.secondaryErrorBorder,
    this.labelStyle,
    this.errorLabelStyle,
    this.errorStyle,
    this.descriptionStyle,
    this.labelPadding,
    this.descriptionPadding,
    this.errorPadding,
    this.fallbackToBorder,
    this.color,
    this.image,
    this.shadows,
    this.gradient,
    this.backgroundBlendMode,
    this.shape,
    this.hasError,
    this.fallbackToLabelStyle,
  });

  static const ShadDecoration none = ShadDecoration(merge: false);

  final bool merge;
  final TextStyle? labelStyle;
  final TextStyle? errorLabelStyle;
  final ShadBorder? border;
  final ShadBorder? focusedBorder;
  final ShadBorder? errorBorder;
  final ShadBorder? secondaryBorder;
  final ShadBorder? secondaryFocusedBorder;
  final ShadBorder? secondaryErrorBorder;
  final TextStyle? errorStyle;
  final TextStyle? descriptionStyle;
  final EdgeInsets? labelPadding;
  final EdgeInsets? descriptionPadding;
  final EdgeInsets? errorPadding;
  final Color? color;
  final DecorationImage? image;
  final List<BoxShadow>? shadows;
  final Gradient? gradient;
  final BlendMode? backgroundBlendMode;
  final BoxShape? shape;
  final bool? hasError;

  /// Whether to fallback to the [border] if no [focusedBorder] or [errorBorder]
  /// is provided, defaults to true.
  ///
  /// This also affects the [secondaryBorder] with the same conditions.
  final bool? fallbackToBorder;

  /// Whether to fallback to the [labelStyle] if no [errorLabelStyle] is
  /// provided, defaults to true.
  final bool? fallbackToLabelStyle;

  static ShadDecoration? lerp(
    ShadDecoration? a,
    ShadDecoration? b,
    double t,
  ) {
    if (a == null && b == null) return null;
    return ShadDecoration(
      border: ShadBorder.lerp(a?.border, b?.border, t),
      focusedBorder: ShadBorder.lerp(a?.focusedBorder, b?.focusedBorder, t),
      errorBorder: ShadBorder.lerp(a?.errorBorder, b?.errorBorder, t),
      secondaryBorder:
          ShadBorder.lerp(a?.secondaryBorder, b?.secondaryBorder, t),
      secondaryFocusedBorder: ShadBorder.lerp(
        a?.secondaryFocusedBorder,
        b?.secondaryFocusedBorder,
        t,
      ),
      secondaryErrorBorder:
          ShadBorder.lerp(a?.secondaryErrorBorder, b?.secondaryErrorBorder, t),
      labelStyle: TextStyle.lerp(a?.labelStyle, b?.labelStyle, t),
      errorLabelStyle:
          TextStyle.lerp(a?.errorLabelStyle, b?.errorLabelStyle, t),
      errorStyle: TextStyle.lerp(a?.errorStyle, b?.errorStyle, t),
      descriptionStyle:
          TextStyle.lerp(a?.descriptionStyle, b?.descriptionStyle, t),
      labelPadding: EdgeInsets.lerp(a?.labelPadding, b?.labelPadding, t),
      descriptionPadding:
          EdgeInsets.lerp(a?.descriptionPadding, b?.descriptionPadding, t),
      errorPadding: EdgeInsets.lerp(a?.errorPadding, b?.errorPadding, t),
      fallbackToBorder: t < 0.5 ? a?.fallbackToBorder : b?.fallbackToBorder,
      color: Color.lerp(a?.color, b?.color, t),
      image: DecorationImage.lerp(a?.image, b?.image, t),
      shadows: BoxShadow.lerpList(a?.shadows, b?.shadows, t),
      gradient: Gradient.lerp(a?.gradient, b?.gradient, t),
      backgroundBlendMode:
          t < 0.5 ? a?.backgroundBlendMode : b?.backgroundBlendMode,
      shape: t < 0.5 ? a?.shape : b?.shape,
      hasError: t < 0.5 ? a?.hasError : b?.hasError,
      fallbackToLabelStyle:
          t < 0.5 ? a?.fallbackToLabelStyle : b?.fallbackToLabelStyle,
    );
  }

  ShadDecoration mergeWith(ShadDecoration? other) {
    if (other == null) return this;
    if (!other.merge) return other;
    return copyWith(
      border: border?.mergeWith(other.border) ?? other.border,
      focusedBorder:
          focusedBorder?.mergeWith(other.focusedBorder) ?? other.focusedBorder,
      errorBorder:
          errorBorder?.mergeWith(other.errorBorder) ?? other.errorBorder,
      secondaryBorder: secondaryBorder?.mergeWith(other.secondaryBorder) ??
          other.secondaryBorder,
      secondaryFocusedBorder:
          secondaryFocusedBorder?.mergeWith(other.secondaryFocusedBorder) ??
              other.secondaryFocusedBorder,
      secondaryErrorBorder:
          secondaryErrorBorder?.mergeWith(other.secondaryErrorBorder) ??
              other.secondaryErrorBorder,
      labelStyle: other.labelStyle ?? labelStyle,
      errorLabelStyle: other.errorLabelStyle ?? errorLabelStyle,
      errorStyle: other.errorStyle ?? errorStyle,
      descriptionStyle: other.descriptionStyle ?? descriptionStyle,
      labelPadding: other.labelPadding ?? labelPadding,
      descriptionPadding: other.descriptionPadding ?? descriptionPadding,
      errorPadding: other.errorPadding ?? errorPadding,
      fallbackToBorder: other.fallbackToBorder ?? fallbackToBorder,
      color: other.color ?? color,
      shape: other.shape ?? shape,
      backgroundBlendMode: other.backgroundBlendMode ?? backgroundBlendMode,
      shadows: other.shadows ?? shadows,
      gradient: other.gradient ?? gradient,
      image: other.image ?? image,
      hasError: other.hasError ?? hasError,
      fallbackToLabelStyle: other.fallbackToLabelStyle ?? fallbackToLabelStyle,
    );
  }

  ShadDecoration copyWith({
    ShadBorder? border,
    ShadBorder? focusedBorder,
    ShadBorder? errorBorder,
    ShadBorder? secondaryBorder,
    ShadBorder? secondaryFocusedBorder,
    ShadBorder? secondaryErrorBorder,
    TextStyle? labelStyle,
    TextStyle? errorLabelStyle,
    TextStyle? errorStyle,
    TextStyle? descriptionStyle,
    EdgeInsets? labelPadding,
    EdgeInsets? descriptionPadding,
    EdgeInsets? errorPadding,
    bool? fallbackToBorder,
    Color? color,
    BoxShape? shape,
    BlendMode? backgroundBlendMode,
    List<BoxShadow>? shadows,
    Gradient? gradient,
    DecorationImage? image,
    bool? hasError,
    bool? fallbackToLabelStyle,
  }) {
    return ShadDecoration(
      border: border ?? this.border,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      errorBorder: errorBorder ?? this.errorBorder,
      secondaryBorder: secondaryBorder ?? this.secondaryBorder,
      secondaryFocusedBorder:
          secondaryFocusedBorder ?? this.secondaryFocusedBorder,
      secondaryErrorBorder: secondaryErrorBorder ?? this.secondaryErrorBorder,
      labelStyle: labelStyle ?? this.labelStyle,
      errorLabelStyle: errorLabelStyle ?? this.errorLabelStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      descriptionStyle: descriptionStyle ?? this.descriptionStyle,
      labelPadding: labelPadding ?? this.labelPadding,
      descriptionPadding: descriptionPadding ?? this.descriptionPadding,
      errorPadding: errorPadding ?? this.errorPadding,
      fallbackToBorder: fallbackToBorder ?? this.fallbackToBorder,
      color: color ?? this.color,
      shape: shape ?? this.shape,
      backgroundBlendMode: backgroundBlendMode ?? this.backgroundBlendMode,
      shadows: shadows ?? this.shadows,
      gradient: gradient ?? this.gradient,
      image: image ?? this.image,
      hasError: hasError ?? this.hasError,
      fallbackToLabelStyle: fallbackToLabelStyle ?? this.fallbackToLabelStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadDecoration &&
        other.border == border &&
        other.focusedBorder == focusedBorder &&
        other.errorBorder == errorBorder &&
        other.secondaryBorder == secondaryBorder &&
        other.secondaryFocusedBorder == secondaryFocusedBorder &&
        other.secondaryErrorBorder == secondaryErrorBorder &&
        other.labelStyle == labelStyle &&
        other.errorLabelStyle == errorLabelStyle &&
        other.errorStyle == errorStyle &&
        other.descriptionStyle == descriptionStyle &&
        other.labelPadding == labelPadding &&
        other.descriptionPadding == descriptionPadding &&
        other.errorPadding == errorPadding &&
        other.fallbackToBorder == fallbackToBorder &&
        other.color == color &&
        other.shape == shape &&
        other.backgroundBlendMode == backgroundBlendMode &&
        other.shadows == shadows &&
        other.gradient == gradient &&
        other.image == image &&
        other.hasError == hasError &&
        other.fallbackToLabelStyle == fallbackToLabelStyle;
  }

  @override
  int get hashCode =>
      border.hashCode ^
      focusedBorder.hashCode ^
      errorBorder.hashCode ^
      secondaryBorder.hashCode ^
      secondaryFocusedBorder.hashCode ^
      secondaryErrorBorder.hashCode ^
      labelStyle.hashCode ^
      errorLabelStyle.hashCode ^
      errorStyle.hashCode ^
      descriptionStyle.hashCode ^
      labelPadding.hashCode ^
      descriptionPadding.hashCode ^
      errorPadding.hashCode ^
      fallbackToBorder.hashCode ^
      color.hashCode ^
      shape.hashCode ^
      backgroundBlendMode.hashCode ^
      shadows.hashCode ^
      gradient.hashCode ^
      image.hashCode ^
      hasError.hashCode ^
      fallbackToLabelStyle.hashCode;

  @override
  String toString() {
    return '''ShadDecoration(border: $border, focusedBorder: $focusedBorder, errorBorder: $errorBorder, secondaryBorder: $secondaryBorder, secondaryFocusedBorder: $secondaryFocusedBorder, secondaryErrorBorder: $secondaryErrorBorder, labelStyle: $labelStyle, errorLabelStyle: $errorLabelStyle, errorStyle: $errorStyle, descriptionStyle: $descriptionStyle, labelPadding: $labelPadding, descriptionPadding: $descriptionPadding, errorPadding: $errorPadding, fallbackToBorder: $fallbackToBorder, color: $color, image: $image, shadows: $shadows, gradient: $gradient, backgroundBlendMode: $backgroundBlendMode, shape: $shape, hasError: $hasError, fallbackToLabelStyle: $fallbackToLabelStyle)''';
  }
}

class ShadDecorator extends StatelessWidget {
  const ShadDecorator({
    super.key,
    this.child,
    this.decoration,
    this.focused = false,
  });

  /// The child to decorate.
  final Widget? child;

  /// The decoration to apply to the child.
  final ShadDecoration? decoration;

  /// Whether the child has focus, defaults to false.
  final bool focused;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final effectiveDecoration = theme.decoration.mergeWith(decoration);

    final effectiveFallbackToBorder =
        effectiveDecoration.fallbackToBorder ?? true;

    final hasError = effectiveDecoration.hasError ?? false;

    final fallbackBorder = switch (focused) {
      true => effectiveDecoration.focusedBorder,
      false => effectiveDecoration.border,
    };

    var border = switch (hasError) {
      true => effectiveDecoration.errorBorder,
      false => fallbackBorder,
    };

    if (effectiveFallbackToBorder && border == null) {
      border = fallbackBorder ?? effectiveDecoration.border;
    }

    final fallbackSecondaryBorder = switch (focused) {
      true => effectiveDecoration.secondaryFocusedBorder,
      false => effectiveDecoration.secondaryBorder,
    };

    var secondaryBorder = switch (hasError) {
      true => effectiveDecoration.secondaryErrorBorder,
      false => fallbackSecondaryBorder,
    };

    if (effectiveFallbackToBorder && secondaryBorder == null) {
      secondaryBorder =
          fallbackSecondaryBorder ?? effectiveDecoration.secondaryBorder;
    }

    Widget decorated = Container(
      decoration: BoxDecoration(
        border: border?.width == null && border?.color == null
            ? null
            : Border.all(
                color: border?.color ?? Colors.black,
                width: border?.width ?? 1.0,
              ),
        borderRadius: effectiveDecoration.shape == BoxShape.circle
            ? null
            : border?.radius,
        color: effectiveDecoration.color,
        shape: effectiveDecoration.shape ?? BoxShape.rectangle,
        backgroundBlendMode: effectiveDecoration.backgroundBlendMode,
        boxShadow: effectiveDecoration.shadows,
        gradient: effectiveDecoration.gradient,
        image: effectiveDecoration.image,
      ),
      padding: border?.padding,
      child: child,
    );

    if (secondaryBorder != null && !theme.disableSecondaryBorder) {
      decorated = Container(
        decoration: BoxDecoration(
          border: secondaryBorder.width == null && secondaryBorder.color == null
              ? null
              : Border.all(
                  color: secondaryBorder.color ?? Colors.black,
                  width: secondaryBorder.width ?? 1.0,
                ),
          borderRadius: secondaryBorder.radius,
        ),
        padding: secondaryBorder.padding,
        child: decorated,
      );
    }

    return decorated;
  }
}
