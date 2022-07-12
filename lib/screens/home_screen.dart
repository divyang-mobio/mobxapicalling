import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxapicalling/models/api_model.dart';
import '../controller/mobx_controller.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ApiController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (controller.state == ApiState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.state == ApiState.loaded) {
          return Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width*.9,
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      hintText: "enter title"
                  ),
                  onChanged: controller.searchTitle(_controller.text),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(child: listBuilder(controller.data)),
            ],
          );
        } else if (controller.state == ApiState.error) {
          return const Center(child: Text("error :("));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ApiController>(context, listen: false).getData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView listBuilder(List<DataModel> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 8,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${data[index].id}"),
                  const SizedBox(height: 10),
                  Text(data[index].title),
                ],
              ),
              subtitle: Text(data[index].body,
                  maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
          );
        });
  }
}
