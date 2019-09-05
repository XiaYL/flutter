import 'package:flutter/material.dart';

class CommonHeader extends StatefulWidget implements PreferredSizeWidget {
  final bool autoLeading;
  final String titleText;
  final Widget leading;
  final Widget title;
  final List<Widget> actions;

  CommonHeader(
      {this.titleText = '',
      this.title,
      this.autoLeading = true,
      this.leading,
      this.actions});

  @override
  State<StatefulWidget> createState() {
    return CommonHeaderState();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CommonHeaderState extends State<CommonHeader> {
  @override
  Widget build(BuildContext context) {
    Widget leading = widget.leading;
    if (leading == null && widget.autoLeading) {
      leading = getDefaultLeading();
    }

    Widget title = widget.title;
    if (title == null) {
      title = getDefaultTitle();
    }

    return AppBar(
      title: title,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: leading,
      actions: widget.actions,
    );
  }

  //默认返回按钮
  Widget getDefaultLeading() {
    VoidCallback callback;
    if (Navigator.canPop(context)) {
      callback = () {
        Navigator.pop(context);
      };
    }
    return IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: callback);
  }

  //默认标题
  Widget getDefaultTitle() {
    return Text(widget.titleText ?? '');
  }
}
