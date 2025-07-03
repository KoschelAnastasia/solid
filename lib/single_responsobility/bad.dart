// Для примера

class TravelBooking {
  String destination;
  double price;

  TravelBooking(this.destination, this.price);

  void book() {
    print("Booking to $destination");
  }

  void sendConfirmation() {
    print("Sending confirmation email");
  }

  void chargeCreditCard() {
    print("Charging credit card for $price");
  }
}

void main() {
  var booking = TravelBooking("Paris", 1000.0);

  booking.book();

  booking.sendConfirmation();

  booking.chargeCreditCard();
}
