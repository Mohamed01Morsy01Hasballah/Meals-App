class IngredientModel {
  List<Meal>? meals;

  IngredientModel({this.meals});

  IngredientModel.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = <Meal>[];
      json['meals'].forEach((v) {
        meals!.add(new Meal.fromJson(v));
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

class Meal {
  String? idIngredient;
  String? strIngredient;
  String? strDescription;
  String? strType;

  Meal(
      {this.idIngredient,
        this.strIngredient,
        this.strDescription,
        this.strType});

  Meal.fromJson(Map<String, dynamic> json) {
    idIngredient = json['idIngredient'];
    strIngredient = json['strIngredient'];
    strDescription = json['strDescription'];
    strType = json['strType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idIngredient'] = this.idIngredient;
    data['strIngredient'] = this.strIngredient;
    data['strDescription'] = this.strDescription;
    data['strType'] = this.strType;
    return data;
  }
}