import 'package:fitnessapp/controller/chatcontroller/messageroomcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Messageroom extends StatelessWidget {
  const Messageroom({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Messageroomcontroller());
    return GetBuilder<Messageroomcontroller>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple[300],
              backgroundImage: controller.isimg != null
                  ? NetworkImage(controller.image!)
                  : null,
              child: controller.isimg == null
                  ? const Icon(Icons.group, color: Colors.white)
                  : null,
            ),
          ),
          backgroundColor: Colors.deepPurple[100],
          foregroundColor: Colors.white,
          title: InkWell(
            onTap: () {
              Get.bottomSheet(BottomSheet(
                  onClosing: () {},
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: controller.member.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(controller.member[i]["name"]),
                          );
                        },
                      ),
                    );
                  }));
            },
            child: Text(
              controller.nameroom ?? "user name",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            controller.isgroup == 0 ||
                    controller.services.shared.getString("role") == "user"
                ? Container()
                : IconButton(
                    icon: const Icon(Icons.person_add),
                    onPressed: () {
                      Get.bottomSheet(
                        Container(
                          height: Get.height * 0.6,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: GetBuilder<Messageroomcontroller>(
                            builder: (controller) => Column(
                              children: [
                                const Text(
                                  "Add users to this chat",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Divider(),

                                // ✅ قائمة المستخدمين
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: controller.user.length,
                                    itemBuilder: (context, index) {
                                      final u = controller.user[index];
                                      final userId = u["id"].toString();
                                      final isSelected = controller
                                          .selectedUsers
                                          .contains(userId);

                                      return CheckboxListTile(
                                        title: Text(u["name"]),
                                        value: isSelected,
                                        onChanged: (val) {
                                          if (val == true) {
                                            controller.selectedUsers
                                                .add(userId);
                                          } else {
                                            controller.selectedUsers
                                                .remove(userId);
                                          }
                                          controller.update();
                                        },
                                      );
                                    },
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: () {
                                    controller.addusertochat();
                                    Get.back();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple[600],
                                    foregroundColor: Colors.white,
                                    minimumSize:
                                        const Size(double.infinity, 45),
                                  ),
                                  child: const Text("Add Users"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
        body: Column(
          children: [
            // قائمة الرسائل
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  var message = controller.messages[index];
                  bool isMe = message["sender_id"].toString() ==
                      controller.services.shared.getString("id");
                  return Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: InkWell(
                      onHover: (val) {
                        !isMe ? controller.seenmessage(message["id"]) : null;
                      },
                      onLongPress: () {
                        Get.defaultDialog(
                            title: "delete message?",
                            content: TextButton.icon(
                              onPressed: () {
                                controller.deletechat(message["id"]);
                                controller.getmessage();
                              },
                              label: const Text(
                                "delete",
                                style: TextStyle(color: Colors.pink),
                              ),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.pink,
                              ),
                            ));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(12),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7),
                        decoration: BoxDecoration(
                          color: isMe
                              ? Colors.deepPurple[200]
                              : Colors.deepPurple[50],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (!isMe)
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "${message["sender"]["name"]}",
                                    style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w800),
                                  )),
                            Align(
                              alignment: isMe
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Text(
                                message["message"] ?? "",
                                style: TextStyle(
                                    color: isMe ? Colors.white : Colors.black),
                              ),
                            ),
                            if (isMe)
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.done_all,
                                  color: message["seen"] == 1
                                      ? Colors.amber[200]
                                      : Colors.grey[800],
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // حقل إدخال الرسالة
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.message,
                      decoration: InputDecoration(
                        hintText: "Type your message...",
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.deepPurple[600],
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {
                        controller.sendmessage();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
