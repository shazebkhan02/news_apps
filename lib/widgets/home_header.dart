import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children:[
              CircleAvatar(
                radius: 20,
                backgroundImage:NetworkImage("https://cdn-icons-png.flaticon.com/512/189/189533.png"),),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome back!",style: TextStyle(fontWeight: FontWeight.normal),),
                  Text("Shahiyan 👋",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
          Icon(Icons.notifications),
        ],
      ),
    );
  }
}
