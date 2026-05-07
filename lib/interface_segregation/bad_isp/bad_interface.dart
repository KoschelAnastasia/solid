import 'programmer.dart';
import 'retired_person.dart';

// Interface Segregation Principle:

// Kurz gesagt: Software-Einheiten sollten nicht von Methoden abhängen, die sie selbst nicht verwenden.
//
// Etwas ausführlicher: Im Kern sagt dieses Prinzip, dass wir zu große, also „fette“ Interfaces vermeiden sollten.
//
// Stattdessen sollten solche Interfaces in kleinere und spezifischere Interfaces aufgeteilt werden. Dadurch kennen
// Software-Einheiten nur die Methoden, die sie für ihre eigene Arbeit tatsächlich benötigen.
//
// Das Ergebnis: Wenn sich eine Methode in einem Interface ändert, müssen sich keine Software-Einheiten ändern,
// die diese Methode gar nicht verwenden.

//-------------------------------------------- !ACHTUNG!------------------------------------------------------------
// Wenn ihr dieses Prinzip ohne mich selbstständig durcharbeitet, empfehle ich euch, in einem zweiten Tab die konkrete Implementierung
// der abstrakten Klasse zu öffnen. So versteht ihr besser, worüber ich spreche.
//-------------------------------------------------------------------------------------------------------------------
//
// Schauen wir uns unser Interface genauer an. Das Interface Person enthält verschiedene Methoden, Zum Beispiel work(),
// rest() und eat(). Jetzt betrachten wir die konkreten Implementierungen dieses Interfaces in den Dateien programmer.dart und retired_person.dart.
// Im Grunde erzeugen wir mit diesen Unterklassen zwei Objekte: Programmer und RetiredPerson.
//
// Genau hier beginnt das eigentliche Problem.
//
// Unser Interface ist zu groß. Es enthält unter anderem die Methode work(). Beide Unterklassen kennen diese Methode,
// aber nur eine davon sollte sie wirklich implementieren: nämlich die Klasse Programmer.
//
// Die Klasse RetiredPerson kennt diese Methode ebenfalls und besitzt nur eine leere Implementierung, weil Rentner in
// der Logik unseres Programms nicht arbeiten sollen.
//
// Auf den ersten Blick könnte man sagen: Na gut, sie kennt die Methode eben. Was ist daran so schlimm? Schauen wir uns
// dafür aber die Funktion main genauer an und führen wir sie aus. Beim Lesen und Ausführen des Codes sehen wir,
// dass alle aufgerufenen Methoden für das Objekt Programmer funktionieren.
//
// Wenn wir jedoch dieselben Methoden für das Objekt RetiredPerson aufrufen, erkennen wir das Problem:
//
// Beim Aufruf von work() passiert nichts, weil es keine echte Implementierung dieser Methode gibt. Gleichzeitig entsteht
// aber auch kein Fehler, der uns signalisieren würde, dass etwas nicht stimmt. Stattdessen haben wir nur eine leere
// Platzhalter-Implementierung.
//
// Genau dadurch verletzen wir das ISP: Unser zu großes Interface gibt der Entität RetiredPerson Wissen
// über eine Methode, die sie für ihre Arbeit gar nicht benötigt.
//
// Wie lösen wir dieses Problem? Wechseln wir dazu in die Datei lib\interface_segregation\good_isp\good_interface.dart
// und schauen uns das an ...

abstract class Person {
  void work();
  void rest();
  void eat();
  void sleep();
  void exercise();
  void socialize();
  void read();
  void travel();
}

void main() {
  // Программист работает, как и положено
  Person programmer = Programmer();
  programmer.work();
  programmer.socialize();
  programmer.exercise();
  programmer.rest();
  programmer.sleep();

  print('\n---------------------------------------------------------------------------\n');

  // Пенсионер пытается работать, но реализации метода work нет
  // Но и ошибки не возникает

  Person retired = RetiredPerson();
  retired.work();

  retired.socialize();
  retired.exercise();
  retired.rest();
  retired.sleep();
}
