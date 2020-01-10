import 'package:flutter/material.dart';
import 'package:flutter_walt_enterprise/components/drawer_component.dart';

class IndexPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('尼安德特'),
        ),
        drawer: Drawer(
          child: DrawerComponent(),
        ),
        body: Text('wrwer'),
      ),
    );
  }

}
