import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../models/interest.dart';

class VeebzSingleView extends StatelessWidget {
  const VeebzSingleView({Key? key, required this.interest}) : super(key: key);

  final Interest interest;

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: ObjectKey,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Material(
              borderRadius: BorderRadius.circular(70),
              color: Colors.black.withOpacity(0.5),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 71,
                      child: CircleAvatar(
                          radius: 70,
                          backgroundImage: Image.network(
                            interest.imgLink,
                            errorBuilder: (context, error, stackTrace) =>
                                const Text("c'est cassé"),
                          ).image),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(interest.name,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25)),
                    ),
                    Center(
                        child: Column(
                      children: [
                        Text(
                          interest.veebers.toString() + "k",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Veebers",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                              Icon(Icons.person, color: Colors.blueAccent)
                            ]),
                      ],
                    )),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Column(children: [
                              Text(
                                interest.affinity.toString() + "%",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              Row(
                                children: [
                                  const Text('Affinité',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                  Transform.rotate(
                                      angle: -90 * math.pi / 180,
                                      child: const Icon(
                                        Icons.play_arrow_rounded,
                                        color:
                                            Color.fromARGB(255, 226, 125, 159),
                                        size: 30,
                                      ))
                                ],
                              )
                            ])),
                        const Spacer(),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            child: Column(children: [
                              Text(
                                interest.postsNmb.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("Posts",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                  Icon(
                                    Icons.square_rounded,
                                    color: Colors.orange,
                                    size: 20,
                                  )
                                ],
                              )
                            ]))
                      ],
                    ),
                  ]),
                ),
              ),
            )));
  }
}
