import 'package:flutter/material.dart';

class Alarm {
	final String title;
	final DateTime time;
	bool isEnabled;
	final List<String> weekDays;

	Alarm({required this.title, required this.time, required this.isEnabled, required this.weekDays});
}

List alarmTestModel = [
	Alarm(title: "Wake up", time: DateTime.now().add(const Duration(hours: 25)), isEnabled: true, weekDays: ["1", "2", "6", "7"]),
	Alarm(title: "Sveglia del lavoro", time: DateTime.now().add(const Duration(hours: 255)), isEnabled: true, weekDays: ["1", "3"]),
	Alarm(title: "Routine", time: DateTime.now().add(const Duration(hours: 122)), isEnabled: true, weekDays: ["4", "5"]),
];