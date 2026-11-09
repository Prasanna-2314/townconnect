import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../models/worker_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class ServiceRequestScreen extends StatefulWidget {
  final WorkerModel worker;

  const ServiceRequestScreen({super.key, required this.worker});

  @override
  _ServiceRequestScreenState createState() => _ServiceRequestScreenState();
}

class _ServiceRequestScreenState extends State<ServiceRequestScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController problemController = TextEditingController();
  String selectedDate = 'Tomorrow';
  String selectedTime = '10:00 AM';
  bool isLoading = false;

  void handleRequest() {
    setState(() => isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => isLoading = false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Request Sent!'),
          content:
              Text('${widget.worker.name} has been notified of your request.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // back to profile
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Request Service',
            style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppColors.primaryColor.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                      backgroundImage: NetworkImage(widget.worker.imageUrl)),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.worker.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(widget.worker.profession,
                          style:
                              const TextStyle(color: AppColors.primaryColor)),
                    ],
                  ),
                  const Spacer(),
                  Text('₹${widget.worker.startingPrice}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('When do you need the service?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Date',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectedDate),
                            const Icon(Icons.calendar_today,
                                size: 16, color: Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Time',
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(selectedTime),
                            const Icon(Icons.access_time,
                                size: 16, color: Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomTextField(
              label: 'Service Address',
              hint: 'Enter complete address',
              controller: addressController,
              prefixIcon: Icons.location_on,
            ),
            CustomTextField(
              label: 'Problem Description',
              hint: 'Describe the issue briefly',
              controller: problemController,
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Confirm Request',
              onPressed: handleRequest,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
