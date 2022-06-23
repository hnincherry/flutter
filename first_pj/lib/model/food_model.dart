class FoodModel {
  //declare variables
  int? id;
  String? foodName;

  //Argument Constructor
  FoodModel({this.id, this.foodName});

  //convert object to Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'foodName': foodName};
  }

  //convert Map to Object
  factory FoodModel.fromMap(Map<String, dynamic> map) {
    return FoodModel(
      id: map['id'],
      foodName: map['foodName'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return "FoodModel(id: $id, foodName: $foodName)";
    //return "{id: $id, foodName: $foodName}";
  }
}
