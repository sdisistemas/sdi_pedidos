import 'package:sdi_pedidos/core_module/constants/constants.dart';
import 'package:sdi_pedidos/core_module/services/themeMode/theme_mode_controller.dart';
import 'package:flutter/material.dart';

class MyElevatedButtonWidget extends StatefulWidget {
  final Widget label;
  final IconData? icon;
  final Function()? onPressed;
  final double? height;
  final double? width;
  const MyElevatedButtonWidget({
    Key? key,
    required this.label,
    this.icon,
    required this.onPressed,
    this.height = 40,
    this.width,
  }) : super(key: key);

  @override
  State<MyElevatedButtonWidget> createState() => _MyElevatedButtonWidgetState();
}

class _MyElevatedButtonWidgetState extends State<MyElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width ?? context.screenWidth,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeModeController.themeMode == ThemeMode.dark
              ? context.myTheme.primaryContainer
              : context.myTheme.primary.withRed(190),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.zero,
        ),
        child: widget.label,
      ),
    );
  }
}
