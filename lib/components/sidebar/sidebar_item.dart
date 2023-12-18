import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  final Widget? suffix;

  const SidebarItem(
      {super.key, required this.icon, required this.text, required this.onTap, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onTap: () {
          onTap();
        },
        child: ListTile(
          leading: Icon(icon),
          title: Text(text),
          trailing: suffix,
        ),
      ),
    );
  }
}

class SubmenuWidget extends StatefulWidget {
  final bool? expanded;
  final IconData icon;
  final String title;
  final List<Widget>? submenu;
  const SubmenuWidget(
      {super.key,
      this.expanded,
      required this.icon,
      required this.title,
      this.submenu});

  @override
  State<SubmenuWidget> createState() => _SubmenuWidgetState();
}

class _SubmenuWidgetState extends State<SubmenuWidget> {
  bool isExpanded = false;
  bool stateChanged = false;

  @override
  Widget build(BuildContext context) {
    if (!stateChanged) {
      setState(() {
        isExpanded = widget.expanded ?? false;
      });
    }

    return Column(
      children: [
        SidebarItem(
          icon: widget.icon,
          text: widget.title,
          suffix:  Icon(isExpanded ? Ionicons.chevron_down_outline : Ionicons.chevron_forward_outline),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
              stateChanged = true;
            });
          },
        ),
        AnimatedContainer(
          duration: const Duration(
              milliseconds: 300), // Adjust the duration as needed
          height: isExpanded
              ? (42 * widget.submenu!.length.toDouble()) + 20
              : 0, // Set the desired height when expanded
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SingleChildScrollView(
              child: Column(
                children: widget.submenu ?? [],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
