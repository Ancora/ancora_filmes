//import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
//import 'package:ancorafilmes/favoritos/favoritos_bloc.dart';
//import 'package:ancorafilmes/favoritos/tab_favoritos.dart';
//import 'package:ancorafilmes/home/drawer.dart';
//import 'package:ancorafilmes/login/login_page.dart';
//import 'package:ancorafilmes/movies/movies_bloc.dart';
import 'package:ancorafilmes/movies/tab_movies.dart';
//import 'package:ancorafilmes/utils/nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Âncora Filmes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: _onClickLogout,
          )
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              text: "Filmes",
              icon: Icon(Icons.movie),
            ),
            Tab(
              text: "Favoritos",
              icon: Icon(Icons.favorite),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          TabMovies(),
          //TabFavoritos(),
        ],
      ),
      //drawer: DrawerMenu(),
    );
  }

  _onClickLogout() {
    //pushReplacement(context, LoginPage());
  }
}
