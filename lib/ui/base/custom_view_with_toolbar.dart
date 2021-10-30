import 'package:flutter/material.dart';
import 'package:get_meat_apps/shared/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomViewWithToolbar extends StatelessWidget {
  const CustomViewWithToolbar({
    Key? key,
    required this.title,
    required this.body,
    this.withBackground = false,
    this.leadingIcon,
    this.onLeadingIconTap,
    this.leadingIconColor = Colors.black,
    this.actions,
  }) : super(key: key);

  final Widget body;

  final String title;

  final bool withBackground;

  final IconData? leadingIcon;

  final GestureTapCallback? onLeadingIconTap;

  final Color? leadingIconColor;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: leadingIcon != null
            ? IconButton(
                onPressed: () => onLeadingIconTap?.call(),
                icon: Icon(leadingIcon),
                color: leadingIconColor,
              )
            : null,
        centerTitle: true,
        title: Text(
          title,
          style: GetMeatTextStyle.blackFontStyle1,
        ),
        actions: actions ?? [],
      ),
      body: body,
      resizeToAvoidBottomInset: false,
    );
  }
}
