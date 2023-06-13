import 'dart:ui';

class UIColor {
  static String _theme = 'light';

  static final Map _color = {
    'common': {
      'equal': const Color.fromARGB(255, 70, 179, 234),
      'clear': const Color.fromARGB(255, 255, 193, 7),
      'sign': const Color.fromARGB(255, 186, 226, 255),
      'brackets': const Color.fromARGB(255, 186, 226, 255),
    },
    'light': {
      'field': const Color.fromARGB(255, 232, 253, 255),
      'fieldText': const Color.fromARGB(255, 73, 73, 73),
      'numpad': const Color.fromARGB(255, 255, 255, 248),
      'numpadText': const Color.fromARGB(255, 73, 73, 73),
      'btnFore': const Color.fromARGB(255, 72, 72, 72),
      'default': const Color.fromARGB(255, 255, 255, 255),
    },
    'dark': {
      'field': const Color.fromARGB(255, 67, 65, 65),
      'fieldText': const Color.fromARGB(255, 255, 255, 255),
      'numpad': const Color.fromARGB(255, 161, 161, 161),
      'numpadText': const Color.fromARGB(255, 255, 255, 255),
      'btnFore': const Color.fromARGB(255, 255, 255, 255),
      'default': const Color.fromARGB(255, 116, 116, 116),
    }
  };

  static final Map<dynamic, dynamic> _targets = {
    'field': setColor(_theme, 'field'),
    'fieldText': setColor(_theme, 'fieldText'),
    'numpad': setColor(_theme, 'numpad'),
    'numpadText': setColor(_theme, 'numpadText'),
    'btnFore': setColor(_theme, 'btnFore'),
    'default': setColor(_theme, 'default'),
  };

  static getTarget(target) {
    return _targets[target];
  }

  static setCommonColor(theme, type) {
    if (type == 'number' || type == 'period' || type == 'backspace') {
      return _color[theme]['default'];
    } else {
      return setColor('common', type);
    }
  }

  static setColor(theme, target) {
    return _color[theme][target];
  }

  static resetColors(theme) {
    _targets.forEach((key, value) {
      _targets.update(key, (value) => setColor(theme, key));
    });
  }

  static getTheme() {
    return _theme;
  }

  static setTheme(theme) {
    _theme = _theme == 'light' ? 'dark' : 'light';
  }
}
