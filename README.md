# ABC-Project

### 🚀 Flutter 코드 컨벤션

#### 1. **코딩 스타일 (어떻게 이름을 지을까?)**
- **변수, 함수 이름** → `camelCase` 사용 (`myName`, `fetchData()`)
- **클래스, 위젯 이름** → `PascalCase` 사용 (`MyButton`, `HomeScreen`)
- **상수 (변하지 않는 값)** → `SCREAMING_SNAKE_CASE` (`API_URL`, `DEFAULT_COLOR`)

👉 예제:
```dart
String userName = "John";  // 변수 (camelCase)
void getUserInfo() {}       // 함수 (camelCase)
class UserProfile {}        // 클래스 (PascalCase)
const String API_KEY = "12345"; // 상수 (SCREAMING_SNAKE_CASE)
```

---

#### 2. **파일 & 폴더 정리 (어디에 넣을까?)**
- 화면 파일들은 `screens/` 폴더 안에!
- 버튼, 카드 같은 UI 조각들은 `widgets/` 폴더 안에!
- 데이터를 가져오는 코드는 `services/` 폴더 안에!

📂 폴더 구조 예시:
```
lib/
 ├── main.dart  // 앱 시작 파일
 ├── screens/   // 화면 관련 파일
 │   ├── home_screen.dart
 │   ├── login_screen.dart
 ├── widgets/   // UI 조각 파일
 │   ├── custom_button.dart
 │   ├── profile_card.dart
 ├── services/  // API 관련 파일
 │   ├── api_service.dart
 ├── models/    // 데이터 모델 파일
 │   ├── user_model.dart
 ├── utils/     // 헬퍼 함수나 설정 파일
 │   ├── constants.dart
```

---

#### 3. **Flutter 위젯 (코드를 어떻게 나눌까?)**
- 화면 전체를 만들 때 → `StatefulWidget`
- UI만 보여줄 때 → `StatelessWidget`

👉 예제:
```dart
// 상태가 없는 단순한 위젯
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("버튼 클릭됨!");
      },
      child: Text("클릭하세요"),
    );
  }
}
```

```dart
// 상태가 바뀌는 위젯 (버튼을 클릭하면 숫자가 증가)
class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;  // 숫자 상태 저장

  void increaseCount() {
    setState(() {
      count++;  // 숫자 증가
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("숫자: $count"),
        ElevatedButton(
          onPressed: increaseCount,
          child: Text("증가"),
        ),
      ],
    );
  }
}
```

---

#### 4. **코드 깔끔하게 정리하기 (이름을 잘 짓자!)**
❌ 나쁜 예시:
```dart
var a = "John";  // a가 뭐하는 변수인지 모름
void d() {}       // 함수 이름만 보고 뭐하는 함수인지 모름
```

✅ 좋은 예시:
```dart
var userName = "John";  // 어떤 변수인지 알기 쉬움
void fetchUserProfile() {}  // 역할이 분명함
```

---

#### 5. **API 데이터 가져오기 (인터넷에서 정보 불러오기) & 에러방지**
- `Dio` 또는 `http` 패키지를 사용하여 데이터를 불러옴.
- `try-catch`를 사용하여 에러를 방지!

👉 예제:
```dart
import 'package:dio/dio.dart';

void fetchUserData() async {
  try {
    var response = await Dio().get('https://api.example.com/user');
    print(response.data);
  } catch (e) {
    print("데이터 가져오기 실패: $e");
  }
}
```

---

#### 6. **Flutter에서 필수적인 문법**
✔ **`??` 연산자 (값이 없으면 기본값 사용)**
```dart
String? name;
print(name ?? '이름 없음');  // name이 null이면 '이름 없음' 출력
```

✔ **`late` 키워드 (나중에 값 넣기)**
```dart
late String userName;
userName = "John";  // 초기화 안 하면 오류!
```

✔ **`final` & `const` (변하지 않는 값)**
```dart
final String userName = "John";  // 한 번 값 설정하면 못 바꿈
const double PI = 3.14;  // 컴파일 시점에서 정해진 값
```

---

#### 7. **Flutter에서 코드 검사하기**
1. `flutter analyze` → 코드 스타일 검사
2. `dart format .` → 코드 자동 정리

