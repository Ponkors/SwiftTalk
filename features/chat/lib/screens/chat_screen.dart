import 'package:chat/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';
// import 'package:conversation/conversation.dart';
import 'package:authentication/authentication.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(
        chatRepository: getIt.get<ChatRepository>()
      ),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, authState) {
          if (authState.isLogged) {
            return _buildChatScreen(authState.userModel);
          } else {
            return _buildChatScreen(authState.userModel);
          }
        },
      ),
    );
  }

  Widget _buildChatScreen(UserModel authenticatedUser) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        BlocProvider.of<ChatBloc>(context).add(ChatRequested(loginUID: authenticatedUser.identifierId));
        if (state is ChatLoadInProgress) {
          return const CircularProgressIndicator();
        } else if (state is ChatLoadFailure) {
          return const Text('Error to load chats');
        } else if (state is ChatLoadSuccess) {
          return _ChatList(
            authenticatedUser: authenticatedUser,
            chats: state.chats,
          );
        }
        return Text('${state.runtimeType.toString()} chat_screen.dart');
      },
    );
  }

  Widget _buildNotAuthorizedScreen() {
    return Scaffold(
      body: Center(
        child: Text('User not authorized'),
      ),
    );
  }
}

class _ChatList extends StatelessWidget {
  final List<ConversationModel> chats;
  final UserModel authenticatedUser;

  const _ChatList({
    required this.chats,
    required this.authenticatedUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return chats.isEmpty
        ? Text('No chats yet. Go to contact and start conversation')
        : ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final chat = chats.elementAt(index);
              final receiver = chat.creator.identifierId != authenticatedUser.identifierId
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
  final UserModel receiver;
  final UserModel authenticatedUser;

  const _ChatBody({
    required this.receiver,
    required this.authenticatedUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.green,
      ),
      title: Text(receiver.userName),
      subtitle: Text(receiver.email),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward_ios_rounded),
        onPressed: () {
        },
      ),
    );
  }
}
















// import 'package:flutter/material.dart';
// import 'package:core_ui/core_ui.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   bool isSearching = false;
//   TextEditingController searchUserNameController =
//   TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Chat Screen',
//       home: Scaffold(
//         body: Container(
//           margin: EdgeInsets.symmetric(horizontal: AppDimens.size_10),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   isSearching
//                       ? GestureDetector(
//                     onTap: () {
//                       isSearching = false;
//                       searchUserNameController.text = "";
//                       setState(() {});
//                     },
//                     child: Padding(
//                         padding: EdgeInsets.only(right: AppDimens.size_10),
//                         child: Icon(Icons.arrow_back)),
//                   )
//                       : Container(),
//                   Expanded(
//                     child: Container(
//                       margin: EdgeInsets.symmetric(vertical: AppDimens.size_10),
//                       padding: EdgeInsets.symmetric(horizontal: AppDimens.size_10),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: AppColors.grey,
//                           width: AppDimens.size_1,
//                           style: BorderStyle.solid,
//                         ),
//                         borderRadius: BorderRadius.circular(AppDimens.size_10),
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                               child: TextField(
//                                 controller: searchUserNameController,
//                                 decoration: InputDecoration(border: InputBorder.none,
//                                     hintText: 'Enter username'),
//                               )),
//                           GestureDetector(
//                             onTap: () {
//                               if (searchUserNameController.text != "") {
//                                 isSearching = true;
//                                 setState(() {
//
//                                 });
//                               }
//                             },
//                             child: Icon(Icons.search),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
