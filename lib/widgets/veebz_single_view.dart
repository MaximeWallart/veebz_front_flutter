import 'package:flutter/material.dart';

class VeebzSingleView extends StatelessWidget {
  const VeebzSingleView({Key? key, required this.veeb}) : super(key: key);

  final String veeb;

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: ObjectKey,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.5),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    Text(veeb, style: const TextStyle(color: Colors.white)),
                    Row(
                      children: const [
                        Center(
                          child: Text('ouais ouais',
                              style: TextStyle(color: Colors.white)),
                        ),
                        Spacer(),
                        Center(
                          child: Text("ça dis quoi ?",
                              style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                    const Center(
                      child: Text("jsp moi",
                          style: TextStyle(color: Colors.white)),
                    )
                  ]),
                ),
              ),
            )));
  }
}
