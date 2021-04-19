part of '../checkout.dart';

class CheckoutStep2 extends StatelessWidget {
  const CheckoutStep2({this.onSelected});
  final Function()? onSelected;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      childXs: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 768),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Select the future cardholder',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(8),
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
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    'Search a cardholder',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            for (int i = 0; i < 5; i++)
              Container(
                margin: const EdgeInsets.only(top: 8),
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
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://avatarfiles.alphacoders.com/209/thumb-209215.jpg',
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right),
                        title: Text('Đa Vít Nam Khoa'),
                        subtitle: Text('Hậu duệ nhà tiên tri vũ trụ'),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
