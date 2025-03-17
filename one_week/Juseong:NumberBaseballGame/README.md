# NumberBaseballGame

NumberBaseballGame은 Swift로 구현된 커맨드라인 기반 숫자 야구 게임입니다.  
이 게임은 두 명이 즐길 수 있는 추리 게임으로, 상대방이 설정한 3자리의 숫자를 맞히는 것이 목표입니다.  

> **게임 규칙**  
> - 게임의 목표는 상대방이 설정한 3자리의 숫자를 추리하는 것입니다.  
> - 각 자리의 숫자와 위치가 모두 맞으면 **스트라이크**, 숫자는 맞지만 위치가 다르면 **볼**로 판정됩니다.  
> - 예를 들어, 상대방의 숫자가 **123**일 때 **132**를 추리하면 **1스트라이크 2볼**이 됩니다.  
> - 이러한 힌트를 활용하여 상대방의 숫자를 추리해 나가게 됩니다.

<br><br>

## 주요 기능
- **게임 시작**:  
  - 사용자가 메뉴에서 숫자 1(게임 시작)을 입력하면, 중복 없는 랜덤 3자리 숫자가 생성되어 게임이 시작됩니다.
- **입력 검증**:  
  - **메뉴 입력값**: 메뉴 입력값이 숫자가 아니거나 1, 2, 3 중 하나가 아닌 경우, 에러 메시지를 출력합니다.  
  - **게임 입력값**: 입력값이 숫자가 아니거나, 100~999 범위의 중복 없는 3자리 숫자가 아닐 경우, 적절한 에러 메시지를 출력합니다.
- **게임 진행 및 결과**:  
  - 사용자는 정해진 자릿수의 숫자를 입력하며, 입력값에 대한 검증 및 중복 체크가 수행됩니다.  
  - 입력된 숫자에 대해 스트라이크와 볼 개수를 계산하고, 게임이 종료될 때까지 시도 횟수를 기록합니다.
- **게임 기록 조회**:  
  - 게임 종료 후, 메뉴에서 숫자 2(기록 조회)을 입력하면 사용자는 완료한 게임들의 시도 횟수를 확인할 수 있습니다.
- **게임 종료**:  
  - 메뉴에서 숫자 3(게임 종료)을 입력하면 게임을 종료할 수 있습니다.

<br><br>

## 기술 스택
- **프로그래밍 언어**: Swift
- **개발 환경**: Xcode, macOS
- **UI**: Command Line Interface (CLI)

<br><br>

## 스크린샷
- **게임 메뉴**

| 내용 | 사진 |
| --- | ---|
| 초기 화면 | <img width="300" alt="image" src="https://github.com/user-attachments/assets/0a47c8ad-ce53-4772-9215-8b7845dd7e15" /> |
| 입력값 검증 | <img width="300" alt="image" src="https://github.com/user-attachments/assets/32a1b76e-51d3-47e4-b834-c45e6f4ba5cd" /> |

- **게임 시작**
  
| 내용 | 사진 |
| --- | ---|
| 초기 화면 | <img width="300" alt="image" src="https://github.com/user-attachments/assets/aec842fd-f493-411f-bbc9-16967dd8a874" /> |
| 입력값 검증 | <img width="300" alt="image" src="https://github.com/user-attachments/assets/d0eae805-fede-4546-84f9-53d691c06869" /> |
| 게임 진행 | <img width="300" alt="image" src="https://github.com/user-attachments/assets/e2bfeb24-8ac7-4fa3-8e7b-71699b90bd1f" /> |

- **게임 기록 및 종료**

| 내용 | 사진 |
| --- | ---|
| 게임 기록 | <img width="300" alt="image" src="https://github.com/user-attachments/assets/19dec27e-98d2-41b8-90c9-567df2a65a82" /> |
| 게임 종료 | <img width="300" alt="image" src="https://github.com/user-attachments/assets/0278b188-7f2e-4a90-b61d-ceec90f08ed9" /> |

<br><br>

## 프로젝트 구조
```
📦 NumberBaseballGame
├── BaseballGame.swift
└── main.swift
```
