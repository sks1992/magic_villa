import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_villa/core/controllers/villa_controller.dart';

class VillaScreen extends StatelessWidget {
  VillaScreen({Key? key}) : super(key: key);

  final controller = Get.put(VillaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Villa"),
      ),
      body: Obx(
        () => controller.showLinearProgress.value?const Center(child: CircularProgressIndicator(),):ListView.builder(
            itemCount: controller.villasList.value.length,
            itemBuilder: (context, index) {
              var data = controller.villasList.value[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text("Name",style: TextStyle(color: Colors.black),),
                        subtitle: Text(data.name!,style: TextStyle(color: Colors.black),),
                      ),
                      const SizedBox(height: 8),
                      ListTile(
                        title: const Text("Occupancy",style: TextStyle(color: Colors.black),),
                        subtitle: Text(data.occupancy.toString(),style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
