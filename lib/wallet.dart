import 'package:flutter/material.dart';
import 'package:toons/widgets/button.dart';
import 'package:toons/widgets/currency_card.dart';
import 'package:toons/widgets/dark_mode_card.dart';

void main() {
  runApp(App());
}

// Root Widget - inherits from StatelessWidget
class App extends StatelessWidget {
  // build ui
  @override
  Widget build(BuildContext context) {
    // use material app ( or cupertino app )
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xff181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 18,
                          ),
                        ),
                        const Text(
                          'Jinho Kim',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '\$ 5,194,482',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Button(
                      text: 'Transfer',
                      bgColor: Color(0xfff2b33a),
                      textColor: Color(0xff181818),
                    ),
                    Button(
                      text: 'Require',
                      bgColor: Color(0xff1f2123),
                      textColor: Colors.white,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View all',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const DarkModeCard(
                  name: "Bitcoin",
                  amount: "12.34",
                  code: "BTC",
                  icon: Icons.currency_bitcoin_rounded,
                  dark: true,
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: const DarkModeCard(
                    name: "Ethereum",
                    amount: "473.37",
                    code: "ETH",
                    icon: Icons.currency_exchange_rounded,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: const CurrencyCard(
                    name: "Dollar",
                    amount: 3495.15,
                    code: "USD",
                    bgColor: Color(0xff243555),
                    textColor: Colors.white,
                    icon: Icon(
                      Icons.attach_money_rounded,
                      color: Colors.white,
                      size: 95,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -60),
                  child: const CurrencyCard(
                    icon: Icon(
                      Icons.euro_symbol_rounded,
                      color: Colors.white,
                      size: 95,
                    ),
                    name: "Euro",
                    amount: 9.153,
                    code: "EUR",
                    bgColor: Colors.cyan,
                    textColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
