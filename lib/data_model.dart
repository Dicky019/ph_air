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
      sensor1: double.tryParse(map['Sensor1'].toString()) ?? 0.0,
      sensor2:  double.tryParse(map['Sensor2'].toString()) ?? 0.0,
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
