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
