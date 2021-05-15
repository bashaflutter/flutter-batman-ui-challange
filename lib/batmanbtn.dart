import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

class BatmaBtn extends StatelessWidget {
  const BatmaBtn(
      {Key? key, required this.text, required this.onTap, this.left = true})
      : super(key: key);
  final VoidCallback onTap;
  final String text;
  final bool left;
  final _imagecolor = const Color(0xFFC8B853);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFDE86A),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: 55,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(
                children: [
                  if (left)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(-10.0)
                          ..rotateZ(vector.radians(35)),
                        child: Image.asset(
                          'assets/images/batman_logo.png',
                          height: 60,
                          color: _imagecolor,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  Center(
                    child: Text(
                      text,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (!left)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(10.0)
                          ..rotateZ(vector.radians(-35)),
                        child: Image.asset(
                          'assets/images/batman_logo.png',
                          height: 60,
                          color: _imagecolor,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
