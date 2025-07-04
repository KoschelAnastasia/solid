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
