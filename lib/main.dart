import 'package:flutter/material.dart';
import 'package:kalories/exercise.dart';
import 'food.dart';

void main() => runApp(const MaterialApp(
    home: Home(),
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int kalcounter = 0;

  List<Exercise> Ekals = [
    Exercise(EName: "Swimming", Ekal: "198"),
    Exercise(EName: "Sprint", Ekal: "240"),
    Exercise(EName: "High Knee", Ekal: "240"),
    Exercise(EName: "Butt Kicks", Ekal: "240"),
  ];

  List<Food> kals = [
    Food(foodName: "Chappati", foodKal: "71"),
    Food(foodName: "Snicker", foodKal: "100"),
    Food(foodName: "Apples", foodKal: "52"),
    Food(foodName: "Rice", foodKal: "130"),
    Food(foodName: "Whole Grain Bread", foodKal: "340"),
  ];

  Widget foodTemp(kals, delete) {

    return Card(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(kals.foodName,
                     style: const TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 20
                     ),
                   ),
                   const SizedBox(height: 5),
                   Text(kals.foodKal,
                     style: const TextStyle(
                       fontSize: 15,
                     ),
                   ),
                 ],
               ),
               TextButton(
                 onPressed: delete,
                 child: const Icon(
                     Icons.add
                 ),
               )
             ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalories"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Having something??",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                ),
              ],
            ),
            const SizedBox(height: 50,),
            const Text("Current Kal",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Text("$kalcounter",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: kals.map((e) => foodTemp(
                  e,
                  () {
                    setState(() {
                      kalcounter = kalcounter + int.parse(e.foodKal);
                    });
                  }
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
