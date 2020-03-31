import 'package:homechef/models/recipe_model.dart';

class Cuisine {
  String imageUrl;
  String name;
  String description;
  List<Recipe> recipes;

  Cuisine({
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

List<String> cuisine_list = [
  'African',
  'American',
  'British',
  'Cajun',
  'Caribbean',
  'Chinese',
  'Eastern European',
  'European',
  'French',
  'German',
  'Greek',
  'Indian',
  'Irish',
  'Italian',
  'Japanese',
  'Jewish',
  'Korean',
  'Latin American',
  'Mediterranean',
  'Mexican',
  'Middle Eastern',
  'Nordic',
  'Southern',
  'Spanish',
  'Thai',
  'Vietnamese',
];

List<Cuisine> cuisines = new List<Cuisine>.generate(cuisine_list.length, (int index) {
  print('assets/imgs/' + cuisine_list[index].replaceAll(' ', '').toLowerCase() + '.jpg');
  return new Cuisine(
    imageUrl: 'assets/imgs/' + cuisine_list[index].replaceAll(' ', '').toLowerCase() + '.jpg',
    name: cuisine_list[index],
    description: 'Lorem ipsum dolor sit amet.',
    recipes: recipes
  );
});



