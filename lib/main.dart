import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/coffee_tile.dart';
import 'package:task/coffetype.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Lattee',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'tea',
      false,
    ],


  ];
  void coffeeTypeSelected(int index){
    setState(() {
      for(int i=0; i< coffeeType.length; i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.logout),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
          icon: Icon(Icons.home,),
            label:'',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,),
          label:'',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shop,),
          label: '',
        ),
      ]
      ),

        body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text("Find your best coffee for you",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 60
                  ),
                ),
              ),
              SizedBox(height: 25,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText:  'Search here...',
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                      color: Colors.grey.shade600,
                    )),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade600,
                      )
                    )
                  ),
                ),
              ),
              SizedBox(height: 25,),

              Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: coffeeType.length,
                    itemBuilder: (context,index){
                  return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: (){
                        coffeeTypeSelected(index);
                      }
                  );

                }),
              ),

              Expanded(
                  child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                   CoffeeTile(
                     coffeeImagePath: 'images/coffe 1.png',
                     coffeeName: 'Cappucino',
                     coffeePrice: '40',
                     coffeeSub: 'With extra milk',
                   ),

                  CoffeeTile(
                    coffeeImagePath: 'images/coffee2.png',
                    coffeeName: 'Latte',
                    coffeePrice: '42',
                    coffeeSub: 'With extra cream',
                  ),

                  CoffeeTile(
                    coffeeImagePath: 'images/11354815.png',
                    coffeeName: 'Black',
                    coffeePrice: '30',
                    coffeeSub: 'With extra coffee',
                  ),

                  CoffeeTile(
                    coffeeImagePath: 'images/coffee3.png',
                    coffeeName: 'Tea',
                    coffeePrice: '40',
                    coffeeSub: 'With extra black seed',
                  ),
                ],
              ))
            ],
        ),
      ),
    );
  }
}
