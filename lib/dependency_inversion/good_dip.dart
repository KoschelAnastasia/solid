abstract class Devise {
  bool turnOn();
  bool turnOff();
}

class Lamp implements Devise {
  bool _glows = false;

  @override
  bool turnOn() {
    _glows = true;
    print('Lampe an. $_glows');
    return _glows;
  }

  @override
  bool turnOff() {
    _glows = false;
    print('Lampe aus. $_glows');
    return _glows;
  }
}

class Switcher {
  final Devise devise;
  bool _pressed = false;

  Switcher({required this.devise});

  pressedSwitcher() {
    _pressed = !_pressed;
    if (_pressed) {
      devise.turnOn();
      print('$_pressed');
    } else {
      devise.turnOff();
      print('$_pressed');
    }
  }
}

void main() {
  final Lamp lamp = Lamp();
  final Switcher switcher = Switcher(devise: lamp);

  switcher.pressedSwitcher();
  switcher.pressedSwitcher();
}
