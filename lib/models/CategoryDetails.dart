class DetailsCategory {
  List<Mealss>? meals;

  DetailsCategory({this.meals});

  DetailsCategory.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <Mealss>[];
      json['meals'].forEach((v) {
        meals!.add(new Mealss.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meals != null) {
      data['meals'] = this.meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mealss {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Mealss({this.strMeal, this.strMealThumb, this.idMeal});

  Mealss.fromJson(Map<String, dynamic> json) {
    strMeal = json['strMeal'];
    strMealThumb = json['strMealThumb'];
    idMeal = json['idMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strMeal'] = this.strMeal;
    data['strMealThumb'] = this.strMealThumb;
    data['idMeal'] = this.idMeal;
    return data;
  }
}
