import 'package:flutter/material.dart';
import 'package:flutter_admin/routes/routes.dart';
import 'package:get/get.dart';

enum SideBarBreakpoints { xs, sm, md, lg, xl }

class SideBar extends StatelessWidget {
  final SideBarBreakpoints? sideBarBreakpoints;
  final Widget? body;
  final bool? expanded;
  SideBar({super.key, this.sideBarBreakpoints, this.body, this.expanded});

  var _selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    var routes = Routes(context: context).get();
    return Row(
      children: [
        Material(
          color: Colors.blue,
          child: Container(
            width: 200, // Adjust the width as needed
            child: ListView(
              children: [
                SidebarItem(
                  icon: Icons.home,
                  text: 'Home',
                  onTap: () {
                    // Add your navigation logic here
                  },
                ),
                // Submenu
                SubmenuWidget(),
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

class SubmenuWidget extends StatefulWidget {
  @override
  _SubmenuWidgetState createState() => _SubmenuWidgetState();
}

class _SubmenuWidgetState extends State<SubmenuWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SidebarItem(
          icon: Icons.menu,
          text: 'Submenu',
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
        AnimatedContainer(
          duration:
              Duration(milliseconds: 300), // Adjust the duration as needed
          height: isExpanded ? 120 : 0, // Set the desired height when expanded
          child: SingleChildScrollView(
            // Wrap with SingleChildScrollView
            child: Column(
              children: [
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
          ),
        ),
      ],
    );
  }
}

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  SidebarItem({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
      ),
    );
  }
}
