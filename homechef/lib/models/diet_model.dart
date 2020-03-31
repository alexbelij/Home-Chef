import 'package:homechef/models/recipe_model.dart';

class Diet {
  String imageUrl;
  String name;
  String description;
  List<Recipe> recipes;

  Diet({
    this.imageUrl,
    this.name,
    this.description,
    this.recipes,
  });
}

final List<Recipe> recipes = [
  Recipe(
    id: '1',
    imageUrl: 'assets/imgs/food4.jpg',
    name: 'Sushi',
    description: 'Lorem ipsum dolor sit amet.',
    ingredients: [],
    instruction: []
  ),
  Recipe(
    id: '2',
    imageUrl: 'assets/imgs/food5.jpg',
    name: 'Yellow Curry',
    description: 'Lorem ipsum dolor sit amet.',
    ingredients: [],
    instruction: []
  ),
  Recipe(
    id: '3',
    imageUrl: 'assets/imgs/food6.jpg',
    name: 'Cheeseburger',
    description: 'Lorem ipsum dolor sit amet.',
    ingredients: [],
    instruction: []
  ),
];

final List<Diet> diets = [
  Diet(
    imageUrl: 'assets/imgs/food8.jpg',
    name: 'Gluten Free',
    description: 'Eliminating gluten means avoiding wheat, barley, rye, and other gluten-containing grains and foods made from them',
    recipes: recipes,
    ),
  Diet(
    imageUrl: 'assets/imgs/food9.jpg',
    name: 'Keto',
    description: 'High fat, protein-rich foods are acceptable and high carbohydrate foods are not.',
    recipes: recipes,
    ),
  Diet(
    imageUrl: 'assets/imgs/food8.jpg',
    name: 'Vegan',
    description: 'Lorem ipsum dolor sit amet.',
    recipes: recipes,
    ),

  Diet(
    imageUrl: 'assets/imgs/food10.jpg',
    name: 'Vegetarian',
    description: 'No ingredients may contain meat or meat by-products, such as bones or gelatin.',
    recipes: recipes,
    ),

    Diet(
    imageUrl: 'assets/imgs/food10.jpg',
    name: 'Lacto-Vegetarian',
    description: 'All ingredients must be vegetarian and none of the ingredients can be or contain egg.',
    recipes: recipes,
    ),

    Diet(
    imageUrl: 'assets/imgs/food10.jpg',
    name: 'Ovo-Vegetarian',
    description: 'All ingredients must be vegetarian and none of the ingredients can be or contain dairy.',
    recipes: recipes,
    ),
 
    Diet(
    imageUrl: 'assets/imgs/food10.jpg',
    name: 'Pescetarian',
    description: 'Everything is allowed except meat and meat by-products - some pescetarians eat eggs and dairy, some do not.',
    recipes: recipes,
    ),

    Diet(
    imageUrl: 'assets/imgs/food10.jpg',
    name: 'Paleo',
    description: 'Ingredients not allowed include legumes (e.g. beans and lentils), grains, dairy, refined sugar, and processed foods.',
    recipes: recipes,
    ),

    Diet(
    imageUrl: 'assets/imgs/food10.jpg',
    name: 'Primal',
    description: 'Very similar to Paleo, except dairy is allowed ',
    recipes: recipes,
    ),

    Diet(
    imageUrl: 'assets/imgs/food10.jpg',
    name: 'Whole30',
    description: 'Ingredients not allowed include added sweeteners (natural and artificial, ' + 
                    'except small amounts of fruit juice), dairy (except clarified butter or ghee), alcohol, grains, legumes (except green beans, sugar snap peas, and snow peas), ' + 
                    'and food additives, such as carrageenan, MSG, and sulfites.',
    recipes: recipes,
    ),
];