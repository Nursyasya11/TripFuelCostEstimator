import 'package:flutter/material.dart';

// Main class for the fuel cost calculator screen
class FuelCostCalculator extends StatefulWidget {
  const FuelCostCalculator({super.key});

  @override
  State<FuelCostCalculator> createState() => _FuelCostCalculatorState();
}

// The state class that holds the logic and data
class _FuelCostCalculatorState extends State<FuelCostCalculator> {
  TextEditingController distanceController = TextEditingController();
  TextEditingController efficiencyController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  double fuelCost = 0.0;


// Function to calculate the total fuel cost
  void calculateFuelCost() {
    double distance = double.tryParse(distanceController.text) ?? 0;
    double efficiency = double.tryParse(efficiencyController.text) ?? 1;
    double price = double.tryParse(priceController.text) ?? 0;

    // Formula: Fuel Cost = (Distance / Efficiency) * Fuel Price
    fuelCost = (distance / efficiency) * price;


// Validation: check if any field is empty
    if (distanceController.text.isEmpty ||
    efficiencyController.text.isEmpty ||
    priceController.text.isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Please fill in all fields before calculating.'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    ),
  );
  return; // Stop execution if validation fails
}


    setState(() {});// Refresh the screen to show the updated result
  }

// Function to clear all input fields and reset the result
  void resetFields() {
    distanceController.clear();
    efficiencyController.clear();
    priceController.clear();
    fuelCost = 0.0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fuel Cost Calculator'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12),
          ),
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Enter Your Trip Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Distance
              TextField(
                controller: distanceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Distance (km)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              // Efficiency
              TextField(
                controller: efficiencyController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Fuel Efficiency (km/L)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              // Fuel Price
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Fuel Price (RM/L)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Row of buttons (Calculate and Reset)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: calculateFuelCost,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('Calculate'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: resetFields,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                    child: const Text('Reset'),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Output
              Text(
                'Estimated Fuel Cost:',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'RM ${fuelCost.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
