// Dependency Inversion:

// Kurz gesagt: Klassen sollten von Abstraktionen abhängen, nicht von konkreten Details.
//
// Etwas ausführlicher: Module auf höherer Ebene sollten nicht von Modulen auf niedrigerer Ebene abhängen. Beide Arten
// von Modulen sollten von Abstraktionen abhängen.
//
// Abstraktionen sollten nicht von Details abhängen. Details sollten von Abstraktionen abhängen. Schauen wir uns an,
// was das in der Praxis bedeutet:
//
// Vor uns sehen wir zwei Klassen: Lamp und Switcher. Die Klasse Lamp hat zwei Methoden zum Ein- und Ausschalten.
// Diese Methoden verändern den Zustand einer booleschen Variable.
//
// Die Klasse Switcher nimmt ein Lamp-Objekt entgegen und besitzt eine eigene Methode pressedSwitcher. Diese Methode
// ändert den Zustand einer Variable, die signalisiert, ob der Switcher gedrückt wurde. Außerdem verwendet sie die
// Methoden des Lamp-Objekts, um die Lampe abhängig vom aktuellen Zustand ein- oder auszuschalten.
//
// Wenn wir den Code ausführen, sehen wir, dass zunächst alles funktioniert. Wir können die Lampe ein- und ausschalten
// und haben auf den ersten Blick keine großen Probleme.
//
// Aber es gibt ein Problem, und dieses Problem ist wichtig:
//
// Unsere Klasse Switcher ist eine sehr stark eingeschränkte Klasse. Sie ist ausschließlich auf ein konkretes Objekt ausgelegt.
//
// Wenn wir morgen entscheiden, dass nicht nur eine Lampe ein- und ausgeschaltet werden soll, sondern zum Beispiel auch
// ein Ventilator, dann müssten wir die Klasse Switcher modifizieren. Dadurch verletzen wir nicht nur das DIP,
// sondern auch das OCP.
//
// Denn Klassen sollten offen für Erweiterung, aber geschlossen für Modifikation sein. Im Grunde haben wir hier also Code,
// der sich schlecht erweitern lässt.
//
// Wie können wir das verbessern? Wechseln wir dazu in die Datei lib\dependency_inversion\good_dip.dart und schauen uns das an.

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
  for (var i = 0; i < 5; i++) {
    switcher.pressedSwitcher();
  }
}
