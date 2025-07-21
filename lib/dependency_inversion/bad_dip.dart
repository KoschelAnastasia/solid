class Lamp {
  bool _glow = false;

  turnOn() {
    _glow = true;
    print('Lampe an. $_glow');
    return _glow;
  }

  turnOff() {
    _glow = false;
    print('Lampe aus. $_glow');
    return _glow;
  }
}

class Switcher {
  final Lamp lamp;
  bool _pressed = false;

  Switcher({required this.lamp});

  pressedSwitcher() {
    _pressed = !_pressed;

    if (_pressed) {
      lamp.turnOn();
      print(_pressed);
    } else {
      lamp.turnOff();
      print('$_pressed');
    }
  }
}

void main() {
  final lamp = Lamp();

  final switcher = Switcher(lamp: lamp);

  switcher.pressedSwitcher();
}
