// Die Idee ist einfach: Nicht alle Vögel brauchen fly(). Deshalb zwingen wir den gesamten Basistyp Bird nicht dazu,
// das Fliegen zu „versprechen“.
//
// Stattdessen teilen wir den Vertrag auf: Es gibt einen allgemeinen Typ Bird für gemeinsames Verhalten
// und FlyingBird für Vögel, die tatsächlich fliegen können. So stellen wir sicher: Jede FlyingBird kann wirklich fly() ausführen,
// während eine normale Bird dazu nicht verpflichtet ist.
//
// Was bringt uns das?
//
// - Wir erhalten den Vertrag: Clients, die Flugverhalten benötigen, arbeiten mit FlyingBird und erleben keine Überraschungen.
//
// - Nicht fliegende Vögel, zum Beispiel Penguin, implementieren fly() nicht mehr und müssen keine Exceptions werfen.
//
// - Das LSP wird eingehalten: Subtypen schwächen keine Nachbedingungen ab und verletzen keine Invarianten des Basistyps.
//
// - Als zusätzlicher Vorteil entspricht diese Lösung auch dem ISP: Clients hängen nur von dem Interface ab, das sie tatsächlich benötigen.
//
// Am Ende ist der Code vorhersehbar: Duck ist eine FlyingBird und kann fliegen. Penguin ist einfach eine Bird
// und versucht nicht, „über eine Exception zu fliegen“.

abstract class Bird {
  void eat() => print('Bird is eating');
}

abstract class FlyingBird extends Bird {
  void fly();
}

class Duck extends FlyingBird {
  @override
  void fly() => print('Duck is flying');
  @override
  void eat() => print('Eat like a duck');
}

class Penguin extends Bird {
  void swim() => print('Penguin is swimming');
  @override
  void eat() => print('Eat like a penguin');
}
