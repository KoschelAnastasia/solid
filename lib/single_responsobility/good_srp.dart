// Damit der Code einfacher zu warten ist, können wir dem SRP folgen.
// Konkret bedeutet das: Klassen und Funktionen sollten jeweils nur eine Verantwortung beziehungsweise eine Rolle haben.
//
// Durch diese Trennung der Verantwortlichkeiten erreichen wir, dass wir als Entwickler im Idealfall nur einen einzigen Grund haben,
// einen bestimmten Teil des Codes zu ändern. Außerdem lassen sich die Auswirkungen unserer Änderungen auf den
// restlichen Code deutlich besser vorhersagen.
//
// Zum Beispiel:
//
// Wir haben das Beispiel für schlechten Code aus lib\single_responsibility\bad_srp.dart genommen
// und es nach dem SRP umgeschrieben.
//
// Jetzt hat die Klasse TravelBooking eine klar definierte Verantwortung: Sie ist nur für die Informationen zu der Reise zuständig,
// die eine Person bezahlen möchte. In unserem Fall sind das die relevanten Daten: das Reiseziel und der Preis.
//
// Zusätzlich haben wir die Zahlungsmethoden ausgelagert und flexibler gestaltet. Dafür haben wir eine abstrakte Klasse
// PaymentMethod erstellt, die die Methode pay definiert.
//
// Dadurch können wir jetzt problemlos neue Zahlungsmethoden hinzufügen, ohne den Code der Klasse TravelBooking zu ändern
// und ohne bestehende Zahlungsmethoden zu beeinflussen.

class TravelBooking {
  String destination;
  double price;

  TravelBooking(this.destination, this.price);
}

abstract class PaymentMethod {
  void pay(double amount, {String? destination});
}

class CreditCardPayment implements PaymentMethod {
  @override
  void pay(double amount, {String? destination}) {
    print('Paying with credit card for booking to $destination with amount: \$$amount');
  }
}

class PayPalPayment implements PaymentMethod {
  @override
  void pay(double amount, {String? destination}) {
    print('Paying with PayPal for booking to $destination with amount: \$$amount');
  }
}

void main() {
  var booking = TravelBooking("Paris", 1000.0);

  PaymentMethod paymentMethod = CreditCardPayment();
  paymentMethod.pay(booking.price);
}
