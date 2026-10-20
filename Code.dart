class SmartLaptop {
  String brand;
  String model;
  int ramGB;

  int _batteryLevel = 100;

  SmartLaptop({required this.brand, required this.model, required this.ramGB});

  int get batteryLevel => _batteryLevel;

  void powerOn() {
    print("[$brand $model] Booting up... System ready with ${ramGB}GB RAM.");
  }

  void useLaptop(int drainAmount) {
    if (_batteryLevel - drainAmount >= 0) {
      _batteryLevel -= drainAmount;
      print(
        "Used laptop. Battery drained by $drainAmount%. Current level: $_batteryLevel%.",
      );
    } else {
      _batteryLevel = 0;
      print("System warning: Battery critically empty! Laptop powered down.");
    }
  }

  void chargeBattery(int chargeAmount) {
    if (_batteryLevel + chargeAmount <= 100) {
      _batteryLevel += chargeAmount;
    } else {
      _batteryLevel = 100;
    }
    print("Charging... Current level: $_batteryLevel%.");
  }
}

void main() {
  SmartLaptop laptop1 = SmartLaptop(
    brand: "Apple",
    model: "MacBook Pro",
    ramGB: 16,
  );

  SmartLaptop laptop2 = SmartLaptop(brand: "Dell", model: "XPS 15", ramGB: 32);

  List<SmartLaptop> techInventory = [laptop1, laptop2];

  for (int i = 0; i < techInventory.length; i++) {
    var device = techInventory[i];
    print("--- Testing Device #${i + 1}: ${device.brand} ---");

    device.powerOn();
    device.useLaptop(35);
    device.chargeBattery(15);

    print("Final checked battery log status: ${device.batteryLevel}%\n");
  }
}
