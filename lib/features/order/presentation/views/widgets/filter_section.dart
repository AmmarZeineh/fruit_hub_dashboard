import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Text(
            'Filter by: ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 16),
          Icon(Icons.filter),
        ],
      ),
    );
  }
}
