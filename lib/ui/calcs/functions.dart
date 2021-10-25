class Functions {
  // ignore: non_constant_identifier_names
  static double CalcBMI(int weight, int height, int metric) {
    if (weight == 0 || height == 0) {
      return 0;
    }
    if (metric == 1) {
      weight = weight * 703;
    }
    return (weight / (height * height));
  }

  // edit stats.dart tp accept all stats and simply create a stats object
  // ignore: non_constant_identifier_names
  static double CalcBFP(int weight, int height, int age, int sex) {
    double bmi = Functions.CalcBMI(weight, height, 1);

    // needs refactoring:
    if (weight == 0 || height == 0 || age == 0) {
      return 0;
    }
    if (sex == 1) {
      return 1.2 * bmi + 0.23 * age - 16.2;
    } else if (sex == 2) {
      return 1.2 * bmi + 0.23 * age - 5.4;
    } else if (sex == 3) {
      return 1.51 * bmi - 0.7 * age - 2.2;
    } else if (sex == 4) {
      return 1.51 * bmi - 0.7 * age + 1.4;
    }

    return (0);
  }
}
