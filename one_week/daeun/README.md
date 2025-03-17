# **숫자 야구 게임 (BaseballGame)**

**3자리 숫자 야구 게임**을 콘솔에서 플레이할 수 있는 예제 프로젝트입니다.

클린 아키텍처의 기본 원칙(도메인 로직과 Presentation 계층 분리)을 적용해보았으며, 입력 검증 로직을 Validator로 분리하여 유지보수성을 높였습니다.

## **목차**

1.	[개요](#개요)

2.	[프로젝트 구조](#프로젝트-구조)

3.	[파일 설명](#파일-설명)

4.	[기능 요약](#기능-요약)

5.	[개발 환경](#개발-환경)

---

## **개요**

이 프로젝트는 **3자리 숫자 야구 게임**을 콘솔 환경에서 구현한 예제입니다.

### **숫자 야구 규칙**

- 1~9 사이의 숫자 중 3개의 서로 다른 숫자를 정답으로 설정합니다.
- 사용자는 3자리 숫자를 입력하여 스트라이크와 볼 정보를 얻습니다.
- 3스트라이크가 나오면 정답입니다.

또한, 메뉴 선택 기능을 추가하여

1.	게임 시작

2.	게임 기록 보기

3.	게임 종료

중 하나를 선택할 수 있도록 했습니다.

---

## **프로젝트 구조**

```
BaseballGame/
├── Domain/
│   ├── Baseball.swift
│   ├── Hint.swift
│   └── GameMenu.swift
├── UseCases/
│   ├── GameUseCase.swift
│   ├── InputValidator.swift
│   └── MenuInputValidator.swift
├── Presentation/
│   ├── GameManager.swift
│   └── RecordManager.swift
├── Errors/
│   ├── GameInputValidationError.swift
│   └── MenuInputValidationError.swift
├── main.swift
└── README.md
```

- **Domain**: 게임 핵심 모델(Baseball, Hint)과 메뉴 정의(GameMenu)
- **UseCases**: 도메인 로직 활용, 입력 검증(GameInputValidator, MenuInputValidator), 게임 로직(GameUseCase)
- **Presentation**: 콘솔 I/O와 게임 흐름 제어(GameManager), 게임 기록 관리(RecordManager)
- **Errors**: 입력 검증 관련 에러 타입 정의
- **main.swift**: 애플리케이션 진입점

---

## **파일 설명**

**1. Baseball.swift**

- 3자리 정답(숫자 배열)을 담는 **도메인 모델**입니다.
- random() 메서드를 통해 **유효한 3자리 숫자**를 랜덤으로 생성합니다.
- compare(with:) 메서드를 사용하여 사용자의 추측과 정답을 비교, 스트라이크와 볼 정보를 계산합니다.

**2. Hint.swift**

- 스트라이크/볼 개수를 저장하는 단순 데이터 모델입니다.
- 메시지 출력은 GameManager에서 담당하므로, 여기서는 숫자 정보만 담습니다.

**3. GameMenu.swift**

- **메뉴 옵션**을 정의하는 열거형입니다. (1: 시작, 2: 기록, 3: 종료)
- description 프로퍼티를 통해 각 메뉴의 설명 문자열을 제공합니다.

**4. GameManager.swift**

- **게임 전체의 흐름**을 제어하고, 콘솔 입출력을 담당하는 클래스입니다.
- start() 메서드로 게임을 시작하며, 내부적으로 selectMenu(), startGame(), showMessage(of:), endGame() 등을 호출하여 로직을 진행합니다.
- recordManager를 사용하여 게임 기록을 관리하고, gameUseCase를 통해 핵심 로직(입력 검증, 정답 비교 등)을 처리합니다.

**5. RecordManager.swift**

- **게임 기록**을 관리하는 클래스입니다.
- 게임에서 정답을 맞혔을 때 시도 횟수를 addRecord(newRecord:)로 저장하고, showLog()를 통해 기록을 출력합니다.

**6. GameUseCase.swift**

- **게임 핵심 로직**을 담당하는 클래스입니다.
- 메뉴 입력(processMenuInput)과 게임 숫자 입력(processGameInput)을 검증하고, 올바르면 결과(메뉴 혹은 힌트)를 반환합니다.
- 내부적으로 menuInputValidator와 gameInputValidator를 사용해 입력 검증을 수행합니다.
- answer(정답)에는 Baseball.random()을 통해 생성된 3자리 숫자를 보관합니다.

**7. InputValidator.swift / MenuInputValidator.swift**

- **검증 로직**을 구조체로 분리하여, 입력값이 유효한지 검사합니다.
- GameInputValidator는 3자리 숫자(맨 앞자리에 0이 올 수 없음) 검증,
- MenuInputValidator는 1~3 범위의 숫자인지 검증합니다.

**8. GameInputValidationError.swift / MenuInputValidationError.swift**

- **입력 검증 에러**를 정의하는 열거형입니다.
- 각 케이스별로 errorDescription를 제공하여, 에러 메시지를 콘솔에 출력할 수 있도록 합니다.

**9. main.swift**

- 애플리케이션 **진입점**입니다.
- GameManager 인스턴스를 생성하고, start() 메서드를 호출하여 게임을 시작합니다.

---

## **기능 요약**

1. **메뉴 선택**
- 숫자 입력으로 메뉴를 선택합니다. (1: 시작, 2: 기록, 3: 종료)
- 유효하지 않은 메뉴 번호 입력 시 오류 메시지를 표시합니다.
1. **게임 진행**
- 3자리 숫자를 입력하면, 스트라이크와 볼 정보를 계산해줍니다.
- 3스트라이크가 나오면 게임을 종료하고 시도 횟수를 기록합니다.
1. **게임 기록 보기**
- 지금까지 플레이한 게임들의 시도 횟수를 순서대로 보여줍니다.
- 기록이 없으면 “게임 기록이 없습니다!” 메시지를 출력합니다.
1. **종료**
- 프로그램을 종료합니다.

---

## **개발 환경**

- **언어**: Swift 5.x
- **IDE**: Xcode (버전 무관, Swift 5 지원)
- **플랫폼**: macOS 콘솔 환경

---

## **추가 참고**

### **클린 아키텍처**

- Domain, UseCase, Presentation 계층으로 나누어 로직을 관리했습니다.
- Validator를 분리하여 입력 검증을 한 곳에서 담당하도록 했습니다.
