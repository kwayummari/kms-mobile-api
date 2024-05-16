import 'package:flutter/material.dart';

IconData getIconData(String iconName) {
  switch (iconName) {
    case 'home':
      return Icons.home;
    case 'people':
      return Icons.people;
    case 'card_travel':
      return Icons.card_travel;
    case 'chart':
      return Icons.pie_chart;
    case 'savings':
      return Icons.savings;
    case 'report':
      return Icons.add_chart;
    default:
      return Icons.error;
  }
}
