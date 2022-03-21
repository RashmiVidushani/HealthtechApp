import 'package:flutter/material.dart';

class Deco extends StatelessWidget {
  const Deco(
      {Key? key,
      required this.country,
      required this.time,
      required this.activecases,
      required this.continent})
      : super(key: key);

  final String activecases;
  final String country;
  final String continent;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 218, 243, 189),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 13, 48, 4).withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        /*
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),*/
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.schedule,
                  color: Colors.yellow,
                  size: 18,
                ),
                const SizedBox(width: 7),
                Text(time),
              ],
            ),
          ),
          Align(
            child: Row(
              children: [
                Text(
                  country,
                  style: const TextStyle(fontSize: 20),
                ),
                const Icon(
                  Icons.check_circle,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 18,
                ),
                const SizedBox(width: 7),
                Text(activecases),
              ],
            ),
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        color: Color.fromARGB(255, 40, 49, 35),
                        size: 18,
                      ),
                      const SizedBox(width: 7),
                      Text(continent),
                    ],
                  ),
                ),
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}
