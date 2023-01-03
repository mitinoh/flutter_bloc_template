import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<HomeBloc>(context).add();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Home page"));
  }
}
