import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'views/homepage.dart';

void main() {
  	runApp(const EntryPoint());
}

class EntryPoint extends StatelessWidget {
	const EntryPoint({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Alarmy',
			debugShowCheckedModeBanner: false,
			theme: ThemeData(
				primarySwatch: Colors.purple,
				textTheme: GoogleFonts.nanumGothicTextTheme(
					Theme.of(context).textTheme,
				),
			),
			home: const HomePage(),
		);
	}
}