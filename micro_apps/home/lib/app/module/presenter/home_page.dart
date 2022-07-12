import 'package:flutter/material.dart';
import 'package:login/app/module/infra/models/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.model}) : super(key: key);
  final LoginModel model;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Código: ${widget.model.code}'),
            Text('Status: ${widget.model.message}'),
            const SizedBox(
              height: 15,
            ),
            Text('Token: \n${widget.model.dataEntity?['token']}'),
            const SizedBox(
              height: 15,
            ),
            Text('Link: ${widget.model.dataEntity?['links'][0]}'),
            Text('Link: ${widget.model.dataEntity?['links'][1]}'),
          ],
        ),
      ),
    );
  }
}
