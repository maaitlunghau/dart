/*
  Flow 1: Create new file to write
*/

import 'dart:io';

void main(List<String> args) {
	//1. Create File
	File file = File("bin/session05_file_io/data.txt");

	//2. Write to file
	file.writeAsStringSync("Hello File I/O.\n");

	//2. Read all lines and display
	List<String> lines = file.readAsLinesSync();
	print("2.5. All lines => $lines");
}