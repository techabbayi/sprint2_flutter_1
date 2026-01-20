// Dart Language Fundamentals - Student Class Example
// This demonstrates core Dart concepts: classes, objects, constructors, and methods

class Student {
  // Properties (instance variables)
  String name;
  int age;
  String? course; // Nullable field (can be null)

  // Constructor with positional parameters
  Student(this.name, this.age, [this.course]);

  // Named constructor
  Student.withCourse({
    required this.name,
    required this.age,
    required String course,
  }) : this.course = course;

  // Method
  void introduce() {
    print('Hi, I\'m $name and I\'m $age years old.');
    if (course != null) {
      print('I\'m studying $course.');
    }
  }

  // Getter
  bool get isAdult => age >= 18;

  // Method with return value
  String getDetails() {
    return 'Name: $name, Age: $age, Course: ${course ?? "Not enrolled"}';
  }
}

// Another class demonstrating inheritance
class GraduateStudent extends Student {
  String thesisTopic;

  GraduateStudent(String name, int age, String course, this.thesisTopic)
    : super.withCourse(name: name, age: age, course: course);

  @override
  void introduce() {
    super.introduce();
    print('My thesis topic is: $thesisTopic');
  }
}

void main() {
  // Creating objects
  print('=== Student Examples ===\n');

  // Using default constructor
  var student1 = Student('Aanya', 20);
  student1.introduce();
  print('Is adult? ${student1.isAdult}');
  print(student1.getDetails());

  print('\n---\n');

  // Using named constructor
  var student2 = Student.withCourse(
    name: 'Rohan',
    age: 19,
    course: 'Computer Science',
  );
  student2.introduce();

  print('\n---\n');

  // Using inheritance
  var gradStudent = GraduateStudent(
    'Priya',
    24,
    'Data Science',
    'Machine Learning in Healthcare',
  );
  gradStudent.introduce();

  print('\n=== Dart Features Demo ===\n');

  // Type inference
  var number = 42; // Inferred as int
  var message = 'Hello'; // Inferred as String
  var students = <Student>[student1, student2]; // List<Student>

  print('Type of number: ${number.runtimeType}');
  print('Type of message: ${message.runtimeType}');
  print('Number of students: ${students.length}');

  // Null safety
  String? nullableName;
  print('\nNullable name: ${nullableName ?? "No name provided"}');
  print('Nullable name length: ${nullableName?.length ?? 0}');

  // Collections and iteration
  print('\n=== All Students ===');
  for (var student in students) {
    print('- ${student.name} (${student.age} years old)');
  }

  // Lambda/Arrow functions
  students.forEach((s) => print('Hello ${s.name}!'));

  // List operations
  var adultStudents = students.where((s) => s.isAdult).toList();
  print('\nAdult students: ${adultStudents.length}');

  // String interpolation
  var summary =
      'We have ${students.length} students, '
      '${adultStudents.length} are adults.';
  print(summary);
}

/*
 * Dart Concepts Demonstrated:
 * 
 * 1. Classes & Objects: Student and GraduateStudent classes
 * 2. Constructors: Default and named constructors
 * 3. Inheritance: GraduateStudent extends Student
 * 4. Null Safety: String? (nullable) vs String (non-nullable)
 * 5. Type Inference: var keyword with automatic type detection
 * 6. Getters: isAdult computed property
 * 7. String Interpolation: $variable and ${expression}
 * 8. Collections: List<Student> with iteration and filtering
 * 9. Lambda Functions: Arrow syntax for short functions
 * 10. Method Overriding: @override annotation
 * 
 * Run this in DartPad (dartpad.dev) or terminal:
 * $ dart student_example.dart
 */
