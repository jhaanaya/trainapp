
import 'package:flutter/material.dart';
import 'package:trainapp/pages/search_page.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final _formKey = GlobalKey<FormState>();
  String _from = 'Pallabi';
  String _to = 'Shahabag';
  DateTime _selectedDate = DateTime.now();
  int _adultCount = 1;
  String _entranceTime = '9:00pm-10:00pm';
  int _currentIndex = 0;

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String personValue = "Select";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          'Book a Train',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Where do you travel from?',
                    suffixIcon: Icon(Icons.location_on),
                  ),
                  initialValue: 'Pallabi',
                  onChanged: (value) {
                    setState(() {
                      _from = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a departure location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Where do you travel to?',
                    suffixIcon: Icon(Icons.location_on),
                  ),
                  initialValue: 'Shahabag',
                  onChanged: (value) {
                    setState(() {
                      _to = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a destination location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                Text('Select travel date'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_selectedDate.toLocal()}'.split(' ')[0],
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
                Divider(),
                const SizedBox(height: 16.0),
                const Text(
                  'Number of persons',
                  style: TextStyle(fontSize: 16.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width / 2,
                      child: DropdownButtonFormField(
                        value: personValue,
                        decoration: InputDecoration(border: InputBorder.none),
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        items: const [
                          DropdownMenuItem(
                            value: 'Select',
                            child: Text("Select"),
                          ),
                          DropdownMenuItem(
                            value: 'Adult',
                            child: Text("Adult"),
                          ),
                          DropdownMenuItem(
                            value: 'Child',
                            child: Text("Child"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            personValue = value!;
                          });
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _adultCount =
                                    _adultCount > 1 ? _adultCount - 1 : 1;
                              });
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Text('$_adultCount'),
                        const SizedBox(width: 8.0),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _adultCount++;
                              });
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          '  Add other types of tickets',
                          style: TextStyle(
                            color: Colors.green, // Change text color to green
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Hours of entrance',
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 8.0),
                Container(
                  width: double
                      .infinity, // Set the width to fill the available space
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    _entranceTime,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle "Go Back" button tap
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          child: const Text('Go Back'),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle "Next" button tap
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => SearchPage(
                                        title: '',
                                      )
),
                            );
                          },

                  
               style: ButtonStyle(
                            backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

// Example NextScreen widget for navigation
class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Screen'),
      ),
      body: const Center(
        child: Text('This is the next screen.'),
      ),
    );
  }
}
