import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tvarkau_lietuva/main_screen.dart';

import 'data/models/report.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<Report> parseReports(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Report>((json) => Report.fromJson(json)).toList();
}

Future<List<Report>> fetchReports() async {
  final response = await http.get(Uri.parse('https://aad-backend.onrender.com/reports'));

  if (response.statusCode == 200) {
    return parseReports(response.body);
  } else {
    throw Exception('Failed to load reports');
  }
}

class _MyAppState extends State<MyApp> {
  late Future<List<Report>> futureReport;

  @override
  void initState() {
    super.initState();
    futureReport = fetchReports();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tvarkau Lietuva',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<Report>>(
            future: futureReport,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return MainScreen(
                  reports: snapshot.data!,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
    //const MainScreen(),);
  }
}
