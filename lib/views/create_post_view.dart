import 'package:flutter/material.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({Key? key}) : super(key: key);

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
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        "eheh",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )))),
    );
  }
}
