import 'package:alfred_interview/ui/cryptocurrency/list/bpi_animated_color_text.dart';
import 'package:alfred_interview/ui/cryptocurrency/list/bpi_list_state.dart';
import 'package:flutter/material.dart';

class BPIListWidget extends StatelessWidget {
  final BPIListState bpi;

  const BPIListWidget({super.key, required this.bpi});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BPIItem(
          key: const ValueKey('USD'),
          currencyRateChange: bpi.usd,
        ),
        const SizedBox(height: 16),
        BPIItem(
          key: const ValueKey('EUR'),
          currencyRateChange: bpi.eur,
        ),
        const SizedBox(height: 16),
        BPIItem(
          key: const ValueKey('GBP'),
          currencyRateChange: bpi.gbp,
        ),
      ],
    );
  }
}

class BPIItem extends StatelessWidget {
  final CurrencyRateChange? currencyRateChange;

  const BPIItem({
    required Key key,
    required this.currencyRateChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFEFEFEF),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFFF5C00),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  currencyRateChange?.current.code ?? '---',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          if (currencyRateChange == null)
            const Text('---')
          else
            BPIAnimatedText(currencyRateChange: currencyRateChange!),
        ],
      ),
    );
  }
}
