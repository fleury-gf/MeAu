import 'package:flutter/material.dart';

class DrawerDropdownItem extends StatelessWidget {
  const DrawerDropdownItem({
    super.key,
    this.title = "",
    this.icon,
    this.dropdownToggled = false,
    required this.onTap,
  });

  final String title;
  final IconData? icon;
  final bool dropdownToggled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon != null
                  ? Icon(
                      icon,
                      size: 24,
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.only(left: (icon != null ? 20 : 0)),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Icon(
            dropdownToggled
                ? Icons.expand_less_rounded
                : Icons.expand_more_rounded,
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
