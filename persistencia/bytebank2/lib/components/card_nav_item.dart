import 'package:flutter/material.dart';

class CardNavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final Function onTap;

  const CardNavItem(
    this.icon,
    this.label,
    this.color,
    this.onTap,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: this.color,
      child: InkWell(
        onTap: this.onTap,
        child: Container(
          height: 100,
          width: 150,
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(this.icon, color: Colors.white, size: 32.0),
              Text(
                this.label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
