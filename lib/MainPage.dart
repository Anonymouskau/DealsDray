
import 'package:dealsdray/Carosel.dart';
import 'package:dealsdray/MobileCarosel.dart';

import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  
    
  final List<String> images = [
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
    'https://via.placeholder.com/600x400',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(selectedIconTheme: IconThemeData(color: Colors.red),selectedLabelStyle: TextStyle(color: Colors.red),unselectedLabelStyle: TextStyle(color: Colors.grey),type: BottomNavigationBarType.fixed,items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(color: Colors.grey,Icons.home_outlined),
            label:'Home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(color: Colors.grey,Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(color: Colors.grey,Icons.local_offer),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: Icon(color: Colors.grey,Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(color: Colors.grey,Icons.person),
            label: 'Profile',
          ),
        ]),
      backgroundColor: Colors.white,
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: Colors.grey, // Color of the line
              thickness: 1, // Thickness of the line
              indent: 16, // Empty space before the divider
              endIndent: 16, // Empty space after the divider
            ),
            CarouselExample(),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350, // Set the desired width
              height: 150, // Set the desired height
              child: Card(
                color: const Color.fromARGB(
                    255, 139, 122, 238), // Set card color or other properties
                elevation: 5, // Set elevation for shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                child: SizedBox(
                  height: 20,
                  child: Text(
                    'KYC Pending\n You need to provide the required\n documents for your activation\n Click Here',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: const Color.fromARGB(255, 170, 123, 211),
                  child: Icon(
                    Icons.mobile_friendly,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: const Color.fromARGB(255, 99, 201, 109),
                  child: Icon(
                    Icons.laptop,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.pink.shade400,
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.orange.shade400,
                  child: Icon(
                    Icons.lightbulb_outline_sharp,
                    size: 35.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 45,
                ),
                Text("Mobile"),
                SizedBox(
                  width: 45,
                ),
                Text("Laptop"),
                SizedBox(
                  width: 45,
                ),
                Text("Camera"),
                SizedBox(
                  width: 45,
                ),
                Text("Led")
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 1000,
              color: const Color.fromARGB(255, 75, 211, 197),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text(style: TextStyle(color: Colors.white,fontSize: 20),"    EXCLUSIVE FOR YOU                   "),
                      Icon(Icons.arrow_forward,color: Colors.white,)
                      
                    ],
                    
                  )
                  ,SizedBox(height: 40,)
,Mobilecarosel()
                  ,
                  
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 250,
                  child: TextField(
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    onChanged: (value) => {print(value)},
                     
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/unnamed.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      labelText: '  Search here',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons
                          .search), // Adds an icon to indicate password field
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.notifications_none),
              ],
            ),
          )
        ],
      ),
    );
  }
}
