// Для примера

class TravelBooking {
  String destination;
  double price;

  TravelBooking(this.destination, this.price);

  void book() {
    print("Booking to $destination");
  }

  void pay(String paymentType, double amount) {
    if (paymentType == "credit_card") {
      print('Volidation...');
      print('Payment of $amount was made with a credit card.');
    } else if (paymentType == "paypal") {
      print('Volidation...');
      print('Payment of $amount was made with a PayPal.');
    } else {
      print('Volidation...');
      print("Unknown payment method... Cannot process payment.");
    }
  }
}

void main() {
  var booking = TravelBooking("Paris", 1000.0);

  booking.book();

  booking.pay('credit_card', booking.price);
}
