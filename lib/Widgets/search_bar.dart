import 'package:flutter/material.dart';
import 'package:homzes/colors.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(color: AppColors.black),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
      style: const TextStyle(color: AppColors.black),
    );
  }
}
