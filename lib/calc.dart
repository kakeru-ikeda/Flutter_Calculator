import 'package:eval_ex/expression.dart';

class Calc {
  static String expression = '';
  static String history = '';
  static String lastInputValue = '';
  static String lastInputValueType = '';
  static int beginBracket = 0;
  static String status = '';

  static validation(symbol, type) {
    if (type == 'equal') {
      Calc.history = '${Calc.expression}=';
      Calc.expression = Calc.mainCalc(Calc.expression);
    } else if (type == 'clear') {
      beginBracket = 0;
      Calc.expression = '';
      Calc.history = '';
      Calc.status = '';
    } else if (type == 'backspace' && Calc.expression != '') {
      Calc.expression =
          Calc.expression.substring(0, (Calc.expression.length - 1));
    } else if (type == 'brackets') {
      // ignore: unrelated_type_equality_checks
      if ((beginBracket >= 1 && lastInputValue != '(') &&
          (beginBracket >= 1 && lastInputValueType != 'sign')) {
        beginBracket--;
        Calc.expression += ')';
        // ignore: unrelated_type_equality_checks
      } else if (lastInputValue == '(' ||
          Calc.expression == '' ||
          lastInputValue != '(') {
        beginBracket++;
        Calc.expression += '(';
      }
    } else if ((type == 'sign' && Calc.expression != '') &&
        (type == 'sign' && lastInputValueType != 'sign') &&
        (type == 'sign' && lastInputValue != '(')) {
      Calc.expression += symbol;
    } else if ((symbol == '-' && Calc.expression == '') ||
        (symbol == '-' && lastInputValue == '(') ||
        (type == 'period' && lastInputValueType != 'period') ||
        ((type == 'sign' && symbol != '%') && lastInputValue == '%')) {
      Calc.expression += symbol;
    } else if (type == 'number') {
      Calc.expression += symbol;
    } else {
      return;
    }

    try {
      lastInputValue = Calc.expression.substring(Calc.expression.length - 1);
      lastInputValueType = type;
    } catch (e) {}
  }

  static mainCalc(e) {
    // final symbol = ['+', '-', '*', '/', '(', ')'];
    final convertData_1st = {
      '×': '*',
      '÷': '/',
      '%': '*0.01*',
      '(': '*(',
      ')': ')*'
    };
    final convertData_2nd = {
      '-*': '-1*',
      '*+': '*1+',
      '*-': '*1-',
      '**': '*1*',
      '*/': '*1/',
      '(*(': '((',
      ')*)': '))',
      '*)': ')'
    };
    var replace = e;

    for (var entry in convertData_1st.entries) {
      replace = replace.replaceAll(entry.key, entry.value);
    }

    // print('1st:' + replace);

    for (var entry in convertData_2nd.entries) {
      replace = replace.replaceAll(entry.key, entry.value);
    }

    // print('2nd:' + replace);

    if (replace.substring(0, 1) == '*') {
      replace = replace.replaceFirst('*', '');
    }

    if (replace.substring(replace.length - 1, replace.length) == '*') {
      replace = replace.replaceFirst('*', '', replace.length - 1);
    }

    // print(replace);

    try {
      Expression exp = Expression(replace);
      status = 'Sucsess!';
      return exp.eval().toString();
    } catch (e) {
      status = e.toString();
      return "不正な式です。";
    }
  }
}
