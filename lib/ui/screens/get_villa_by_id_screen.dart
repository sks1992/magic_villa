import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_villa/core/controllers/villa_controller.dart';
import 'package:magic_villa/core/util_or_constants/extensions.dart';
import 'package:magic_villa/ui/widgets/reusable_text_field.dart';

class GetVillaByIdScreen extends StatelessWidget {
  GetVillaByIdScreen({Key? key}) : super(key: key);

  final controller = Get.put(VillaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Villa By ID"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ReusableTextField(
              controller: controller.id,
              labelText: "id",
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: () async {
                await controller.getVillaById(controller.id.text.toInt());
              },
              child: const Text("Get Villa"),
            ),
            Obx(
              () =>controller.showData.value?  controller.showLinearProgress1.value
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        ListTile(
                          title: const Text("Name",style: TextStyle(color: Colors.black),),
                          subtitle: Text("${controller.villa.name}",style: TextStyle(color: Colors.black),),
                        ),
                        ListTile(
                          title: const Text("Occupancy",style: TextStyle(color: Colors.black),),
                          subtitle: Text("${controller.villa.occupancy}",style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ):const SizedBox.shrink() ,
            ),
          ],
        ),
      ),
    );
  }
}
