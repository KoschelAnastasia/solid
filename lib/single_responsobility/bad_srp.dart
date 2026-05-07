// Single Responsibility:

// Kurz gesagt: Eine Verantwortung – eine Rolle.
// Etwas ausführlicher: Nach dem SRP sollte eine Klasse nur einen einzigen Grund haben, sich zu ändern.

// Als Beispiel nehmen wir ein Reisebuchungssystem. Wenn wir es uns genauer ansehen, erkennen wir,
// dass die Klasse neben Informationen wie Reiseziel und Preis auch eine Zahlungsmethode enthält.
// Diese Methode ist jedoch nicht nur für die Bezahlung der Reise verantwortlich,
// sondern auch für die Auswahl der konkreten Zahlungsmethode.

// In diesem Beispiel sehen wir also sehr deutlich eine Verletzung des SRP.
// Die Klasse hat im Grunde mehrere Verantwortlichkeiten, die nicht direkt miteinander zusammenhängen.
// Dadurch können wir als Entwickler viele unterschiedliche Gründe haben,
// diese Klasse später ändern zu müssen. Das bringt mehrere Risiken mit sich:

// - Erstens: Durch die vielen Verantwortlichkeiten in einer einzigen Klasse riskieren wir,
//   beim Ändern einer Stelle, zum Beispiel der Zahlungslogik,
//   unbeabsichtigt das Verhalten an einer anderen Stelle zu beeinflussen,
//   zum Beispiel die Buchungslogik.
//   Ja, dieses Beispiel ist noch einfach zu lesen,
//   und rein visuell können wir die Bereiche voneinander trennen.
//   In größeren Projekten wird genau das aber schnell zu einem großen Problem.
//
// - Zweitens: Wir koppeln uns zu stark an konkrete Details.
//   Unsere Methode pay enthält konkrete Anweisungen für konkrete Zahlungsarten.
//   Jede Änderung, zum Beispiel ein Wechsel des Zahlungsprotokolls,
//   zusätzliche Validierungen oder sogar einfaches Logging,
//   um zu testen, wie die Zahlung funktioniert,
//   führt zu größeren Änderungen im Code aller Zahlungsmethoden.
//
// - Drittens: Wenn wir eine neue Zahlungsmethode hinzufügen möchten,
//   müssen wir die Methode ändern, die für die Zahlung insgesamt verantwortlich ist.
//
// Wenn wir Klassen und Funktionen also zu viele Verantwortlichkeiten geben,
// schaffen wir Stellen im Code, an denen Fehler besonders leicht entstehen können.
// Wie können wir das vermeiden?
// Wechseln wir dazu in die Datei lib\single_responsibility\good_srp.dart und schauen uns das an ...

class TravelBooking {
  String destination;
  double price;

  TravelBooking(this.destination, this.price);

  void pay(String destination, double amount, String paymentMethod) {
    if (paymentMethod == 'credit_card') {
      print('Paying with credit card for booking to $destination with amount: \$$amount');
    } else if (paymentMethod == 'paypal') {
      print('Paying with PayPal for booking to $destination with amount: \$$amount');
    } else {
      print('Unknown payment method for booking to $destination');
    }
  }
}

void main() {
  var booking = TravelBooking("Paris", 1000.0);

  booking.pay(booking.destination, booking.price, 'credit_card');
}
