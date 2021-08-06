import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:disenos/src/theme/theme.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos/src/routes/routes.dart';


class LauncherPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
   );
  }
}

class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) =>Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (BuildContext context, int index) =>ListTile(
        leading: FaIcon(pageRoutes[index].icon,color: appTheme.accentColor,),
        title: Text(pageRoutes[index].titulo),
        trailing: Icon(Icons.chevron_right,color: appTheme.accentColor,),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>pageRoutes[index].page));
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  final appTheme = Provider.of<ThemeChanger>(context);
  final accentColor = appTheme.currentTheme.accentColor;
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text('UV',style: TextStyle(fontSize: 50),),
                ),
              ),
            ),
            Expanded(child: _ListaOpciones()),
            ListTile(
              leading: Icon(Icons.lightbulb_outline,color: accentColor,),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(value: appTheme.darkTheme, onChanged: (value)=>appTheme.darkTheme = value),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left:false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen,color: accentColor,),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(value: appTheme.customTheme, onChanged: (value)=>appTheme.customTheme = value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}