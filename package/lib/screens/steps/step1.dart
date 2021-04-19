part of '../checkout.dart';

class CheckoutStep1 extends StatelessWidget {
  const CheckoutStep1({this.onSelected});
  final Function()? onSelected;

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
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              _title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ..._cardItems.map((_CardItem e) {
            return Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 3,
                    color: Colors.black.withOpacity(.05),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: onSelected,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Image.network(e.image),
                      trailing: Icon(Icons.chevron_right),
                      title: Text(e.title),
                      subtitle: Text(e.subtitle),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
      childLg: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 40,
            ),
            child: Text(
              _title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: _cardItems
                  .map(
                    (_CardItem e) => Container(
                      width: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Image.network(
                            e.image,
                            height: 300,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            e.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(e.subtitle),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: onSelected,
                            child: Text('Choose card'),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
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
