import 'package:flutter/material.dart';
import 'package:trainapp/pages/book_page.dart';
import 'package:trainapp/pages/choose_page.dart';
import 'package:trainapp/widgets/frequently_visited_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.title});

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image.asset('assets/QR.png'),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Search result',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSearchResult(),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Upcoming trains',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 8.0),
                        Text('10 results found'),
                        Spacer(),
                        Icon(Icons.filter_list),
                        SizedBox(width: 8.0),
                        Text('Filter'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    FrequentlyVisitedTile(
                      isUpcomingTrain: true,
                    ),
                    const SizedBox(height: 10),
                    FrequentlyVisitedTile(
                      isUpcomingTrain: true,
                    ),
                    // _buildTrainCard(
                    //   arrivalTime: '10:30 PM',
                    //   trainNo: 'DMR-U4',
                    //   ticketsLeft: 300,
                    //   currentLocation: 'Location: Dhaka',
                    //   onBookNowPressed: () {},
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.location_on),
      //       label: 'Location',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'Wishlist',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildSearchResult() {
    return Card(
      elevation: 10,
      shadowColor: Colors.grey[100],
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Container(
              color: Colors.green,
              padding: const EdgeInsets.all(16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pallabi',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 10),
                          Text(
                            '9:00 PM',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Shahbag',
                              style: TextStyle(color: Colors.white)),
                          SizedBox(height: 10),
                          Text(
                            '9:30 PM',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('9 Oct 2022', style: TextStyle(color: Colors.white)),
                      SizedBox(height: 10),
                      Text(
                        '1 Person',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shahbag', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 10),
                      Text(
                        '9:30 PM',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shahbag', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 10),
                      Text(
                        '9:30 PM',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChoosePage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Book now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrainCard({
    required String arrivalTime,
    required String trainNo,
    required int ticketsLeft,
    required String currentLocation,
    required VoidCallback onBookNowPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Arrival Time: $arrivalTime'),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    ticketsLeft.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text('Train No.: $trainNo'),
            ],
          ),
          const SizedBox(height: 10),
          Text(currentLocation),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle "Next" button tap
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ChoosePage()),
                );
              },
              //onPressed: onBookNowPressed,

              child: const Text('Book Now'),

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
