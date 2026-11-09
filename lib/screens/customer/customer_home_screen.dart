import 'package:flutter/material.dart';
import 'package:village_connect/screens/auth/login_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedIndex = 0;

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
    const Color onSecondaryContainer = Color(0xFF416C4A);
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
        title: const Row(
          children: [
            Icon(Icons.location_on, color: primaryColor),
            SizedBox(width: 4),
            Text(
              'Maplewood Community',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Icon(Icons.expand_more, color: onSurfaceVariant),
          ],
        ),
        actions: [
          IconButton(
            icon: const Badge(
              child: Icon(Icons.notifications_none, color: onSurfaceVariant),
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                // Logout logic for demo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=5',
                ), // placeholder
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting
            const Row(
              children: [
                Text(
                  'Good morning, Sarah',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(' 👋', style: TextStyle(fontSize: 24)),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'What do you need help with in the neighborhood today?',
              style: TextStyle(color: onSurfaceVariant, fontSize: 14),
            ),
            const SizedBox(height: 16),

            // Search
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search plumbers, electricians...',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: outlineVariant,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: outlineVariant),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: outlineVariant),
                      ),
                      filled: true,
                      fillColor: surfaceContainerLowest,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F3FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune, color: onSurfaceVariant),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Filter chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Chip(
                    avatar: const Icon(
                      Icons.verified,
                      size: 16,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Verified Only',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Chip(
                    avatar: const Icon(
                      Icons.bolt,
                      size: 16,
                      color: Color(0xFF864700),
                    ),
                    label: const Text(
                      'Emergency / Today',
                      style: TextStyle(color: onSurfaceVariant),
                    ),
                    backgroundColor: surfaceContainerLowest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: outlineVariant),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Chip(
                    avatar: const Icon(
                      Icons.handshake,
                      size: 16,
                      color: Color(0xFF3D6846),
                    ),
                    label: const Text(
                      'Neighbor Recommended',
                      style: TextStyle(color: onSurfaceVariant),
                    ),
                    backgroundColor: surfaceContainerLowest,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: outlineVariant),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Active Requests
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      'Active Requests',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.circle, size: 10, color: primaryContainer),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'History >',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // Active Request Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: primaryContainer.withValues(alpha: 0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: secondaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: primaryContainer,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'En Route • Arriving in 15 min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: onSecondaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Kitchen Sink Leak Repair',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Scheduled for today, 10:30 AM',
                            style: TextStyle(
                              fontSize: 12,
                              color: onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F3FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.plumbing,
                          color: primaryContainer,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              'https://i.pravatar.cc/150?img=11',
                            ),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Marcus Vance',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    '4.9',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '(124 neighbor reviews)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.call, color: primaryColor),
                            style: IconButton.styleFrom(
                              backgroundColor: const Color(0xFFE7EEFF),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.near_me, size: 16),
                            label: const Text('Track'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryContainer,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View all >',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildCategoryItem(
                  Icons.water_drop,
                  'Plumbing',
                  const Color(0xFFBCEBC0),
                ),
                _buildCategoryItem(
                  Icons.electric_bolt,
                  'Electrical',
                  const Color(0xFFFFDCC3),
                ),
                _buildCategoryItem(
                  Icons.home_repair_service,
                  'Handyman',
                  const Color(0xFFE7EEFF),
                ),
                _buildCategoryItem(
                  Icons.yard,
                  'Yard & Lawn',
                  const Color(0xFFBCEBC0),
                ),
                _buildCategoryItem(
                  Icons.cleaning_services,
                  'Cleaning',
                  const Color(0xFFDEE8FF),
                ),
                _buildCategoryItem(
                  Icons.ac_unit,
                  'HVAC',
                  const Color(0xFFE7EEFF),
                ),
                _buildCategoryItem(
                  Icons.format_paint,
                  'Painting',
                  const Color(0xFFFFDCC3),
                ),
                _buildCategoryItem(
                  Icons.pets,
                  'Pet Care',
                  const Color(0xFFBFEEC3),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Top Vouched
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Vouched by Neighbors',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Recommended directly on local street chats',
                      style: TextStyle(fontSize: 12, color: onSurfaceVariant),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See all >',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildProCard(
              'Elena Ramos',
              'Master Electrician',
              'Oak Hill Lane',
              '65',
              'https://i.pravatar.cc/150?img=47',
            ),
            const SizedBox(height: 12),
            _buildProCard(
              'David Chen',
              'Lawn Care & Handyman',
              'Elm Street',
              '45',
              'https://i.pravatar.cc/150?img=15',
            ),

            const SizedBox(height: 24),
            // Guarantee
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF0F3FF), Color(0xFFE7EEFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: outlineVariant.withValues(alpha: 0.4)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.shield,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Village Connect Guarantee',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'All pros are identity-verified, background-checked, and actively vouched by verified residents on your street.',
                          style: TextStyle(
                            fontSize: 12,
                            color: onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.chat_bubble_outline),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label, Color bgColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: const Color(0xFF18634B)),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildProCard(
    String name,
    String jobTitle,
    String location,
    String rate,
    String avatarUrl,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: const Color(0xFF18634B).withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '$jobTitle • $location',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF3F4944),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBCEBC0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.handshake,
                            size: 12,
                            color: Color(0xFF416C4A),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Vouched by neighbors',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF416C4A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFDCC3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Color(0xFF643300)),
                    Text(
                      '5.0',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF643300),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Est. Rate',
                    style: TextStyle(fontSize: 12, color: Color(0xFF3F4944)),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$$rate',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        '/hr',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF3F4944),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFE7EEFF),
                      foregroundColor: const Color(0xFF004A36),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Profile'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF18634B),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Book'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
