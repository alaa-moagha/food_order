import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_order/core/enums/message_type.dart';
import 'package:food_order/ui/shared/custom_widgets/custom_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/translation/app_translation.dart';
import '../../shared/colors.dart';
import '../../shared/custom_widgets/custom_button.dart';

class SignupView extends StatefulWidget {
  SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _Singup2ViewState();
}

class _Singup2ViewState extends State<SignupView> {
  final ImagePicker picker = ImagePicker();
  FileModel? selectedFile;
  bool showOptions = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Center(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              InkWell(
                onTap: selectedFile == null || selectedFile!.path.isEmpty
                    ? () {
                        setShowOPtion(true);
                      }
                    : null,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.mainOrangeColor,
                  child: selectedFile == null
                      ? Icon(Icons.person)
                      : selectedFile!.path.isNotEmpty &&
                              selectedFile!.type == FileType.FILE
                          ? Icon(Icons.file_copy)
                          : selectedFile!.path.isNotEmpty
                              ? Image.file(File(selectedFile!.path))
                              : Icon(Icons.person),
                ),
              ),
              Visibility(
                  visible:
                      selectedFile != null && selectedFile!.path.isNotEmpty,
                  child: InkWell(
                    onTap: () {
                      setShowOPtion(true);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.mainBlueColor,
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Visibility(
          visible: showOptions,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                text: tr("camera"),
                onPressed: () {
                  pickFile(FileType.CAMERA)
                      .then((value) => selectedFile = value);
                },
              ),
              CustomButton(
                text: tr("gallery"),
                onPressed: () {
                  pickFile(FileType.GALLERY)
                      .then((value) => selectedFile = value);
                },
              ),
              CustomButton(
                text: tr("file"),
                onPressed: () {
                  pickFile(FileType.FILE).then((value) => selectedFile = value);
                },
              ),
            ],
          ),
        ),
        CustomButton(
            text: tr("contact_us"),
            onPressed: () {
              String? encodeQueryParameters(Map<String, String> params) {
                return params.entries
                    .map((MapEntry<String, String> e) =>
                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    .join('&');
              }

              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'smith@example.com',
                query: encodeQueryParameters(<String, String>{
                  'subject': 'feedback',
                }),
              );

              launchUrl(emailLaunchUri);
            }),
        CustomButton(
            text: tr("open_url"),
            onPressed: () async {
              final Uri _url = Uri.parse('https://flutter.dev');
              if (!await launchUrl(
                _url,
                mode: LaunchMode.externalApplication,
              )) {
                CustomToast.showMessage(
                    message: tr("url_error"),
                    messageType: MessageType.REJECTED);
              }
            }),
      ]),
    );
  }

  void setShowOPtion(bool value) {
    setState(() {
      showOptions = value;
    });
  }

  Future<FileModel> pickFile(FileType type) async {
    String path = '';

    switch (type) {
      case FileType.CAMERA:
        await picker
            .pickImage(source: ImageSource.camera)
            .then((value) => path = value?.path ?? '');
        break;
      case FileType.GALLERY:
        await picker
            .pickImage(source: ImageSource.gallery)
            .then((value) => path = value?.path ?? '');
        break;
      case FileType.FILE:
        await FilePicker.platform
            .pickFiles()
            .then((value) => path = value?.paths[0] ?? '');
        break;
    }
    setShowOPtion(false);
    return FileModel(path.isNotEmpty ? path : selectedFile!.path,
        path.isNotEmpty ? type : selectedFile!.type);
  }
}

class FileModel {
  FileType type;
  String path;

  FileModel(this.path, this.type);
}

enum FileType { CAMERA, GALLERY, FILE }
