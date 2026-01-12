import 'package:flutter/material.dart';
import 'widget/hangout_spot.dart';



class HangoutHomeScreen extends StatelessWidget {
  const HangoutHomeScreen({super.key});

  final List<HangoutSpot> spots = const [
    HangoutSpot(
      name: 'Hatirjheel',
      location: 'Dhaka City',
      image: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/59/9b/8b/hatirheel-lake.jpg?w=700&h=400&s=1',
      tag: 'Urban Hangout',
      price: 'Free',
    ),
    HangoutSpot(
      name: 'Floating Market',
      location: 'Barisal',
      image: 'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/09/1a/51/e4.jpg',
      tag: 'Cultural Experience',
      price: '৳500',
    ),
    HangoutSpot(
      name: 'Sajek Valley',
      location: 'Rangamati',
      image: 'https://images.unsplash.com/photo-1658383895221-173f07c6a9d0?q=80&w=600',
      tag: 'Cloud Adventure',
      price: '৳5,500',
    ),
    HangoutSpot(
      name: 'Tanguar Haor',
      location: 'Sunamganj',
      image: 'https://media-cdn.tripadvisor.com/media/photo-s/10/83/8c/cf/right-around-the-time.jpg',
      tag: 'Waterfront Chill',
      price: '৳3,000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            _buildHeroHeader(),

            
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
              child: Text("Top Destinations",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            _buildGridSection(),

            
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
              child: Text("Trending Packages",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            _buildListSection(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroHeader() {
    return Stack(
      children: [
        Container(
          height: 280,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1623903102553-76495267104b?w=800'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 280,
          width: double.infinity,
          color: Colors.black.withOpacity(0.35),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Hangout\nBangladesh",
                  style: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold, height: 1.1)),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search destination...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.3
        ),
        itemCount: spots.length,
        itemBuilder: (context, index) {
          final spot = spots[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(spot.image, fit: BoxFit.cover),
                Container(color: Colors.black.withOpacity(0.2)),
                Positioned(bottom: 12, left: 12,
                    child: Text(spot.name,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildListSection() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: spots.length,
      itemBuilder: (context, index) {
        final spot = spots[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
                child: Image.network(spot.image, width: 110, height: 110, fit: BoxFit.cover),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(spot.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 14, color: Colors.grey),
                          const SizedBox(width: 4),
                          Text(spot.location, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(spot.price,
                              style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 17)),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text("Book Now", style: TextStyle(fontSize: 12)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
