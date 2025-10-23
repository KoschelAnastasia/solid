// И вот она с первых строк та самая абстракция, которой нам не хватало, мы вводим абстрактный класс Devise и сразу же
// избавляемся от зависимости от конкретной реализации и получаем то, чего хотели добиться:
// 1) Модуль верхнего уровня Switcher не зависит от модуля нижнего уровня Lamp.
// 2) Оба типа модулей зависят от одной и той же абстракции Devise.
// 3) Абстракция Devise не зависит от деталей они обычно принадлежат верхнему уровню политики
// 4) Зато детали, то есть конкретные реализации, например Lamp, зависят от абстракции, потому что обязаны реализовать
// её методы (turnOn / turnOff).

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
