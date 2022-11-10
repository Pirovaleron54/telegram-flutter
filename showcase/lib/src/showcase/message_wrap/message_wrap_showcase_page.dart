import 'package:emoji_ui_kit/emoji_ui_kit.dart';
import 'package:feature_chat_impl/feature_chat_impl.dart';
import 'package:flutter/material.dart';

import 'message_wrap_showcase_scope.dart';

class MessageWrapShowcasePage extends StatelessWidget {
  const MessageWrapShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('message wrap')),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Example1(),
        SizedBox(height: 12),
        Example2(),
        SizedBox(height: 12),
        Example3(),
        SizedBox(height: 12),
        Example4(),
        SizedBox(height: 12),
        Example5(),
        SizedBox(height: 12),
        Example6(),
      ],
    );
  }
}

class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey,
      child: MessageWrap(
        content: Text.rich(
          const TextSpan(
            text: 'Text with Widget',
            children: <InlineSpan>[
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(Icons.bookmark),
              ),
            ],
          ),
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(backgroundColor: Colors.amber),
        ),
        shortInfo: Container(
          width: 150,
          height: 16,
          color: Colors.red,
        ),
      ),
    );
  }
}

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey,
      child: MessageWrap(
        content: Text(
          'The text style to apply to descendant [Text] widgets which do not have an explicit style',
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(backgroundColor: Colors.amber),
        ),
        shortInfo: Container(
          width: 150,
          height: 16,
          color: Colors.red,
        ),
      ),
    );
  }
}

class Example3 extends StatelessWidget {
  const Example3({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomEmojiWidgetFactory customEmojiWidgetFactory =
        MessageWrapShowcaseScope.getCustomEmojiWidgetFactory(context);
    return ColoredBox(
      color: Colors.grey,
      child: MessageWrap(
        content: customEmojiWidgetFactory.create(context, customEmojiId: 0),
        shortInfo: Container(
          width: 150,
          height: 16,
          color: Colors.red,
        ),
      ),
    );
  }
}

class Example4 extends StatelessWidget {
  const Example4({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey,
      child: MessageWrap(
        content: Text(
          '🤯',
          style: DefaultTextStyle.of(context)
              .style
              .copyWith(backgroundColor: Colors.amber),
        ),
        shortInfo: Container(
          width: 150,
          height: 16,
          color: Colors.red,
        ),
      ),
    );
  }
}

class Example5 extends StatelessWidget {
  const Example5({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey,
      child: MessageWrap(
        content: Container(
          width: 50,
          height: 32,
          color: Colors.blue,
        ),
        shortInfo: Container(
          width: 150,
          height: 16,
          color: Colors.red,
          child: const Text('text'),
        ),
      ),
    );
  }
}

class Example6 extends StatelessWidget {
  const Example6({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey,
      child: MessageWrap(
        content: const Text(''),
        shortInfo: Container(
          width: 100,
          height: 16,
          color: Colors.red,
        ),
      ),
    );
  }
}
