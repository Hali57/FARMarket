import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Our Services')),
        backgroundColor: const Color(0xff3FA843),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'For Farmers',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildServiceItem(
              icon: Icons.show_chart,
              title: 'Real-Time Market Prices',
              description:
                  'Stay updated with the latest market prices for various farm produce.',
            ),
            _buildServiceItem(
              icon: Icons.shopping_cart,
              title: 'Direct Sales to Consumers',
              description:
                  'Sell directly to consumers and increase your profit margins.',
            ),
            _buildServiceItem(
              icon: Icons.track_changes,
              title: 'Crop and Livestock Management',
              description:
                  'Tools for planning, tracking, and managing your crops and livestock.',
            ),
            _buildServiceItem(
              icon: Icons.cloud,
              title: 'Localized Weather Updates',
              description:
                  'Get accurate weather forecasts to plan your farming activities.',
            ),
            _buildServiceItem(
              icon: Icons.support,
              title: 'Expert Consultation and Educational Resources',
              description:
                  'Access to agricultural experts and a library of farming resources.',
            ),
            _buildServiceItem(
              icon: Icons.monetization_on,
              title: 'Financial Services',
              description:
                  'Microloans, crop insurance, and savings plans tailored for farmers.',
            ),
            _buildServiceItem(
              icon: Icons.construction,
              title: 'Farm Equipment Rentals',
              description:
                  'Rent out farm equipment to other farmers and maximize usage.',
            ),
            const SizedBox(height: 20),
            const Text(
              'For Consumers',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildServiceItem(
              icon: Icons.local_shipping,
              title: 'Fresh Produce Delivery',
              description:
                  'Get fresh farm produce delivered directly to your doorstep.',
            ),
            _buildServiceItem(
              icon: Icons.subscriptions,
              title: 'Subscription Boxes',
              description:
                  'Weekly or monthly boxes of fresh produce from local farms.',
            ),
            _buildServiceItem(
              icon: Icons.group,
              title: 'Community Supported Agriculture',
              description:
                  'Become a member of local farms and receive a share of the harvest.',
            ),
            _buildServiceItem(
              icon: Icons.eco,
              title: 'Eco-Friendly Products and Recycling Programs',
              description:
                  'Support sustainable farming and participate in recycling initiatives.',
            ),
            _buildServiceItem(
              icon: Icons.book,
              title: 'Healthy Eating Guides and Farm Visits',
              description:
                  'Learn about healthy eating, seasonal recipes, and visit local farms.',
            ),
            _buildServiceItem(
              icon: Icons.card_giftcard,
              title: 'Loyalty Programs and Rewards',
              description:
                  'Earn loyalty points and rewards for your purchases and referrals.',
            ),
            _buildServiceItem(
              icon: Icons.feedback,
              title: 'Feedback and Reviews',
              description:
                  'Leave reviews and feedback to help us improve our services.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(
      {required IconData icon,
      required String title,
      required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 40, color: const Color(0xff3FA843)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(description, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
