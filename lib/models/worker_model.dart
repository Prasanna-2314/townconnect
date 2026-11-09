class WorkerModel {
  final String id;
  final String name;
  final String profession;
  final double rating;
  final int completedJobs;
  final double distance;
  final double startingPrice;
  final bool isAvailable;
  final String imageUrl;

  WorkerModel({
    required this.id,
    required this.name,
    required this.profession,
    required this.rating,
    required this.completedJobs,
    required this.distance,
    required this.startingPrice,
    required this.isAvailable,
    this.imageUrl = 'https://ui-avatars.com/api/?name=Worker',
  });
}

// Dummy Data
final List<WorkerModel> dummyWorkers = [
  WorkerModel(
    id: '1',
    name: 'Ravi Sharma',
    profession: 'Plumber',
    rating: 4.9,
    completedJobs: 86,
    distance: 1.2,
    startingPrice: 300,
    isAvailable: true,
    imageUrl: 'https://ui-avatars.com/api/?name=Ravi+Sharma&background=random',
  ),
  WorkerModel(
    id: '2',
    name: 'Meena Kumari',
    profession: 'Agriculture Specialist',
    rating: 4.8,
    completedJobs: 120,
    distance: 2.0,
    startingPrice: 400,
    isAvailable: true,
    imageUrl: 'https://ui-avatars.com/api/?name=Meena+Kumari&background=random',
  ),
  WorkerModel(
    id: '3',
    name: 'Arjun Patel',
    profession: 'Electrician',
    rating: 4.7,
    completedJobs: 54,
    distance: 3.1,
    startingPrice: 250,
    isAvailable: false,
    imageUrl: 'https://ui-avatars.com/api/?name=Arjun+Patel&background=random',
  ),
  WorkerModel(
    id: '4',
    name: 'Suresh Kumar',
    profession: 'Carpenter',
    rating: 4.6,
    completedJobs: 42,
    distance: 2.5,
    startingPrice: 500,
    isAvailable: true,
    imageUrl: 'https://ui-avatars.com/api/?name=Suresh+Kumar&background=random',
  ),
];
