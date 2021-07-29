import 'package:flutter/material.dart';

Widget itemMeals(String? idMeals, String? nameMeals, String? urlImage) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Hero(
              child: Image.network(urlImage!,
                  height: 230.0, width: double.infinity, fit: BoxFit.cover),
              tag: idMeals!),
        ),
        Positioned(
          left: 10,
          bottom: 15,
          child: Text(
            nameMeals!,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                shadows: [
                  Shadow(
                    offset: Offset(5.0, 4.0),
                    blurRadius: 6.0,
                    color: Colors.black,
                  ),
                ]),
          ),
        )
      ],
    ),
  );
}
