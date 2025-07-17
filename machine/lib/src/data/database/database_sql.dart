import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSql {
  // construtor privado
  DatabaseSql._();

  // obtendo instancia database com contrutor privado
  static final DatabaseSql instance = DatabaseSql._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    return await _initDatabase();
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'learnmachine.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(db, version) async {
    await db.execute(_studentCity);
    await db.execute(_studentPhone);
    await db.execute(_course);
    await db.execute(_student);
    await db.execute(_studentAddress);
    await db.execute(_studentCourse);
  }

  String get _studentCity => ''' 
    CREATE TABLE STUDENT_CITY(
     ID INTEGER PRIMARY KEY AUTOINCREMENT,
     CITY_ID TEXT NOT NULL,
     CITY_NAME TEXT NOT NULL
    );

    INSERT INTO STUDENT_CITY (CITY_ID, CITY_NAME) VALUES ('SP01', 'São Paulo');
  ''';

  String get _studentPhone => ''' 
    CREATE TABLE STUDENT_PHONE(
     ID INTEGER PRIMARY KEY AUTOINCREMENT,
     DDD INTEGER NOT NULL,
     PHONE_NUMBER TEXT NOT NULL
      );

      INSERT INTO STUDENT_PHONE (DDD, PHONE_NUMBER) VALUES (11, '987654321');
  ''';

  String get _course => '''  
    CREATE TABLE COURSE(
     ID INTEGER PRIMARY KEY,
     DESCRIPTION TEXT NOT NULL
    );

    INSERT INTO COURSE (ID, DESCRIPTION) VALUES (1, 'Desenvolvimento Mobile');
  ''';

  String get _student => '''  
    CREATE TABLE STUDENT(
     ID INTEGER PRIMARY KEY AUTOINCREMENT,
     NAME TEXT NOT NULL,
     AGE INTEGER,
     COURSE_ID INTEGER,
     FOREIGN KEY (COURSE_ID) REFERENCES COURSE(ID),
    );
    INSERT INTO STUDENT (NAME, AGE, COURSE_ID)
    VALUES ('João da Silva', 22, 1);
  ''';

  String get _studentAddress => ''' 
    CREATE TABLE STUDENT_ADDRESS(
     ID INTEGER PRIMARY KEY,
     STREET TEXT NOT NULL,
     NUMBER INTEGER NOT NULL,
     ZIPCODE TEXT NOT NULL,
     STUDENT_ID INTEGER, 
     CITY_ID INTEGER,
     PHONE_ID INTEGER,
     FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(ID),
     FOREIGN KEY (CITY_ID) REFERENCES STUDENT_CITY(ID),
     FOREIGN KEY (PHONE_ID) REFERENCES STUDENT_PHONE(ID)
    );

    INSERT INTO STUDENT_ADDRESS (
    ID, STREET, NUMBER, ZIPCODE,
    STUDENT_ID, CITY_ID, PHONE_ID
    )
    VALUES (
    1, 'Rua das Flores', 123, '04567-000',
    1, 1, 1
    );
  ''';

  String get _studentCourse => '''  
    CREATE TABLE STUDENT_COURSE(
     ID INTEGER PRIMARY KEY,
     NAME TEXT NOT NULL,
     IS_STUDENT INTEGER NOT NULL,
     STUDENT_ID INTEGER, 
     FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(ID)
    );

    INSERT INTO STUDENT_COURSE (
    ID, NAME, IS_STUDENT, STUDENT_ID
    )
    VALUES (
    1, 'Turma Flutter Avançado', 1, 1
    );
  ''';
}
