import 'package:flutter/material.dart';
import 'package:trainapp/pages/ticket_page.dart';


class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  // bool isMobile = false;
  // bool isCreditCard = false;
  int isPaymentMethod = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          'Choose payment method',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(50)),
              child: RadioListTile(
                title: const Text("Mobile financial service"),
                value: 1,
                groupValue: isPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    isPaymentMethod = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(50)),
              child: RadioListTile(
                title: const Text("Credit card"),
                value: 2,
                groupValue: isPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    isPaymentMethod = value!;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Card Information",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Full name",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(
                  50,
                ),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Card Number",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(
                  50,
                ),
              ),
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "CVV",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Expiration date",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(
                  50,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "BDT:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "60:00",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
           ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketPage(),
                  ),
                );
              },
            child: const Text(
               'Continue',
                style: TextStyle(color: Colors.white),
             ),
           ),
          ],
        ),
      ),
    );
  }
}
