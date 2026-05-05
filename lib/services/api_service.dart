import 'package:dio/dio.dart';
import '../models/chatbot_response.dart';
import 'chatbot_service.dart';   // ✅ nouveau nom

class ApiService {
  final ChatbotService _service = ChatbotService(Dio());

  Future<ChatbotResponse> getChatbotResponse(String question) async {
    try {
      return await _service.getResponse(question);
    } catch (e) {
      return ChatbotResponse(answer: _localMockResponse(question));
    }
  }

  String _localMockResponse(String question) {
    final q = question.toLowerCase();
    if (q.contains('bonjour') || q.contains('salut')) {
      return 'Bonjour ! Comment puis-je vous aider ?';
    } else if (q.contains('cours') || q.contains('matière')) {
      return 'Vos cours : Mathématiques, Informatique, Physique.';
    } else if (q.contains('exam') || q.contains('note')) {
      return 'Vos prochains examens sont la semaine prochaine.';
    } else {
      return 'Bonne question ! Reformulez pour que je puisse mieux vous aider.';
    }
  }
}
