import 'package:flutter/material.dart';
import 'package:village_connect/screens/auth/login_screen.dart';

class WorkerHomeScreen extends StatefulWidget {
  const WorkerHomeScreen({super.key});

  @override
  State<WorkerHomeScreen> createState() => _WorkerHomeScreenState();
}

class _WorkerHomeScreenState extends State<WorkerHomeScreen> {
  int _selectedIndex = 0;
  bool _isAvailable = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF004A36);
    const Color primaryContainer = Color(0xFF18634B);
    const Color secondaryContainer = Color(0xFFBCEBC0);
    const Color backgroundColor = Color(0xFFF9F9FF);
    const Color surfaceContainerLowest = Color(0xFFFFFFFF);
    const Color onSurfaceVariant = Color(0xFF3F4944);
    const Color outlineVariant = Color(0xFFBFC9C2);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: surfaceContainerLowest,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundImage:
                      NetworkImage('https://i.pravatar.cc/150?img=11'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.verified,
                        size: 10, color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Village Connect Pro',
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Row(
                  children: [
                    const Icon(Icons.circle, size: 6, color: Color(0xFF3D6846)),
                    const SizedBox(width: 4),
                    Text(
                      'Marcus Vance • Oak Park',
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: secondaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: const Row(
              children: [
                Icon(Icons.circle, size: 8, color: primaryContainer),
                SizedBox(width: 4),
                Text('Available',
                    style: TextStyle(fontSize: 12, color: Color(0xFF254F30))),
              ],
            ),
          ),
          IconButton(
            icon: const Badge(
                child: Icon(Icons.notifications_none, color: onSurfaceVariant)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.redAccent),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Availability Banner
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: surfaceContainerLowest,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: outlineVariant.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: secondaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.radio_button_checked,
                        color: primaryContainer),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Available for Jobs',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Accepting leads within 5 miles',
                            style: TextStyle(
                                fontSize: 12, color: onSurfaceVariant)),
                      ],
                    ),
                  ),
                  Switch(
                    value: _isAvailable,
                    onChanged: (val) {
                      setState(() {
                        _isAvailable = val;
                      });
                    },
                    activeThumbColor: primaryContainer,
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Quick Status
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.speed, color: Color(0xFFAAF1D2)),
                      const SizedBox(width: 8),
                      const Text('Today: 2 active • \$240 earned',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.thumb_up,
                            size: 14, color: Color(0xFFAAF1D2)),
                        SizedBox(width: 4),
                        Text('98%',
                            style: TextStyle(
                                color: Color(0xFFAAF1D2),
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Trust Rating
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: surfaceContainerLowest,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: outlineVariant.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFDCC3).withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.workspace_premium,
                        color: Color(0xFF643300)),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('4.98',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            Icon(Icons.star,
                                size: 16, color: Color(0xFF864700)),
                            SizedBox(width: 8),
                            Text('Top Rated Local Pro',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF3D6846),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text('86 neighborhood recommendations',
                            style: TextStyle(
                                fontSize: 12, color: onSurfaceVariant)),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: outlineVariant),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Earnings
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: outlineVariant.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Earnings Overview',
                          style: TextStyle(
                              color: onSurfaceVariant,
                              fontWeight: FontWeight.bold)),
                      Text('This Week',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('\$1,420.50',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1)),
                  const Row(
                    children: [
                      Icon(Icons.trending_up, size: 16, color: primaryColor),
                      Text('+18% vs last week',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                      Text(' • 14 jobs completed',
                          style:
                              TextStyle(color: onSurfaceVariant, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Actions
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.account_balance_wallet),
                          label: const Text('Instant Payout'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.analytics),
                          label: const Text('Analytics'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: onSurfaceVariant,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Active Job
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Active Job Now',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('In Progress',
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: primaryContainer.withValues(alpha: 0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                            color:
                                const Color(0xFFFFDCC3).withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text('Electrical Service',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF864700))),
                      ),
                      const Text('Starts 1:30 PM',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Ceiling Fan Installation & Wiring',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F3FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://i.pravatar.cc/150?img=9'),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Claire Robertson',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      size: 12, color: primaryColor),
                                  Text('0.8 mi away • Elm Grove Ln',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: onSurfaceVariant)),
                                ],
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.call, color: primaryColor)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.checklist, color: primaryColor, size: 16),
                          SizedBox(width: 4),
                          Text('Standard 10ft ceiling',
                              style: TextStyle(
                                  fontSize: 12, color: onSurfaceVariant)),
                        ],
                      ),
                      Text('\$115 Flat',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.navigation),
                          label: const Text('Navigate'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.check_circle),
                          label: const Text('Complete'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryContainer,
                            foregroundColor: const Color(0xFF416C4A),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: onSurfaceVariant,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.handyman), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.near_me), label: 'Map'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Schedule'),
          BottomNavigationBarItem(
            icon:
                Badge(label: Text('3'), child: Icon(Icons.chat_bubble_outline)),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.payments), label: 'Earnings'),
        ],
      ),
    );
  }
}
