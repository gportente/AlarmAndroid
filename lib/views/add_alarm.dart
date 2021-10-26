import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class AddAlarm extends StatefulWidget {
	const AddAlarm({ Key? key }) : super(key: key);

	@override
	_AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
	final List _currentWeekDays = [];
	final List<String> _weekDays = ["Lun", "Mar", "Mer", "Gio", "Ven", "Sab", "Dom"];

	DateTime _alarmDateTime = DateTime.now();
	String _alarmName = "";
	
	@override
	void initState() {
		super.initState();


		/*
		WidgetsBinding.instance!.addPostFrameCallback((_) {
			Navigator.of(context).push(
				showPicker(
					context: context,
					value: _time,
					onChange: (newTime) {
						print(newTime);
					},
				),
			);
		});
		*/

	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				centerTitle: true,
				title: const Text("Aggiungi Sveglia", style: TextStyle(fontSize: 16, color: Colors.black)),
				//elevation: 0.0,
				backgroundColor: Colors.white,
				iconTheme: const IconThemeData(
					color: Colors.black
				),
				actions: [
					IconButton(
						onPressed: () {
							print("Alarm Name: $_alarmName");
							print("Week Days: $_currentWeekDays");
							print("Hour: $_currentWeekDays");
						},
						icon: const Icon(Icons.add_alarm),
					)
				],
			),
			body: SingleChildScrollView(
				padding: const EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 25),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						const SizedBox(height: 15),
						TimePickerSpinner(
							time: _alarmDateTime,
							normalTextStyle: TextStyle(fontSize: 32, color: Colors.black.withOpacity(0.1)),
							spacing: 75,
							isForce2Digits: true,
							onTimeChange: (dateTime) {
								_alarmDateTime = dateTime;
							},
						),

						const SizedBox(height: 15),
						const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
						const SizedBox(height: 15),

						TextField(
							onChanged: (value) {
								_alarmName = value;
							},
							decoration: const InputDecoration(
								border: OutlineInputBorder(
									borderRadius: BorderRadius.all(Radius.circular(10))
								),
								prefixIcon: Icon(Icons.edit),
								isDense: true,
							),
						),

						const SizedBox(height: 25),
						const Text("Repeat", style: TextStyle(fontWeight: FontWeight.bold)),
						const SizedBox(height: 15),

						Wrap(
							runSpacing: 10,
							crossAxisAlignment: WrapCrossAlignment.center,
							//alignment: WrapAlignment.center,
							// direction: Axis.vertical,
							children: _weekDays.asMap().entries.map<Widget>((MapEntry map) => _buildWeekDay(map.key)).toList(),
						),
					],
				),
			),
		);
	}

	Widget _buildWeekDay(int index) {
		return GestureDetector(
			child: Container(
				margin: const EdgeInsets.only(right: 10),
				padding: const EdgeInsets.all(8),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						Text(_weekDays[index], style: TextStyle(color: _currentWeekDays.contains(_weekDays[index]) ? Colors.white : Colors.black, fontSize: 11, fontWeight: FontWeight.bold)),
					],
				),
				height: 50,
				decoration: BoxDecoration(
					borderRadius: const BorderRadius.all(Radius.circular(10)),
					border: Border.all(color: Colors.grey.withOpacity(0.2)),
					color: _currentWeekDays.contains(_weekDays[index]) ? const Color(0xffc353ff) : Colors.white,
					
				),
			),
			onTap: () {
				
                if(_currentWeekDays.contains(_weekDays[index])) {
                    setState(() => _currentWeekDays.remove(_weekDays[index]));
                    return;
                }

                setState(() => _currentWeekDays.add(_weekDays[index]));
            },
		);
	}
}