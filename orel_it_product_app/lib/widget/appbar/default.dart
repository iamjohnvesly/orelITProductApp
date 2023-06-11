import 'package:flutter/material.dart';

class DefaultAppbar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;
  final Color? textColor;
  final Color? backgroundColor;
  final List<Widget>? actions;
  DefaultAppbar({
    this.actions,
    this.title,
    Key? key,
    this.backgroundColor,
    this.textColor,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: textColor,
      elevation: 0,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(color: textColor),
            )
          : null,
      backgroundColor: backgroundColor,
      centerTitle: true,
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: textColor),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: actions ??
          [IconButton(onPressed: (() {}), icon: const Icon(Icons.more_vert))],
    );
  }
}
