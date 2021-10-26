import 'package:alarmy/components/alarm_card.dart';
import 'package:alarmy/models/alarm_model.dart';
import 'package:alarmy/views/add_alarm.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
	const HomePage({ Key? key }) : super(key: key);

	@override
	_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: SingleChildScrollView(
				padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [

						Row(
							children: [
								const Text("Alarms", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
								const Spacer(),
								ElevatedButton(
									onPressed: () {
										Navigator.push(
											context,
											MaterialPageRoute(builder: (context) => const AddAlarm()),
										);

									},
									child: const Icon(Icons.add, color: Colors.grey, size: 26),
									
									style: ElevatedButton.styleFrom(
										shape: const CircleBorder(),
										padding: const EdgeInsets.all(10),
										primary: Colors.white,
									
									),
								)
							],
						),

						for(Alarm alarm in alarmTestModel) ... [
							const SizedBox(height: 25),
							AlarmCard(title: alarm.title, time: alarm.time, isEnabled: alarm.isEnabled, weekDays: alarm.weekDays, onSwitchAlarm: (value) {
								setState(() {
									alarm.isEnabled = value;
								});
							}),
						]

						/*
						for (String alarmName in _alarmsTest) ... [
							const SizedBox(height: 25),
							AlarmCard(title: alarmName, time: DateTime(2020, 10, 21, 15, 27), isEnabled: true, onSwitchAlarm: (value) {
								print(value);
							}),
						],*/


						
					],
				),
			),
			backgroundColor: const Color(0xfff4f1f4),
		
		);
	}
}