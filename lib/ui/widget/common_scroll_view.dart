import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sequoiacapdemo/core/utils/utils.dart';

class CommonScrollView extends StatelessWidget {
  PreferredSizeWidget? appBar;
  Widget child;
  CommonScrollView({this.appBar, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Utils.removeFocus(context);
        },
        child: Stack(
          children: <Widget>[
            Scaffold(
              appBar: appBar,
              backgroundColor: Colors.transparent,
              body: LayoutBuilder(
                builder: (context, constraint) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: child,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
