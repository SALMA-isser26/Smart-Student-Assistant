import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/chatbot_response.dart';

part 'chatbot_service.g.dart';

@RestApi(baseUrl: 'https://example.com')
abstract class ChatbotService {
  factory ChatbotService(Dio dio) = _ChatbotService;

  @GET('/chat')
  Future<ChatbotResponse> getResponse(@Query('q') String question);
}
