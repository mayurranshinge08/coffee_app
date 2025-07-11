import 'package:flutter/material.dart';
class CoffeeType extends StatelessWidget {
 CoffeeType({
  required this.coffeeType,
  required this.isSelected,
  required this.onTap,
 });
 final VoidCallback onTap;
 final bool isSelected;
 final String coffeeType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          coffeeType,style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color:  isSelected ? Colors.orange : Colors.white,
        ),),
      ),
    );

  }
}
