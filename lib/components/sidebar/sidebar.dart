import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_admin/components/sidebar/sidebar_item.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get/get.dart';

enum SidebarBreakpoints { xs, sm, md, lg, xl }

class Sidebar extends StatelessWidget {
  final SidebarBreakpoints? sidebarBreakpoints;
  final Widget? body;
  final bool? expanded;
  final Color? backgroundColor;
  final double? width;
  const Sidebar(
      {super.key,
      this.sidebarBreakpoints,
      this.body,
      this.expanded,
      this.backgroundColor,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: backgroundColor ?? Colors.blue.shade400,
          child: SizedBox(
            width: width ?? 200,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                SidebarItem(
                  icon: Ionicons.home_outline,
                  text: 'Home',
                  onTap: () {
// Add your navigation logic here
                  },
                ),
                // Submenu
                SubmenuWidget(
                  icon: Ionicons.body_outline,
                  title: "Submenu",
                  expanded: true,
                  submenu: [
                    SidebarItem(
                      icon: Icons.star,
                      text: 'Submenu Item 1',
                      onTap: () {
                        // Add your navigation logic here
                      },
                    ),
                    SidebarItem(
                      icon: Icons.star,
                      text: 'Submenu Item 2',
                      onTap: () {
                        // Add your navigation logic here
                      },
                    ),
                  ],
                ),
                SidebarItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  onTap: () {
                    // Add your navigation logic here
                  },
                ),
                SidebarItem(
                  icon: Icons.info,
                  text: 'About',
                  onTap: () {
                    // Add your navigation logic here
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          child: body,
        )
      ],
    );
  }
}
