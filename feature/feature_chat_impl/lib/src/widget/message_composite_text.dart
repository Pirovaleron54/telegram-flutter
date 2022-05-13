import 'package:feature_chat_impl/feature_chat_impl.dart';
import 'package:flutter/material.dart';
import 'package:rich_text_format/rich_text_format.dart' as rt;

import 'message_text.dart';

class MessageCaption extends StatelessWidget {
  const MessageCaption({
    super.key,
    required this.text,
    required this.shortInfo,
  });

  final rt.RichText text;
  final Widget shortInfo;

  @override
  Widget build(BuildContext context) {
    final ChatContextData chatContextData = ChatContext.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: chatContextData.horizontalPadding,
        right: chatContextData.horizontalPadding,
        top: chatContextData.verticalPadding,
        bottom: chatContextData.verticalPadding,
      ),
      child: MessageText(
        text: text,
        shortInfo: shortInfo,
      ),
    );
  }
}
