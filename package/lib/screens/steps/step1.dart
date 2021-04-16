part of '../checkout.dart';

class CheckoutStep1 extends StatelessWidget {
  final String _title = 'Choose the card that fits your growth';
  final List<_CardItem> _cardItems = const <_CardItem>[
    _CardItem(
      image:
          'https://ei.marketwatch.com/Multimedia/2018/06/25/Photos/NS/MW-GL478_Card_B_20180625105902_NS.png?uuid=4c0f5000-7888-11e8-ba2c-ac162d7bc1f7',
      title: 'One',
      subtitle: 'Pay up to 20.000\$ / month',
    ),
    _CardItem(
      image:
          'https://ei.marketwatch.com/Multimedia/2018/06/25/Photos/NS/MW-GL478_Card_B_20180625105902_NS.png?uuid=4c0f5000-7888-11e8-ba2c-ac162d7bc1f7',
      title: 'Plus',
      subtitle: 'Pay up to 40.000\$ / month',
    ),
    _CardItem(
      image:
          'https://ei.marketwatch.com/Multimedia/2018/06/25/Photos/NS/MW-GL478_Card_B_20180625105902_NS.png?uuid=4c0f5000-7888-11e8-ba2c-ac162d7bc1f7',
      title: 'X',
      subtitle: 'Pay up to 60.000\$ / month',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      childXs: ListView(
        children: <Widget>[
          Text(_title),
          ..._cardItems.map((_CardItem e) => Container()).toList(),
        ],
      ),
      childLg: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(_title),
          ),
          Expanded(
            child: Row(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardItem {
  const _CardItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;
}
