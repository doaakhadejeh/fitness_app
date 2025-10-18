import 'package:fitnessapp/controller/chatcontroller/chatroomcontroller.dart';
import 'package:fitnessapp/core/class/handlingdata.dart';
import 'package:fitnessapp/core/constant/imageconst.dart';
import 'package:fitnessapp/view/screen/chat/messageroom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chatroom extends StatelessWidget {
  const Chatroom({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Chatroomcontroller());

    return GetBuilder<Chatroomcontroller>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Chat Rooms"),
          backgroundColor: Colors.deepPurple[700],
          foregroundColor: Colors.white,
        ),
        body: Handlingdatarequest(
          stateerr: controller.stateerr!,
          child: ListView.builder(
            itemCount: controller.chat.length,
            itemBuilder: (context, index) {
              final room = controller.chat[index];
              return InkWell(
                onTap: () {
                  Get.to(() => const Messageroom(), arguments: {
                    "chatRoomId": room["id"].toString(),
                    "nameroom": room["name"],
                    "image": "${Imageconst.imageback}${room["image"]}",
                    "isimg": room["image"],
                    "isgroup": room['is_group']
                  });
                },
                onLongPress: () {
                  Get.bottomSheet(
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: controller.nameup,
                            decoration: InputDecoration(
                              hintText: "Enter new room name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  controller.chooseImage();
                                },
                                icon: const Icon(Icons.image),
                                label: const Text("Change Image"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple[300],
                                ),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                onPressed: () {
                                  controller.updatechat(room["id"]);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple[600],
                                ),
                                child: const Text("Update"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  color: Colors.white70,
                  child: ListTile(
                    leading: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundColor: Colors.deepPurple[100],
                        backgroundImage: room["image"] != null
                            ? NetworkImage(
                                "${Imageconst.imageback}${room["image"]}")
                            : null,
                        child: room["image"] == null
                            ? const Icon(Icons.group, color: Colors.white)
                            : null,
                      ),
                    ),
                    title: Text(
                      room["name"] ?? "No Name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[400]),
                    ),
                    subtitle: Text(
                      room["latestMessage"] ?? "",
                      style: TextStyle(color: Colors.deepPurple[200]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: GetBuilder<Chatroomcontroller>(
                  builder: (controller) => Column(
                    children: [
                      TextField(
                        controller: controller.name,
                        decoration: InputDecoration(
                          hintText: "Enter room name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // ✅ اختيار صورة
                      Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              controller.chooseImage();
                            },
                            icon: const Icon(Icons.image),
                            label: const Text("Choose Image"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.deepPurple[300],
                            ),
                          ),
                          if (controller.imageFile != null) ...[
                            const SizedBox(width: 12),
                            const Icon(Icons.check_circle, color: Colors.green),
                          ]
                        ],
                      ),
                      const SizedBox(height: 12),

                      // ✅ اختيار إذا مجموعة أو خاصة
                      SwitchListTile(
                        title: const Text("Is Group?"),
                        value: controller.isGroup,
                        onChanged: (val) {
                          controller.isGroup = val;
                          controller.update();
                        },
                      ),

                      const Divider(),

                      // ✅ عرض المستخدمين مع CheckBox
                      Expanded(
                        flex: 3,
                        child: ListView.builder(
                          itemCount: controller.user.length,
                          itemBuilder: (context, index) {
                            final u = controller.user[index];
                            final userId = u["id"].toString();
                            final isSelected =
                                controller.selectedUsers.contains(userId);

                            return CheckboxListTile(
                              title: Text(u["name"]),
                              value: isSelected,
                              onChanged: (val) {
                                if (val == true) {
                                  controller.selectedUsers.add(userId);
                                } else {
                                  controller.selectedUsers.remove(userId);
                                }
                                controller.update();
                              },
                            );
                          },
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              controller.addchat();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple[600],
                              foregroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 45),
                              // padding: EdgeInsets.all(0)
                            ),
                            child: const Text("Create Chat"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          backgroundColor: Colors.deepPurple[700],
          tooltip: "Add Chat",
          child: const Icon(Icons.add, color: Colors.white),
        ),
      );
    });
  }
}
