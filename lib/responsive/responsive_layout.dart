import 'package:app_ban_giay/responsive/tablet_layout.dart';
import 'package:flutter/material.dart';

import 'desktop_layout.dart';
import 'mobile_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 550) {
          return  MobileLayout();
        } else if (constraints.maxWidth < 1100) {
          return  TabletLayout();
        } else {
          return   DesktopLayout();
        }
      },
    );
  }
}
