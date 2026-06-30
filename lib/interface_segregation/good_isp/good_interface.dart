import 'programmer.dart';
import 'retired_person.dart';
// Wir teilen das große Interface in kleinere und spezifischere Interfaces auf und erstellen damit im Grunde wieder eine Klassenhierarchie.
// Dabei wird Worker als spezifisches Interface beziehungsweise als spezifischer Typ für arbeitende Personen verwendet.
// Worker kann alles, was Person kann, und erweitert dieses Verhalten um das, was in dieser konkreten Situation zusätzlich
// benötigt wird. Dadurch erreichen wir, dass nur eine konkrete Implementierung des Interfaces Worker, in unserem Fall Programmer,
// die Methode für das Arbeiten besitzt.
//
// Alle konkreten Implementierungen von Person, zum Beispiel RetiredPerson oder auch Child, falls wir später eine solche
// Klasse erstellen möchten, wissen nichts über Methoden, die sie selbst nicht verwenden, und können diese Methoden auch nicht aufrufen.
//
// Gut, wir haben jetzt besprochen, was das Interface Segregation Principle ist. Vielleicht entsteht jetzt aber eine andere Frage:
// Worin liegt eigentlich der Unterschied zwischen dem Liskov Substitution Principle und dem Interface Segregation Principle?
//
// Auf den ersten Blick wirken beide Prinzipien ähnlich. Beide haben mit Interfaces zu tun und beide scheinen zu sagen,
// dass Interfaces spezifischer gestaltet werden sollten. Das stimmt aber nur teilweise. Schauen wir uns den Unterschied genauer an:
//
// Der wichtigste Unterschied ist: Das Liskov Substitution Principle beschäftigt sich mit Verhalten. Wenn wir einer
// Unterklasse Funktionen geben, die nicht zu ihr passen, oder wenn wir Funktionen nicht korrekt implementieren,
// die sie laut Vertrag ausführen können müsste, dann verletzt die Unterklasse das erwartete Verhalten der Basisklasse.
// Das führt zu unvorhersehbaren logischen Fehlern. Beim LSP entwerfen wir also ein flexibles System, in dem eine Unterklasse
// als Instanz der Basisklasse eingesetzt werden kann, ohne Überraschungen im Verhalten zu verursachen.
//
// Beim Interface Segregation Principle ist der Schwerpunkt ein anderer. Wenn wir das ISP verletzen, bricht die Unterklasse
// nicht unbedingt das Verhalten, bekommt aber unnötige Abhängigkeiten aufgezwungen. Ihr werden Methoden vorgeschrieben,
// die sie eigentlich gar nicht benötigt. Wegen eines nicht ausreichend spezifischen Interfaces muss sie diese Methoden
// trotzdem implementieren, häufig nur mit leeren Platzhalter-Implementierungen.
//
// Zusammengefasst:
// Beim Liskov Substitution Principle liegt der Fokus auf dem Verhalten von Klassen und Unterklassen, damit das erwartete Ergebnis erhalten bleibt.
//
// Beim Interface Segregation Principle liegt der Fokus stärker auf der Struktur der Interfaces, also auf ihrer Klarheit und Isolation,
// damit keine unnötigen Abhängigkeiten erzwungen werden.

abstract class Person {
  void rest();
  void eat();
  void sleep();
  void exercise();
  void socialize();
  void read();
  void travel();
}

abstract class Worker extends Person {
  void work();
  void speakWithColleagues();
}

void main() {
  final Worker programmer = Programmer();
  programmer.work();
  programmer.eat();
  programmer.rest();
  programmer.sleep();

  print('\n---------------------------------\n');

  final Person retired = RetiredPerson();
  retired.rest();
  retired.eat();
  retired.sleep();
}
