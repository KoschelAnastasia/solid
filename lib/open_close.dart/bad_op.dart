// Open/Closed:

// Kurz gesagt: Eine Klasse sollte offen für Erweiterung, aber geschlossen für Modifikation sein.
//
// Etwas ausführlicher: Nach dem Open/Closed Principle sollten wir für die Implementierung neuer Funktionalität keine
// bestehende Klasse umschreiben.
//
// Warum ist das wichtig?
// Die Modifikation einer bestehenden Klasse kann unvorhersehbare Auswirkungen an den Stellen haben, an denen diese
// Klasse verwendet wird.
//
// Um das zu vermeiden, sollten wir versuchen, das Verhalten der Klasse zu erweitern, anstatt ihren ursprünglichen Code
// direkt zu verändern. Durch Erweiterungen können wir das gewünschte Verhalten hinzufügen, ohne etwas am bestehenden Code zu ändern.
//
// Das bedeutet nicht, dass Änderungen grundsätzlich ausgeschlossen sind. Wir lokalisieren Änderungen lediglich,
// um Regressionsfehler möglichst zu vermeiden. Schauen wir uns das an einem Beispiel an. Angenommen, wir haben eine
// Klasse, die Rabatte für unterschiedliche Kundentypen berechnet.
//
// Anfangs haben wir beim Erweitern der Funktionalität einfach neue Bedingungen zur Methode calculate hinzugefügt.
// Und obwohl das funktioniert und die Methode noch relativ gut lesbar ist, sieht man bereits jetzt:
//
// Wenn weitere Kundentypen dazukommen, wird diese Methode immer schwieriger zu verstehen und zu lesen.
// Außerdem koppeln wir uns innerhalb der Methode zu stark an konkrete Kundentypen.  Dadurch geht der eigentliche Zweck
// der Methode verloren: nämlich den Rabatt zu berechnen.
//
// Wie können wir das vermeiden?
// Wechseln wir dazu in die Datei lib\open_closed\good_ocp.dart und schauen uns das an ...

class DiscountCalculator {
  double calculate(String customerType, double amount) {
    if (customerType == 'regular') {
      return amount * 0.05;
    } else if (customerType == 'premium') {
      return amount * 0.10;
    } else if (customerType == 'vip') {
      return amount * 0.20;
    } else {
      return 0;
    }
  }
}
