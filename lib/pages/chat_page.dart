import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gen_ai_clone/theme/colors.dart';
import 'package:gen_ai_clone/widgets/answer_section.dart';
import 'package:gen_ai_clone/widgets/side_bar.dart';
import 'package:gen_ai_clone/widgets/sources_section.dart';

class ChatPage extends StatelessWidget {
  final String question;
  const ChatPage({super.key, required this.question});

  // StreamBuilder(
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          kIsWeb ? SideBar() : SizedBox(),
          kIsWeb ? const SizedBox(width: 100) : const SizedBox(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    //sources
                    SourcesSection(),
                    const SizedBox(height: 24),
                    // answers
                    AnswerSection(),
                  ],
                ),
              ),
            ),
          ),
          kIsWeb
              ? Placeholder(strokeWidth: 0, color: AppColors.background)
              : const SizedBox(),
        ],
      ),
    );
  }
}
