import 'package:flutter/material.dart';

class SleepGoal extends StatelessWidget {
	const SleepGoal({
		Key? key,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Container(
			//height: 120,
			margin: const EdgeInsets.only(left: 20, right: 20),
			padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 15),
			decoration: BoxDecoration(
				borderRadius: const BorderRadius.all(Radius.circular(20)),
				border: Border.all(color: Colors.grey.withOpacity(0.2)),
				color: Colors.white,
				boxShadow: [
					BoxShadow(
						color: Colors.grey.withOpacity(0.5),
						
					),
				],
			),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							const Text("Sleep Time", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
							const SizedBox(height: 10),
							Row(
								crossAxisAlignment: CrossAxisAlignment.baseline,
													textBaseline: TextBaseline.alphabetic,
								children: const [
									Text("4", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
									Text("hr"),
									Text("30", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
									Text("min"),
								],
							),

							const SizedBox(height: 15),

							Container(
								padding: const EdgeInsets.all(8),
								width: 80,
								decoration: const BoxDecoration(
									borderRadius: BorderRadius.all(Radius.circular(8)),
									color: Color(0xffc353ff),
								),
								child: const Center(child: Text("Set Time", style: TextStyle(color: Colors.white, fontSize: 12))),
							)

						],
					),

					const SizedBox(width: 35),


					Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							Container(
								padding: const EdgeInsets.all(10),
								decoration: BoxDecoration(
									borderRadius: const BorderRadius.all(Radius.circular(15)),
									border: Border.all(color: Colors.grey.withOpacity(0.2))
								),

								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Row(
											children: [
												const CircleAvatar(child: Icon(Icons.warning_outlined, size: 14, color: Colors.white), radius: 14, backgroundColor: Colors.orange),
												const SizedBox(width: 10),
												Column(
													crossAxisAlignment: CrossAxisAlignment.start,
													children: const [
														Text("56 %", style: TextStyle(fontWeight: FontWeight.bold)),
														Text("of your goal", style: TextStyle(fontSize: 11)),
													],
												)
											],
										),

										const SizedBox(height: 17),

										const Text("Sleep goal", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 11)),
										const Text("This set under your sleep goal", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black26, fontSize: 10)),
									],
								),
							)
						],
					)
				],
			),
		);
	}
}