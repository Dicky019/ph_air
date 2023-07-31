class DataModel {
  final double sensor1;
  final double sensor2;

  const DataModel({
    required this.sensor1,
    required this.sensor2,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Sensor1': sensor1,
      'Sensor2': sensor2,
    };
  }

  bool get isSensor1PHAirKurang => sensor1 <= 5.5;
  bool get isSensor1PHAirLebih => sensor1 >= 6.0;
  bool get isSensor2PHAirKurang => sensor2 <= 6.8;
  bool get isSensor2PHAirLebih => sensor2 >= 7.2;

  factory DataModel.fromMap(Map<dynamic, dynamic> map) {
    return DataModel(
      sensor1: map['Sensor1'] as double,
      sensor2: map['Sensor2'] as double,
    );
  }

  DataModel copyWith({
    double? sensor1,
    double? sensor2,
  }) {
    return DataModel(
      sensor1: sensor1 ?? this.sensor1,
      sensor2: sensor2 ?? this.sensor2,
    );
  }
}
