import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../models/worker_model.dart';
import '../../widgets/custom_button.dart';
import '../chat/chat_screen.dart';
import '../booking/service_request_screen.dart';

class WorkerProfileScreen extends StatelessWidget {
  final WorkerModel worker;

  const WorkerProfileScreen({super.key, required this.worker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Worker Profile',
            style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(worker.imageUrl),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(worker.name,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 8),
                      const Icon(Icons.verified, color: Colors.blue, size: 20),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(worker.profession,
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _ProfileStat(
                          label: 'Rating', value: '${worker.rating} ⭐'),
                      _ProfileStat(
                          label: 'Jobs', value: '${worker.completedJobs}'),
                      _ProfileStat(
                          label: 'Distance', value: '${worker.distance} km'),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('About',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                      'Professional and experienced worker providing high-quality services in the local area. Guaranteed satisfaction.',
                      style: TextStyle(color: Colors.grey, height: 1.5)),
                  const SizedBox(height: 24),
                  const Text('Service Details',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _DetailRow(
                      icon: Icons.monetization_on,
                      title: 'Starting Price',
                      value: '₹${worker.startingPrice}'),
                  const SizedBox(height: 12),
                  const _DetailRow(
                      icon: Icons.access_time,
                      title: 'Working Hours',
                      value: '9:00 AM - 6:00 PM'),
                  const SizedBox(height: 12),
                  const _DetailRow(
                      icon: Icons.location_on,
                      title: 'Service Area',
                      value: 'Within 10 km radius'),
                  const SizedBox(height: 24),
                  const Text('Reviews (24)',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  const _ReviewCard(
                    name: 'Amit Patel',
                    rating: 5,
                    date: '2 days ago',
                    comment:
                        'Excellent service. Worker arrived on time and fixed the issue quickly.',
                  ),
                  const _ReviewCard(
                    name: 'Priya Singh',
                    rating: 4.5,
                    date: '1 week ago',
                    comment: 'Very professional. Reasonable pricing.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Chat',
                isOutlined: true,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChatScreen(workerName: worker.name)));
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: CustomButton(
                text: 'Request Service',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              ServiceRequestScreen(worker: worker)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _DetailRow(
      {required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 20),
        const SizedBox(width: 12),
        Text(title, style: const TextStyle(color: Colors.grey)),
        const Spacer(),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final String name;
  final double rating;
  final String date;
  final String comment;

  const _ReviewCard({
    required this.name,
    required this.rating,
    required this.date,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(date,
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, color: AppColors.secondaryColor, size: 14),
              const SizedBox(width: 4),
              Text('$rating',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Text(comment,
              style: const TextStyle(color: Colors.black87, fontSize: 14)),
        ],
      ),
    );
  }
}
