import 'package:flutter/material.dart';
import 'package:get_gtream_chat/user_message_list.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() async {
  final StreamChatClient client = StreamChatClient(
    'hf9bd44zc3hu',
    logLevel: Level.INFO,
  );

  // await client.creat(
  //   User(id: 'abel_tila'),
  //   client.devToken("abel_tila").rawValue,
  // );

  await client.connectUser(
    User(id: 'super-band-8'),
    client.devToken("super-band-8").rawValue,
  );

  final channel = client.channel('messaging', id: 'abel_prog');


  await channel.watch();

  runApp(MyApp(
    channel: channel,
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  final StreamChatClient client;

  /// The channel we'd like to observe and participate.
  final Channel channel;

  const MyApp({super.key, required this.channel, required this.client});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stream Chat',
      builder: (context, widget) {
        return StreamChat(
          client: client,
          child: widget,
        );
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamChannel(
        channel: channel,
        child: ChannelListPage(
          client: client,
        ),
      ),
    );
  }
}
