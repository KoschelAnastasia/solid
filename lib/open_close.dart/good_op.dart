// Was haben wir gemacht, um eine Verletzung des Open/Closed Principle zu vermeiden?
//
// Wenn wir uns den Code genauer ansehen, erkennen wir, dass wir nicht mehr direkt an konkrete Kundentypen gekoppelt sind.
//
// Um die Codebasis zu verbessern, verwenden wir das Strategy Design Pattern:
//
// 1. Wir erstellen eine abstrakte Klasse DiscountStrategy, die die Methode calculate definiert.
//
// 2. Danach erstellen wir konkrete Klassen für jeden Kundentyp, die dieses Interface implementieren. Jede dieser Klassen
// implementiert die Methode calculate auf ihre eigene Weise.
//
// 3. Anschließend erstellen wir die Klasse DiscountCalculator. Diese Klasse weiß nichts über die konkrete Implementierung
// einer bestimmten Strategie. Ihre Hauptaufgabe besteht darin, eine Strategie entgegenzunehmen und sie für die
// Berechnung des Rabatts zu verwenden.
//
// Dadurch erhalten wir eine klare und erweiterbare Struktur. Sie ermöglicht es uns, neue Rabattstrategien einfach hinzuzufügen,
// ohne Angst haben zu müssen, bestehenden Code zu beschädigen.
abstract class DiscountStrategy {
  double calculate(double amount);
}

class RegularDiscount implements DiscountStrategy {
  @override
  double calculate(double amount) => amount * 0.05;
}

class PremiumDiscount implements DiscountStrategy {
  @override
  double calculate(double amount) => amount * 0.10;
}

class VipDiscount implements DiscountStrategy {
  @override
  double calculate(double amount) => amount * 0.20;
}

class DiscountCalculator {
  final DiscountStrategy strategy;

  DiscountCalculator(this.strategy);

  double applyDiscount(double amount) {
    return strategy.calculate(amount);
  }
}

void main() {
  var vip = DiscountCalculator(VipDiscount());
  print(vip.applyDiscount(200));

  var regular = DiscountCalculator(RegularDiscount());
  print(regular.applyDiscount(200));
}
