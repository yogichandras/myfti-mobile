import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomInputFileFieldWidget extends StatefulWidget {
  final File? defaultValue;
  final Function(File?)? onSaved;
  final String? Function(File?)? validator;

  const CustomInputFileFieldWidget(
      {super.key, this.defaultValue, this.onSaved, this.validator});

  @override
  State<CustomInputFileFieldWidget> createState() =>
      _CustomInputFileFieldWidgetState();
}

class _CustomInputFileFieldWidgetState
    extends State<CustomInputFileFieldWidget> {
  File? _image;

  @override
  void initState() {
    super.initState();

    if (widget.defaultValue != null) {
      setState(() {
        _image = widget.defaultValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    onPickImage(FormFieldState<File> formFieldState) async {
      try {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(
            source: ImageSource.gallery, imageQuality: 50);

        if (image != null) {
          formFieldState.validate();
          formFieldState.didChange(File(image.path));
          formFieldState.save();

          widget.onSaved!(File(image.path));

          setState(() {
            _image = File(image.path);
          });
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }

    return FormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      initialValue: widget.defaultValue,
      onSaved: (newValue) => widget.onSaved!(newValue),
      builder: (formFieldState) => Column(
        children: [
          if (_image != null)
            InkWell(
              onLongPress: () {},
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: FileImage(_image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => onPickImage(formFieldState),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: const [
                  Icon(Icons.image),
                  SizedBox(width: 10),
                  Text('Upload Foto'),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
          if (formFieldState.hasError)
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 10),
              child: Text(
                formFieldState.errorText!,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 13,
                    color: Colors.red[700],
                    height: 0.5),
              ),
            )
        ],
      ),
    );
  }
}
