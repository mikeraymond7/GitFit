//https://docs.flutter.dev/cookbook/networking/send-data
class Users {
  final String uname;
  final String name;
  final String dob;
  final String sex;

  Users(
      {required this.uname,
      required this.name,
      required this.dob,
      required this.sex});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      uname: json['uname'],
      name: json['name'],
      dob: json['dob'],
      sex: json['sex'],
    );
  }
}

class Stats {
  final String uname;
  final String sex;
  final int age;
  final int bmi;
  final int bfp;
  final int fat;
  final int lean;
  final int height;
  final int weight;

  Stats(
      {required this.uname,
      required this.sex,
      required this.age,
      required this.bmi,
      required this.bfp,
      required this.fat,
      required this.lean,
      required this.height,
      required this.weight});

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      uname: json['uname'],
      age: json['age'],
      sex: json['sex'],
      bmi: json['bmi'],
      bfp: json['bfp'],
      fat: json['fat'],
      lean: json['lean'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}

class Bmi {
  final String uname;
  final int bmi;
  final int height;
  final int weight;

  Bmi(
      {required this.uname,
      required this.bmi,
      required this.height,
      required this.weight});

  toJson() {
    return {
      'uname': uname,
      'weight': weight,
      'height': height,
      'bmi': bmi,
    };
  }
}

class Bfp {
  final String uname;
  final String sex;
  final int bfp;
  final int weight;
  final int height;
  final int age;
  final int lean;
  final int fat;

  Bfp(
      {required this.uname,
      required this.bfp,
      required this.sex,
      required this.weight,
      required this.height,
      required this.age,
      required this.lean,
      required this.fat});

  toJson() {
    return {
      'uname': uname,
      'sex': sex,
      'bfp': bfp,
      'weight': weight,
      'height': height,
      'age': age,
      'lean': lean,
      'fat': fat
    };
  }
}
