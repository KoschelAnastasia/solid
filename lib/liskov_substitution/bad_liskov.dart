// Liskov Substitution Principle (LSP):

// Kurz gesagt: Objekte einer Unterklasse sollten problemlos anstelle von Objekten der Basisklasse verwendet werden können,
// ohne überraschendes Verhalten zu verursachen.
//
// Etwas ausführlicher: Nach dem Liskov Substitutionsprinzip muss ein Basistyp durch seine Subtypen ersetzbar sein,
// ohne dass sich das erwartete Verhalten ändert.
//
// Dabei geht es um Verträge, also um Design by Contract. Das Prinzip legt Einschränkungen dafür fest,
// wie Vererbung mit solchen Verträgen zusammenspielt:
//
// - Unterklassen dürfen die Vorbedingungen der Basisklasse nicht verschärfen.
//
// - Unterklassen dürfen die Nachbedingungen der Basisklasse nicht abschwächen.
//
// - Invarianten der Basisklasse müssen auch in der Unterklasse erhalten bleiben.
//
// - Wenn die Basisklasse keine Mutatoren für ihre Eigenschaften vorsieht, sollte auch ein Subtyp keine solchen
// Mutatoren einführen.
//
// Schauen wir uns dazu ein klassisches Beispiel mit Vögeln an. Wir haben ein Basis-Interface Bird, das die Methode
// fly deklariert.
//
// Darauf basierend erstellen wir zwei Unterklassen: Duck und Penguin.
//
// Nach gesundem Menschenverstand kann eine Ente fliegen, ein Pinguin aber nicht. Aus Sicht des Codes sagt der Vertrag jedoch:
// „Jede Bird kann fly() ausführen“. Wenn wir diesen Vertrag nicht ändern und versuchen, das Problem zu umgehen,
// implementieren wir fly() in Penguin so, dass eine Exception geworfen wird.
//
// Genau hier entsteht die Verletzung des LSP:
// Wir schwächen faktisch die Nachbedingung der Methode fly() ab. Statt „die Methode wird ausgeführt“ erhalten wir:
// „die Methode wirft unter bestimmten Umständen einen Fehler“.
//
// In echtem Code führt das dazu, dass eine Funktion, die Bird entgegennimmt und fly() aufruft, beim Einsetzen von
// Penguin zur Laufzeit abstürzt. Das kann unvorhersehbare Folgen haben.
//
// Wie lösen wir dieses Problem? Wechseln wir dazu in die Datei lib\liskov_substitution\good_liskov.dart
// und schauen uns das an ...

abstract class Bird {
  void fly();
  void eat();
}

class Duck implements Bird {
  @override
  void fly() => print('Duck flying!');
  @override
  void eat() => print('Eat like a duck');
}

class Penguin implements Bird {
  @override
  void fly() => throw UnsupportedError("Penguins can't fly!");
  @override
  void eat() => print('Eat like a penguin');
}
