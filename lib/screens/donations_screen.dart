import 'package:flutter/material.dart';

class DonationsScreen extends StatelessWidget {
  const DonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Make a Difference with FARMarket',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/donations.jpg'),
            const SizedBox(height: 20),
            const Text(
              'At FARMarket, we believe in the power of community. Our mission goes beyond providing fresh farm produce. We are committed to helping those in need through generous donations from farmers, consumers, and supporters like you. Your contributions, whether cash or excess produce, play a crucial role in our efforts to feed the hungry and support communities during challenging times.',
              style: TextStyle(fontSize: 18, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            const Text(
              'How Your Donations Help:',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.local_dining, color: Colors.orange, size: 30),
              title: Text(
                'Feeding the Needy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Your donations help provide nutritious meals to those in need within our local communities.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.water_damage, color: Colors.blue, size: 30),
              title: Text(
                'Drought Relief',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'During times of drought, your support helps us distribute food and water to affected areas, ensuring no one goes hungry.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const ListTile(
              leading:
                  Icon(Icons.volunteer_activism, color: Colors.red, size: 30),
              title: Text(
                'Community Support',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Beyond immediate relief, your contributions support ongoing programs that promote self-sufficiency and community well-being.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Join Us in Making a Difference',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Every donation, no matter how small, makes a significant impact. Together, we can create a brighter future for our communities. Whether you are a farmer with surplus produce or a consumer who wishes to give back, your generosity is invaluable.',
              style: TextStyle(fontSize: 18, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Implement donation functionality here
                },
                child: const Text('Donate Now'),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
