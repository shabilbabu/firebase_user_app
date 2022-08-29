class UserModel {
  String id;
  String? name;
  String? number;
  String? work;
  String? age;
  String? image;

  UserModel(
      {this.id = '',
      required this.name,
      required this.number,
      required this.work,
      required this.age,
      required this.image});

  Map<String, dynamic> tojason() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'work': work,
      'age': age,
      'image' : image
    };
  }

  static UserModel fromJason(Map<String, dynamic> jasonData) {
    return UserModel(
        id: jasonData['id'],
        name: jasonData['name'],
        number: jasonData['number'],
        work: jasonData['work'],
        age: jasonData['age'],
        image: jasonData['image']);
  }
}
