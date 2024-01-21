import 'package:chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:conversation/conversation.dart';


class ChatScreen extends StatelessWidget {
  final UserEntity authenticatedUser;

  const ChatScreen({
    required this.authenticatedUser,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(
        chatRepository: getIt.get<ChatRepository>(),
      )..add(ChatRequested(loginUID: authenticatedUser.identifierId)),
      child: _ChatView(authenticatedUser: authenticatedUser),
    );
  }
}

class _ChatView extends StatelessWidget {
  final UserEntity authenticatedUser;
  const _ChatView({
    required this.authenticatedUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatLoadInProgress) {
            return const CircularProgressIndicator();
          } else if (state is ChatLoadFailure) {
            return const Text('Unable to load contacts');
          } else if (state is ChatLoadSuccess) {
            return _ChatList(
              authenticatedUser: authenticatedUser,
              chats: state.chats,
            );
          }
          return Text('Error: ${state.runtimeType.toString()}');
        },
      ),
    );
  }
}

class _ChatList extends StatelessWidget {
  final List<ConversationModel> chats;
  final UserEntity authenticatedUser;
  const _ChatList({
    required this.chats,
    required this.authenticatedUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return chats.isEmpty
        ? Text('No chats yet')
        : ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final chat = chats.elementAt(index);
              final receiver = chat.creator.identifierId
                    != authenticatedUser.identifierId
                  ? chat.creator
                  : chat.receiver;
              return _ChatBody(
                receiver: receiver,
                authenticatedUser: authenticatedUser,
              );
            },
    );
  }
}

class _ChatBody extends StatelessWidget {
  final UserEntity receiver;
  final UserEntity authenticatedUser;

  const _ChatBody({
    required this.receiver,
    required this.authenticatedUser,
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: receiver.photoURL.isNotEmpty
            ? NetworkImage(receiver.photoURL)
            : AssetImage(ImagePaths.defaultPhoto) as ImageProvider<Object>?,
      ),
      title: Text(receiver.userName),
      subtitle: Text(receiver.email),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward_ios_rounded),
        onPressed: () {
          Navigator.push<MaterialPageRoute>(
            context,
            MaterialPageRoute(
              builder: (context) => ConversationScreen(
                sender: authenticatedUser,
                receiver: receiver,
              )
            )
          );
        },
      ),
    );
  }
}