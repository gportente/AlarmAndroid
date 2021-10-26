import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AlarmCard extends StatelessWidget {
	const AlarmCard({
		Key? key,
		required this.title,
		required this.time,
		required this.isEnabled,
		required this.weekDays,
		required this.onSwitchAlarm,

	}) : super(key: key);

	final String title;
	final DateTime time;
	final bool isEnabled;
	final List<String> weekDays;
	final Function(bool) onSwitchAlarm;

	@override
	Widget build(BuildContext context) {
		var _styleWeekDays = TextStyle(color: isEnabled ? Colors.white : Colors.grey, fontSize: 12);

		var now = DateTime.now();


		int currentWeekDay = now.weekday;
		int nextWeekDayAlarm = int.parse(weekDays.first);

		print(nextWeekDayAlarm);
		print("--------------------------");




	
		//print("$weekDays | current week day : ${now.weekday}");
		



/*
		var now = DateTime.now();
		var alarm = DateTime(now.year, now.month, now.day, time.hour, time.minute);

		*/

		//print("$now and $alarm");

		// print("difference isAfter: ${alarm.difference(now)}");



		/*
		if(alarm.isBefore(now)) {
			alarm.add(Duration(days: 1));
		}*/

		//print("$now and $alarm");

		/*
		if(alarm.isAfter(now)) {
			print("difference isAfter: ${now.difference(alarm)}");
		}
		else if(alarm.isBefore(now)) {
			print("difference isBefore: ${alarm.difference(now)}");
		}*/


		return Container(
			padding: const EdgeInsets.all(20),
			
			decoration: BoxDecoration(
				borderRadius: const BorderRadius.all(Radius.circular(15)),
				color: isEnabled ? const Color(0xffc353ff) : Colors.white,
				boxShadow: [
					BoxShadow(
						color: Colors.grey.withOpacity(0.5),
						spreadRadius: 5,
						blurRadius: 7,
						offset: const Offset(0, 3),
					)
				]
			),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Row(
						mainAxisAlignment: MainAxisAlignment.start,
						children: [
							for(var day in weekDays) ... [
								Text(weekIndexToName(int.parse(day)), style: _styleWeekDays),
								const SizedBox(width: 10),
							],
							
							// const Spacer(),
							// Text("10hrs 27min", style: _styleWeekDays),
						],
					),
					const SizedBox(height: 10),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: [
							Text("${time.hour.toString().padLeft(2, "0")}:${time.minute.toString().padLeft(2, "0")}", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: isEnabled ? Colors.white : const Color(0xff6f6f6f))),
							const Spacer(),
							FlutterSwitch(
								width: 45.0,
								height: 25.0,
								valueFontSize: 12.0,
								toggleSize: 18.0,
								toggleColor: isEnabled ? const Color(0xffc353ff) : Colors.white,
								activeColor: Colors.white,
								inactiveColor: const Color(0xffc353ff).withOpacity(0.3),
								
								value: isEnabled,
								onToggle: onSwitchAlarm,
							)
						],
					),
					
					const SizedBox(height: 5),
					Divider(thickness: 0.6, color: isEnabled ? Colors.white : Colors.grey),
					Text(title, style: TextStyle(color: isEnabled ? Colors.white : Colors.grey)),
				],
			)
			
		);
	}
}

String weekIndexToName(int weekIndex) {
	switch(weekIndex) {
		case 1: return "Lun";
		case 2: return "Mar";
		case 3: return "Mer";
		case 4: return "Gio";
		case 5: return "Ven";
		case 6: return "Sab";
		case 7: return "Dom";
		
		default: return "Unk";
	}
}