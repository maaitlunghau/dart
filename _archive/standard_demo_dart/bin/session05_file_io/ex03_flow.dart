/*
	try -> Success -> Data 			-> finally
	try -> IOException -> handle	-> finally

	+ File("data.txt")
        -> create File object

    + read
        -> File must exist.

    + write
        -> File does not exist -> create new
		-> File already exists → overwrite (default)
*/

import 'dart:io';


void main(List<String> args) {
	// 1. Test 1 (comment statement before 'Test2')
	File file = File("bin/session05_file_io/data.txt");

	//2. Test 2 (Enable statement before run)
	// File file = File("bin/session05_file_io/not_found.txt");
	
	// 2.2. Read File
	try {
		String data = file.readAsStringSync();

		// Display data
		print("2.2. Read File -> File content => $data");

	} on IOException {
		// Handle file exception
		print("2.2. Read File -> File not found.");
	} finally {
		print("File operation completed.");
	}
}