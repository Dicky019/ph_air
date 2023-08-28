import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'data_model.dart';
import 'firebase_options.dart';
import 'widget/status_ph_air.dart';
import 'widget/value_ph_air.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ...
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("PhAir");

    const loading = CircularProgressIndicator();

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("PH Air"),
          ),
          body: StreamBuilder(
            stream: ref.onValue,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: loading,
                );
              }

              final response = (snapshot.data?.snapshot.value) as Map;
              final data = DataModel.fromMap(response);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: StatusPhAirWidget(
                            isSensorPHAirKurang: data.isSensor1PHAirKurang,
                            isSensorPHAirLebih: data.isSensor1PHAirLebih,
                          ),
                        ),
                        Expanded(
                          child: StatusPhAirWidget(
                            isSensorPHAirKurang: data.isSensor2PHAirKurang,
                            isSensorPHAirLebih: data.isSensor2PHAirLebih,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ValuePhAirWidget(
                          title: "PH Mint",
                          color: Colors.green,
                          sensor: data.sensor1.toString(),
                        ),
                        ValuePhAirWidget(
                          title: "PH Pakchoy",
                          color: Colors.green,
                          sensor: data.sensor2.toString(),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
