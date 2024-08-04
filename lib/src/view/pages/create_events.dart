import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/src/app/api/api.dart';
import 'package:untitled/src/app/model/create_event.dart';
import 'package:untitled/src/view/widgets/auth_grad_button.dart';
import 'package:untitled/src/view/widgets/cus_date_picker.dart';
import 'package:untitled/src/view/widgets/custom_textfield.dart';

class CreateEvents extends StatefulWidget {
  const CreateEvents({super.key});

  @override
  State<CreateEvents> createState() => _CreateEventsState();
}

class _CreateEventsState extends State<CreateEvents> {
  late LatLng latLng;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> _from = ValueNotifier<String>('');
    final ValueNotifier<String> _to = ValueNotifier<String>('');

    final TextEditingController title = TextEditingController();
    final TextEditingController desc = TextEditingController();
    final TextEditingController add = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go("/settings");
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          "Create Event",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                labelText: "Event Title", hintText: "", controller: title),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                labelText: "Description", hintText: "", controller: desc),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              labelText: "Address",
              hintText: "",
              controller: add,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CusDatePicker(_from, "From"),
                const Text("--  "),
                CusDatePicker(_to, "To"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              // clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.yellow.shade600,
                  borderRadius: BorderRadius.circular(15)),
              child: MaterialButton(
                onPressed: () async {
                  latLng = await context.push("/getLoc") as LatLng;
                },
                child: Text("Location"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AuthGradientButton(
                buttonText: "Create Event",
                onPressed: () async {
                  await Apis().creatEvent(
                    CreateEvent(
                        title: title.text,
                        desc: desc.text,
                        location: LatLng(latLng.latitude, latLng.latitude),
                        eventPlace: add.text,
                        startTime: _from.toString(),
                        endTime: _to.toString(),
                        author: "aman"),
                  );
                })
          ],
        ),
      ),
    );
  }
}
