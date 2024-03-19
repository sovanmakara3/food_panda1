import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key,});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.pink.shade400),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage('https://imgs.search.brave.com/HBl_T5KkQuwZdTbyhCnScuHZSxrbjYnoPxf1GoRGzPk/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93YWxs/cGFwZXJzLmNvbS9p/bWFnZXMvaGQvbHVm/ZnktMTI3MC14LTEy/NzAtcGljdHVyZS1x/ODAzNGQxNnkzM296/NXljLmpwZw'),
            ),
            accountName: Text('Mokey D. Luffy'),
            accountEmail: Text('Personal account'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.rectangle, color: Colors.pink[700],),
            title: Text('Become a pandapro'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.ticket_outline, color: Colors.pink[700],),
            title: Text('Vouchers & offers'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.heart_outline, color: Colors.pink[700],),
            title: Text('Favourites'),
          ),
          // SizedBox(height: 5),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.receipt_outline, color: Colors.pink[700],),
            title: Text('Order & reordering'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.person_outline, color: Colors.pink[700],),
            title: Text('Profile'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.location_outline, color: Colors.pink[700],),
            title: Text('Addresses'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.card_outline, color: Colors.pink[700],),
            title: Text('Payment methods'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.trophy_outline, color: Colors.pink[700],),
            title: Text('Panda rewards'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.help_circle_outline, color: Colors.pink[700],),
            title: Text('Help Center'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.business_outline, color: Colors.pink[700],),
            title: Text('foodpanda for business'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.gift_outline, color: Colors.pink[700],),
            title: Text('Invite friends'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.settings_outline, color: Colors.pink[700],),
            title: Text('Setting'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.ellipsis_horizontal_outline, color: Colors.pink[700],),
            title: Text('More'),
          ),
          SizedBox(height: 50),
          ListTile(
            onTap: () {},
            leading: Icon(Ionicons.log_out_outline, color: Colors.pink[700],),
            title: Text('Log out'),
          ),
        ],
      ),
    );

  }

}

