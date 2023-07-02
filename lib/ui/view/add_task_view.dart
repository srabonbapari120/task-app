import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/add_task_controller.dart';
import '../utils/text_style.dart';
import '../widget/app_bar_widget.dart';
import '../widget/button_widget.dart';
import '../widget/text_field_widget.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {

  final AddTaskController addTaskController = Get.put(AddTaskController());
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppBarWidget(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Add New Task",
                      style: textTitleStyle,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter Title";
                      }
                      return null;
                    },
                    hintText: 'Title',
                    controller: title,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFieldWidget(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter Description";
                      }
                      return null;
                    },
                    hintText: 'Description',
                    controller: description,
                    mixLine: 5,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => addTaskController.loading == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ButtonWidget(
                            icon: Icons.send,
                            onPress: () {
                              if (formkey.currentState!.validate()) {
                                addTaskController.postTask(
                                  title.text,
                                  description.text,
                                  context,
                                );
                              }
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
