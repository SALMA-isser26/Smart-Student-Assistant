# Smart Student Assistant 🎓

> Application mobile développée avec **Flutter** dans le cadre du module de développement mobile.  
> Université Mundiapolis — Casablanca

---

## 📌 Présentation

**Smart Student Assistant** est une application pédagogique conçue pour assister les étudiants
dans leur environnement académique. Elle regroupe l'ensemble des concepts Flutter vus en atelier :
navigation, thème global, consommation d'API REST avec Retrofit/Dio, et gestion d'état avec `setState`.

---

## 🏗️ Architecture du projet
lib/
├── main.dart                        # Point d'entrée de l'application
├── theme/
│   └── app_theme.dart               # Thème global centralisé (couleurs, typographie)
├── pages/
│   ├── home_page.dart               # Page d'accueil
│   ├── profile_page.dart            # Page profil étudiant
│   ├── settings_page.dart           # Page paramètres
│   ├── about_page.dart              # Page à propos
│   └── chatbot_page.dart            # Page chatbot interactif
├── widgets/
│   └── app_drawer.dart              # Menu latéral de navigation (Drawer)
├── services/
│   ├── chatbot_service.dart         # Client Retrofit — déclaration des endpoints
│   └── api_service.dart             # Logique métier — appels API 
└── models/
└── chatbot_response.dart        # Modèle de données pour la réponse du chatbot

## 📱 Pages et fonctionnalités

### 🏠 Page Accueil: `home_page.dart`
Page principale de l'application. Elle affiche un message de bienvenue et intègre
le menu latéral (`AppDrawer`) permettant la navigation vers toutes les sections.

### 👤 Page Profil: `profile_page.dart`
Affiche les informations de l'étudiant : avatar, nom et adresse email.
Utilise `CircleAvatar` et les styles définis dans `AppTheme`.

### ⚙️ Page Paramètres: `settings_page.dart`
Liste les options de configuration de l'application (mode sombre, notifications).
Implémentée avec un `ListView` de `ListTile`.

### ℹ️ Page À propos: `about_page.dart`
Présente une description de l'application dans une mise en page centrée.

### 🤖 Page Chatbot: `chatbot_page.dart`
Interface conversationnelle permettant à l'étudiant de poser des questions.
- Champ de saisie `TextField` avec validation (question non vide)
- Appel à `ApiService` via Retrofit
- Affichage de la question et de la réponse
- Indicateur de chargement `CircularProgressIndicator`
- Gestion des erreurs avec réponses mock locales en fallback
- `dispose()` sur le `TextEditingController` pour éviter les fuites mémoire

### 📋 Menu latéral:  `app_drawer.dart`
Composant réutilisable `Drawer` avec `UserAccountsDrawerHeader`.
Assure la navigation vers : Profil, Paramètres, À propos, Chatbot.

## 🔌 Consommation API REST

L'application utilise **Retrofit + Dio** pour la couche réseau.

```dart
@RestApi(baseUrl: 'https://example.com')
abstract class ChatbotService {
  factory ChatbotService(Dio dio) = _ChatbotService;

  @GET('/chat')
  Future<ChatbotResponse> getResponse(@Query('q') String question);
}
```

Un système de **fallback mock local** est implémenté dans `ApiService` :
si l'API est indisponible, l'application répond automatiquement selon des mots-clés
détectés dans la question de l'utilisateur.



## 🎨 Thème global

Toutes les couleurs et styles sont centralisés dans `AppTheme` :

```dart
colorScheme: ColorScheme.fromSeed(
  seedColor: const Color(0xFF1565C0),
  secondary: const Color(0xFF42A5F5),
),
```

> ⚠️ Aucune couleur n'est codée en dur dans les widgets — tout passe par `Theme.of(context)`.

---

## 🚀 Installation

### Prérequis
- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0

### Étapes

```bash
# 1. Cloner le projet
git clone https://github.com/SALMA-isser26/smart_student_assistant.git
cd smart_student_assistant

# 2. Installer les dépendances
flutter pub get

# 3. Générer les fichiers Retrofit
dart run build_runner build --delete-conflicting-outputs

# 4. Lancer l'application
flutter run -d windows
```

---

## 📦 Dépendances

| Package | Version | Usage |
|---|---|---|
| `dio` | ^4.0.6 | Client HTTP |
| `retrofit` | ^3.3.1 | Abstraction API REST |
| `json_annotation` | ^4.8.1 | Sérialisation JSON |
| `build_runner` | ^2.4.8 | Génération de code |
| `retrofit_generator` | ^4.2.0 | Génération client Retrofit |
| `json_serializable` | ^6.7.1 | Génération modèles JSON |

---

## 👩‍💻 Auteure

**Salma Isser**  
Étudiante en Licence Développement Logiciel  
