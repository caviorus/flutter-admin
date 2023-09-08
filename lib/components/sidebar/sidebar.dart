import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SideBarBreakpoints { xs, sm, md, lg, xl }

class SideBar extends StatelessWidget {
  final SideBarBreakpoints? sideBarBreakpoints;
  final Widget? body;
  SideBar({super.key, this.sideBarBreakpoints, this.body});

  var _selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() => NavigationRail(
            backgroundColor: Color(0xFFEFF0FF),
            extended: true,
            onDestinationSelected: (value) => {
              _selectedIndex.value = value
            },
            destinations: [
            NavigationRailDestination(
                icon: Icon(Icons.home_outlined), label: Text("Home")),
            NavigationRailDestination(
                icon: Icon(Icons.bar_chart), label: Text("Perfomance")),
            NavigationRailDestination(
                icon: Icon(Icons.folder_outlined), label: Text("Files")),
          ], selectedIndex: _selectedIndex.value),
        ),
        Container(
          child: body,
        )
      ],
    );
  }
}
