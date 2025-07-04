// Для примера

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
