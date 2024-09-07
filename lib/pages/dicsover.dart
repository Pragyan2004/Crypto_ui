import 'package:crypto_ui/components/item.dart';
import 'package:flutter/material.dart';

class Discovery extends StatelessWidget {
  const Discovery({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Number of items
                itemBuilder: (context, index) {
                  return Item(
                    // item: coinMarket![index], // Ensure `coinMarket` is defined if used
                  );
                },
              ),
            ),
            // Uncomment and add `CircularProgressIndicator` if needed for other purposes
            // Center(
            //   child: CircularProgressIndicator(),
            // ),
          ],
        ),
      ),
    );
  }
}
