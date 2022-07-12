import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller/mobx_controller.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${controller.data[index].id}"),
                        const SizedBox(height: 10),
                        Text(controller.data[index].title),
                      ],
                    ),
                    subtitle: Text(controller.data[index].body,
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                  ),
                );
              });
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
}
