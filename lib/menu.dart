import 'package:corretoramb/Home_MB.dart';
import 'package:corretoramb/cad_dados_clientes.dart';
import 'package:flutter/material.dart';


class Menu1 extends StatefulWidget {
  _Menu1 createState() => _Menu1();
}

class _Menu1 extends State<Menu1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: Colors.deepOrangeAccent,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("user@mail.com"),
              accountName: Text("MBPseguros"),
              currentAccountPicture: CircleAvatar(
                child: Text("MBP"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.emoji_people),
              title: Text("Minha conta"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeMB()));
              },
            ),
            ListTile(
              leading: Icon(Icons.edit_note),
              title: Text("Cadastrar"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => cad_dados_clientes()));
              },
            ),
            ListTile(
              leading: Icon(Icons.manage_search),
              title: Text("Consultar"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.cloud_upload),
              title: Text("Carregar Arquivos"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.cloud_download),
              title: Text("Downloads"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
