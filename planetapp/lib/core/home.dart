import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

enum Values { pluto, mars, venus }

class _homeState extends State<home> {
  TextEditingController weightcontroller = new TextEditingController();
  double finalresult = 0.0;
  // Values? planet = Values.pluto;
  int radiovalue = 0;
  void handleradiovaluechanged(value) {
    setState(() {
      radiovalue = value;
      switch (radiovalue) {
        case 0:
          finalresult = weightcalculate(weightcontroller.text, 0.06);
          break;
        case 1:
          finalresult = weightcalculate(weightcontroller.text, 0.38);
          break;
        case 2:
          finalresult = weightcalculate(weightcontroller.text, 0.91);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weight on Planet X",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: [
          Container(
              height: 180,
              width: 200,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              child: Image.network(
                  "https://images.unsplash.com/photo-1614732414444-096e5f1122d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGxhbmV0fGVufDB8fDB8fA%3D%3D&w=1000&q=80")),
          Container(
            margin: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Column(
              children: [
                TextField(
                  controller: weightcontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Write a number",
                      label: Text("Enter a number"),
                      icon: Icon(Icons.person)),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Radio<int>(
                activeColor: Colors.orangeAccent,
                  value: 0,
                  groupValue: radiovalue,
                  onChanged: handleradiovaluechanged),
               Text(
                "Pluto",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              new Radio<int>(
                activeColor: Colors.redAccent,
                  value: 1,
                  groupValue: radiovalue,
                  onChanged: handleradiovaluechanged),
              Text(
                "Mars",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              new Radio<int>(
                activeColor: Colors.greenAccent,
                  value: 2,
                  groupValue: radiovalue,
                  onChanged: handleradiovaluechanged),
               Text(
                "Venus",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "$finalresult",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  weightcalculate(String planet, double d) {
    if (int.parse(planet).toString().isNotEmpty && int.parse(planet) > 0) {
      return (int.parse(planet) * d);
    } else {
      print("Wrong answer!!");
    }
    return (int.parse(planet) * 0.08);
  }
}
