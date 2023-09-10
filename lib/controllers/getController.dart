import 'package:get/get.dart';

import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../models/settings.dart';

class GetController extends GetxController {
  static GetController get to => Get.find();

  Rx<Settings> settings = Settings().obs;
  List<Meal> filterMeals(Settings settings) {
    this.settings.value = settings;
    return dummyMeals.where((meal) {
      final filterGluten =
          this.settings.value.isGlutenFree && !meal.isGlutenFree;
      final filterLactose =
          this.settings.value.isLactoseFree && !meal.isLactoseFree;
      final filterVegan = this.settings.value.isVegan && !meal.isVegan;
      final filterVegetarian =
          this.settings.value.isVegetarian && !meal.isVegetarian;
      return !filterGluten &&
          !filterLactose &&
          !filterVegan &&
          !filterVegetarian;
    }).toList();
  }
}
