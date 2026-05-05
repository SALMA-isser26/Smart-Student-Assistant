import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  final ApiService _apiService = ApiService();

  String _response = '';
  bool _isLoading = false;

  // ✅ Bug 5 corrigé : dispose() pour éviter la fuite mémoire
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _askChatbot() async {
    final question = _controller.text.trim();

    // ✅ Bug 1 corrigé : on vérifie que la question n'est pas vide
    if (question.isEmpty) return;

    // ✅ Bug 4 corrigé : un seul setState au début, un seul à la fin
    setState(() {
      _isLoading = true;
      _response = '';
    });

    try {
      final result = await _apiService.getChatbotResponse(question);
      setState(() {
        // ✅ Bug 1 corrigé : on affiche la question + la réponse mockée
        _response = 'Q : $question\n\nR : ${result.answer}';
      });
    } catch (e) {
      setState(() {
        _response = 'Erreur : impossible de contacter l\'API.';
      });
    } finally {
      // ✅ Bug 4 corrigé : finally garantit que isLoading repasse à false
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chatbot')),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Posez votre question',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _isLoading ? null : _askChatbot, // désactivé pendant le chargement
              child: const Text('Envoyer'),
            ),

            const SizedBox(height: 20),

            if (_isLoading)
              const CircularProgressIndicator()

            // ✅ Bug 3 corrigé : on n'affiche le texte que s'il y a une réponse
            else if (_response.isNotEmpty)
              Text(
                _response,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
          ],
        ),
      ),
    );
  }
}
