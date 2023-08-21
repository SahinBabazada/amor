import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HelpTopicCard(
                title: 'Most popular question: Returns and Refunds Policy',
                description:
                    'A return and refund policy is an agreement between customers and your business regarding returns and refunds. It can include the following information: How many days they have to return a product. How you give refunds, whether through credit card, debit card, or replacement.',
                onTap: () {},
              ),
              HelpTopicCard(
                title: 'Account Issues',
                description: 'Troubleshooting problems with your account.',
                onTap: () {},
              ),
              HelpTopicCard(
                title: 'Billing and Payments',
                description: 'Questions related to billing and payments.',
                onTap: () {},
              ),
              HelpTopicCard(
                title: 'International Shipping Information',
                description: 'International shipping is a complex process ...',
                onTap: () {},
              ),
              HelpTopicCard(
                title: 'Sizing and Product Guides',
                description: ' Body dimensions corresponding to each size ...',
                onTap: () {},
              ),
              HelpTopicCard(
                title: 'Troubleshooting Common Checkout Issues',
                description: 'Some of the most common issues included ...',
                onTap: () {},
              ),
              HelpTopicCard(
                title: 'How to Track Your Order',
                description: 'Track a package with your tracking number ...',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelpTopicCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const HelpTopicCard({super.key, 
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(description),
            ],
          ),
        ),
      ),
    );
  }
}