import 'package:flutter/material.dart';

import 'ui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

// Link meal, response_detail and response_filter: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=52959"
// for meal and response filter change the json :
// {
//   "meals": [
//     {
//       "idMeal": "52771",
//       "strMeal": "Spicy Arrabiata Penne",
//       "strCategory": "Vegetarian",
//       "strInstructions": "Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes.\r\nIn a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil.\r\nDrain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.",
//       "strMealThumb": "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg"
//     }
//   ]
// }

// 1. Add package"
// 2. Create folder"
// 3. Create file"
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Receipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
