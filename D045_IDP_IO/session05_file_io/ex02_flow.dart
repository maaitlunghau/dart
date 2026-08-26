/*
  Flow 1: Override and Append

    Existing File -> writeAsStringSync() -> Override -> FileMode.append -> Append
*/

import 'dart:io';

void main(List<String> args) {
	// 1. Create File
	File file = File("bin/session05_file_io/data.txt");

	//2. Write to file
	// Test 1: Override existing content
	file.writeAsStringSync("Java\n");

	//Test 2: Append data
	// file.writeAsStringSync(
	// 	"Dart\n",
	// 	mode: FileMode.append,
	// );

	//Test 3: Override mode again
	// file.writeAsStringSync("Flutter\n");

	// 2.4. Read all lines and display
	List<String> lines = file.readAsLinesSync();
	print("2.5. All lines => $lines");
}