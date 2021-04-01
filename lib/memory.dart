class Memory {
  String result = '0';

  Memory() {
    _clear();
  }

  void _clear() {
    result = '0';
  }

  void applyCommand(String command) {
    if (command == 'AC') {
      _clear();
    } else if (command == 'DEL') {
      _deleteEndDigit();
    } else {
      _addDigit(command);
    }
  }

  void _deleteEndDigit() {
    result = result.length > 1 ? result.substring(0, result.length - 1) : '0';
  }

  void _addDigit(String digit) {
    if (result.contains('.') && digit == '.') digit = '';
    if (result == '0' && digit != '.') result = '';

    result += digit;
  }
}
