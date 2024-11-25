import 'package:flutter/material.dart';

class CardProductUpload extends StatefulWidget {
  const CardProductUpload(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.buttonText,
      required this.iconButton,
      required this.iconMain,
      required this.onTap})
      : super(key: key);
  final title, subTitle, buttonText;
  final iconButton, iconMain;
  final onTap;

  @override
  State<CardProductUpload> createState() => _CardProductUploadState();
}

class _CardProductUploadState extends State<CardProductUpload> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 5),
      child: Container(
        height: 180,
        child: Card(
          color: Colors.white,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 28.0, top: 28, bottom: 28, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(
                        widget.iconMain,
                        size: 30,
                        color: Colors.indigo,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          '${widget.subTitle}',
                          maxLines: 3,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12)),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, top: 8.0),
                        child: SizedBox(
                          height: 45,
                          width: 180,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero,
                                          side: BorderSide(
                                              color: Colors.indigo)))),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.0, right: 8),
                                    child: Icon(
                                      widget.iconButton,
                                      color: Colors.indigo,
                                      size: 20,
                                    ),
                                  ),
                                  Text(widget.buttonText.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.indigo)),
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
