import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../pages/book_page.dart';

class FrequentlyVisitedTile extends StatefulWidget {
  bool isUpcomingTrain;
  FrequentlyVisitedTile({super.key, required this.isUpcomingTrain});

  @override
  State<FrequentlyVisitedTile> createState() => _FrequentlyVisitedTileState();
}

class _FrequentlyVisitedTileState extends State<FrequentlyVisitedTile> {
  int currentStep = 0;
  List<Step> steps = [
    const Step(
      title: Text('Step 1'),
      content: Text('Content for Step 1'),
    ),
    const Step(
      title: Text('Step 2'),
      content: Text('Content for Step 2'),
    ),
    const Step(
      title: Text('Step 3'),
      content: Text('Content for Step 3'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Arrival",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "9:30 PM",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        border: Border.all(
                          width: 3,
                          color: Colors.green,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: widget.isUpcomingTrain
                              ? const Text(
                                  "300",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const Icon(
                                  Icons.done,
                                  size: 28,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.isUpcomingTrain ? "Tickets Left" : "Completed",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Train No.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "DMR-U2",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(15, (index) {
                bool isRoute = index >= 4 && index <= 10;
                bool isStepperStartEndPoint = index == 0 || index == 14;
                bool isStartPoint = index == 4;
                bool isEndPoint = index == 10;
                return Expanded(
                  child: Row(
                    children: [
                      isStartPoint
                          ? Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.green,
                                ),
                              ),
                              child: CircleAvatar(
                                maxRadius: isStepperStartEndPoint ? 7 : 4,
                                backgroundColor: isRoute
                                    ? Colors.green
                                    : const Color.fromARGB(255, 108, 31, 31),
                              ),
                            )
                          : isEndPoint
                              ? Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.green,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    maxRadius: isStepperStartEndPoint ? 7 : 4,
                                    backgroundColor:
                                        isRoute ? Colors.green : Colors.grey,
                                  ),
                                )
                              : CircleAvatar(
                                  maxRadius: isStepperStartEndPoint ? 7 : 3,
                                  backgroundColor:
                                      isRoute ? Colors.green : Colors.grey,
                                ),
                      index == 14
                          ? const SizedBox()
                          : const Expanded(
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                    ],
                  ),
                );
              }),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 5),
                Text("Pallabi   "),
                Text("      Shahbagh"),
                SizedBox(width: 1),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookPage(),
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
    );
  }
}
