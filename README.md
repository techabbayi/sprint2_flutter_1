# Flutter Architecture & Dart Fundamentals

## 1. Flutter Architecture

Flutter has 3 layers:

| Layer | What it does |
|-------|-------------|
| **Framework** (Dart) | Widgets, animations, Material/Cupertino design |
| **Engine** (C++) | Skia graphics rendering, text layout |
| **Embedder** | Platform-specific code (Android/iOS/Web) |

**Key Point**: Flutter renders everything itself using Skia, not native components. This gives pixel-perfect UI across all platforms.

---

## 2. Widgets - The Building Blocks

**Everything in Flutter is a widget.**

### StatelessWidget
- Static UI that doesn't change
- Examples: Text, Icon, Image
- Use when: No user interaction needed

```dart
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Welcome to Flutter!');
  }
}
```

### StatefulWidget
- Dynamic UI that changes with user interaction
- Examples: Counter, Forms, Checkboxes
- Use when: UI needs to update based on state

```dart
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}
```

### How setState() Works

When you call `setState()`:
1. Flutter marks the widget as "dirty"
2. Only affected widgets rebuild
3. UI updates efficiently

This is the **reactive model**: UI = f(state)

---

## 3. Dart Language Basics

### Why Dart?
- **AOT compilation** → Fast production performance
- **JIT compilation** → Hot Reload during development
- **Null safety** → No null errors
- **Async/await** → Easy async code

### Key Concepts

**Classes & Objects**
```dart
class Student {
  String name;
  int age;

  Student(this.name, this.age);

  void introduce() {
    print('Hi, I\'m $name and I\'m $age years old.');
  }
}
```

**Null Safety**
```dart
String? nullableName;  // Can be null
String name = 'John';  // Cannot be null
```

**Type Inference**
```dart
var name = 'John';  // Auto-detected as String
var age = 25;       // Auto-detected as int
```

---

## 4. Why Flutter is Fast

**Traditional:** Separate iOS (Swift) + Android (Kotlin) codebases  
**Flutter:** One codebase → Deploy everywhere

**Benefits:**
- Single codebase for iOS, Android, Web, Desktop
- Hot Reload (see changes in < 1 second)
- 60fps smooth animations
- Native performance

---

## Project Files

- `simple_app.dart` - StatelessWidget example
- `student_example.dart` - Dart basics
- `counter_app.dart` - StatefulWidget demo

---

## Screenshots & Video

**Screenshots**: Add after running the app  
**Video**: [Link to be added]

Record a 3-5 min video showing:
- Counter app demo
- Widget tree explanation
- Dart features used
- Why Flutter is efficient

---

## Key Takeaways

✅ StatelessWidget = Static UI  
✅ StatefulWidget = Dynamic UI  
✅ setState() triggers rebuilds  
✅ Dart enables Hot Reload  
✅ One codebase = All platforms


