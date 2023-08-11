import 'dart:convert';
import 'dart:io';

String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

dynamic fixtureFromJson(String name) => json.decode(fixture(name));
