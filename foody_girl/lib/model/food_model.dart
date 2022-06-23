class FoodModel {
  int? id;
  String? foodName;
  String? category;
  int? qty;

  FoodModel({this.id, this.foodName, this.category, this.qty});

  Map<String, dynamic> toMap() {
    return {'id': id, 'foodName': foodName, 'category': category, 'qty': qty};
  }

  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
        id: map['id'],
        foodName: map['foodName'],
        category: map['category'],
        qty: map['qty']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return "FoodModel(id: $id,foodName: $foodName,category: $category,qty: $qty)";
  }
}
