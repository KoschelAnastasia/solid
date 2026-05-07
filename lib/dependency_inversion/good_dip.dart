// Und direkt in den ersten Zeilen sehen wir genau die Abstraktion, die uns vorher gefehlt hat.
//
// Wir führen die abstrakte Klasse Device ein und lösen uns damit sofort von der Abhängigkeit zu einer konkreten Implementierung.
//
// Dadurch erreichen wir genau das, was wir erreichen wollten:
//
// 1) Das High-Level-Modul Switcher hängt nicht vom Low-Level-Modul Lamp ab.
//
// 2) Beide Arten von Modulen hängen von derselben Abstraktion ab: Device.
//
// 3) Die Abstraktion Device hängt nicht von Details ab. Abstraktionen gehören in der Regel zur höheren Ebene der Programmlogik.
//
// 4) Die Details, also konkrete Implementierungen wie zum Beispiel Lamp, hängen dagegen von der Abstraktion ab,
//    weil sie deren Methoden implementieren müssen: turnOn und turnOff.

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
