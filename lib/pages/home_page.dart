import 'package:flutter/material.dart';
import 'package:trainapp/widgets/frequently_visited_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Where are you going now?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[200],
                ),
                height: 50,
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Station, Train name',
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2, // Change to 3 or more if needed
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio:
                    1.5, // Adjust this value to make items smaller
                children: const [
                  GridItem(
                    icon: Icons.directions,
                    title: 'Journey Path',
                  ),
                  GridItem(
                    icon: Icons.confirmation_number,
                    title: 'Tickets',
                  ),
                  GridItem(
                    icon: Icons.map,
                    title: 'Transport Map',
                  ),
                  GridItem(
                    icon: Icons.account_balance_wallet,
                    title: 'Recharge',
                  ),
                ],
              ),
              const SizedBox(height: 30), // Add some space before the text
              const Text(
                'Frequently visited station',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              FrequentlyVisitedTile(
                isUpcomingTrain: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const GridItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: double.infinity,
            height: 110,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 9),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "\n$title",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[100],
              ),
              child: Icon(icon, size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
