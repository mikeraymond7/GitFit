const String tableStats = 'stats';

class StatsFields {
  static final List<String> values = [id, weight, height, bmi];

  static const String id = '_id';
  static const String weight = 'weight';
  static const String height = 'height';
  static const String bmi = 'bmi';
}

class Stats {
  final int? id;
  final int weight;
  final int height;
  final int bmi;

  const Stats({
    this.id,
    required this.weight,
    required this.height,
    required this.bmi,
  });

  Stats copy({
    int? id,
    int? weight,
    int? height,
    int? bmi,
  }) =>
      Stats(
        id: id ?? this.id,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        bmi: bmi ?? this.bmi,
      );

  static Stats fromJson(Map<String, Object?> json) => Stats(
        id: json[StatsFields.id] as int?,
        weight: json[StatsFields.weight] as int,
        height: json[StatsFields.height] as int,
        bmi: json[StatsFields.bmi] as int,
      );

  Map<String, Object?> toJson() => {
        StatsFields.id: id,
        StatsFields.weight: weight,
        StatsFields.height: height,
        StatsFields.bmi: bmi,
      };
}
