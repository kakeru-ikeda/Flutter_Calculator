import 'package:flutter/material.dart';

class Keymaps {
  static Map<int, Map<int, Map<String, Object>>> keymap = {
    0: {
      0: {'symbol': 'AC', 'type': 'clear'},
      1: {'symbol': '( )', 'type': 'brackets'},
      2: {'symbol': '%', 'type': 'sign'},
      3: {'symbol': '÷', 'type': 'sign'}
    },
    1: {
      0: {'symbol': '7', 'type': 'number'},
      1: {'symbol': '8', 'type': 'number'},
      2: {'symbol': '9', 'type': 'number'},
      3: {'symbol': '×', 'type': 'sign'}
    },
    2: {
      0: {'symbol': '4', 'type': 'number'},
      1: {'symbol': '5', 'type': 'number'},
      2: {'symbol': '6', 'type': 'number'},
      3: {'symbol': '-', 'type': 'sign'}
    },
    3: {
      0: {'symbol': '1', 'type': 'number'},
      1: {'symbol': '2', 'type': 'number'},
      2: {'symbol': '3', 'type': 'number'},
      3: {'symbol': '+', 'type': 'sign'}
    },
    4: {
      0: {'symbol': '0', 'type': 'number'},
      1: {'symbol': '.', 'type': 'period'},
      2: {'symbol': const Icon(Icons.backspace), 'type': 'backspace'},
      3: {'symbol': '=', 'type': 'equal'}
    }
  };

  static Map rink = {
    '0': {'symbol': '0', 'type': 'number'},
    '1': {'symbol': '1', 'type': 'number'},
    '2': {'symbol': '2', 'type': 'number'},
    '3': {'symbol': '3', 'type': 'number'},
    '4': {'symbol': '4', 'type': 'number'},
    '5': {'symbol': '5', 'type': 'number'},
    '6': {'symbol': '6', 'type': 'number'},
    '7': {'symbol': '7', 'type': 'number'},
    '8': {'symbol': '8', 'type': 'number'},
    '9': {'symbol': '9', 'type': 'number'},
    '.': {'symbol': '.', 'type': 'period'}
  };
}
