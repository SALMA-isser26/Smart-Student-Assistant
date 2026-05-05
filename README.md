# Smart Student Assistant 🎓

Application mobile Flutter développée dans le cadre du module de développement mobile.

## 📱 Description

Smart Student Assistant est une application pédagogique qui assiste les étudiants
dans leur environnement académique à travers une interface claire et structurée.

## 🏗️ Structure du projet

​```
lib/
├── main.dart
├── theme/
│   └── app_theme.dart
├── pages/
│   ├── home_page.dart
│   ├── profile_page.dart
│   ├── settings_page.dart
│   ├── about_page.dart
│   └── chatbot_page.dart
├── widgets/
│   └── app_drawer.dart
├── services/
│   ├── chatbot_service.dart
│   └── api_service.dart
└── models/
    └── chatbot_response.dart
​```

## 🚀 Installation et lancement

### Prérequis
- Flutter SDK >= 3.0.0
- Dart SDK >= 3.0.0

### Étapes

**1. Cloner le projet**
​```bash
git clone https://github.com/SALMA-isser26/smart_student_assistant.git
cd smart_student_assistant
​```

**2. Installer les dépendances**
​```bash
flutter pub get
​```

**3. Générer les fichiers Retrofit**
​```bash
dart run build_runner build --delete-conflicting-outputs
​```

**4. Lancer l'application**
​```bash
flutter run -d windows
​```

## 🛠️ Technologies utilisées

| Technologie | Usage |
|---|---|
| Flutter | Framework mobile |
| Dart | Langage de programmation |
| Retrofit + Dio | Consommation API REST |
| build_runner | Génération de code |

## ✨ Fonctionnalités

- Page Accueil avec message de bienvenue
- Menu latéral (Drawer) avec navigation
- Page Profil étudiant
- Page Paramètres
- Page À propos
- Chatbot avec réponses intelligentes
- Thème global centralisé

## 👩‍💻 Auteure

**Salma Isser** 