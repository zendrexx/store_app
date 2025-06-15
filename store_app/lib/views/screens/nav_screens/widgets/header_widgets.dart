import 'package:flutter/material.dart';

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.20,

      child: Stack(
        children: [
          Image.asset(
            "assets/icons/searchBanner.jpeg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),

          Positioned(
            left: 25,
            top: 40,
            child: SizedBox(
              width: 200,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Image.asset('assets/icons/searc1.png'),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Image.asset('assets/icons/cam.png'),
                  ),
                  hintText: "Enter Text",
                  hintStyle: TextStyle(fontSize: 14, color: Color(0xFF7f7f7f)),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  fillColor: Colors.grey.shade200,
                  focusColor: Colors.black,
                  filled: true,
                ),
              ),
            ),
          ),
          Positioned(
            left: 225,
            top: 43,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/bell.png', height: 30, width: 30),
            ),
          ),
          Positioned(
            left: 270,
            top: 43,
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/message.png',
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
