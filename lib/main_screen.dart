import 'package:flutter/material.dart';
import 'package:ludo_flutter/ludo_provider.dart';
import 'package:ludo_flutter/widgets/board_widget.dart';
import 'package:ludo_flutter/widgets/dice_widget.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
             Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const BoardWidget(),
                Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                  width: 50,
                  height: 50,
                  child: const DiceWidget(),
                )),
              ],
            ),
            Consumer<LudoProvider>(
              builder: (context, value, child) => value.winners.length == 3
                  ? Container(
                      color: Colors.black.withOpacity(0.8),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/thankyou.gif"),
                            const Text("Thank you for playing 😙",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.center),
                            Text(
                                "The Winners is: ${value.winners.map((e) => e.name.toUpperCase()).join(", ")}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30),
                                textAlign: TextAlign.center),
                            const Divider(color: Colors.white),
                            const Text(
                                "This game made with Flutter ❤️ by Nabraj Khadka",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                                textAlign: TextAlign.center),
                            const SizedBox(height: 20),
                            const Text("Refresh your browser to play again",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
