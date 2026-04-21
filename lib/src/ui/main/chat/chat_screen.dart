import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'widgets/chat_widgets.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<ChatSession> _sessions = [
    ChatSession(
      id: "1",
      title: "Flu symptoms advice",
      category: "TODAY",
      messages: [
        ChatMessage(
          text: "I've been feeling feverish and have a cough for two days. What should I do for flu symptoms?",
          isUser: true,
          time: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        ChatMessage(
          text: "Based on your symptoms, you might be experiencing a common seasonal flu. Here are some immediate steps:",
          isUser: false,
          time: DateTime.now().subtract(const Duration(minutes: 4)),
        ),
      ],
    ),
    ChatSession(
      id: "2",
      title: "Headache consultation",
      category: "TODAY",
      messages: [],
    ),
    ChatSession(
      id: "3",
      title: "Back pain relief tips",
      category: "YESTERDAY",
      messages: [],
    ),
  ];

  late String _activeSessionId;

  @override
  void initState() {
    super.initState();
    _activeSessionId = _sessions.first.id;
  }

  ChatSession get _activeSession =>
      _sessions.firstWhere((s) => s.id == _activeSessionId);

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      // If this is the first message, update the session title
      if (_activeSession.messages.isEmpty || _activeSession.title == "New Chat") {
        _activeSession.title = text;
      }
      _activeSession.messages.add(ChatMessage(
        text: text,
        isUser: true,
        time: DateTime.now(),
      ));
      _messageController.clear();
    });

    _scrollToBottom();

    // Simulate AI Response
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _activeSession.messages.add(ChatMessage(
            text: "Assalomu alaykum sizga nima yordam kerak!",
            isUser: false,
            time: DateTime.now(),
          ));
        });
        _scrollToBottom();
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _onNewChat() {
    final newId = (DateTime.now().millisecondsSinceEpoch).toString();
    setState(() {
      _sessions.insert(
          0,
          ChatSession(
            id: newId,
            title: "New Chat",
            category: "TODAY",
            messages: [],
          ));
      _activeSessionId = newId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      appBar: ChatAppBar(
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
        onClosePressed: () => Navigator.pop(context),
      ),
      drawer: HistoryDrawer(
        sessions: _sessions,
        activeSessionId: _activeSessionId,
        onSessionSelected: (id) {
          setState(() => _activeSessionId = id);
          _scrollToBottom();
        },
        onNewChat: _onNewChat,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(vertical: 20.h),
              itemCount: _activeSession.messages.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        "Today at 9:41 AM",
                        style: AppStyles.medium12(AppColors.greyLight),
                      ),
                    ),
                  );
                }
                final message = _activeSession.messages[index - 1];
                return message.isUser
                    ? UserMessageBubble(text: message.text)
                    : AiMessageBubble(text: message.text);
              },
            ),
          ),
          SafeArea(
            top: false,
            child: ChatInput(
              controller: _messageController,
              onSend: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}