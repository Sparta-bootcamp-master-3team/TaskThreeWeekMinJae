# NumberBaseballGame

# 숫자 야구 게임 (Baseball Game)

## 기능
- 서로 다른 자릿수로 구성된 3자리 숫자 생성 (맨 앞 자리 0 불가)
- 스트라이크와 볼 판정 로직
<img width="565" alt="image" src="https://github.com/user-attachments/assets/93621d55-8a02-4884-90a3-1b01792df218" />

- 게임 기록 저장 및 조회 (로그 상 인디케이터 대신 안내문구와 함께 로딩 시간 구현)
<img width="565" alt="image" src="https://github.com/user-attachments/assets/7832eaf9-e637-4b8a-ad90-09079d91aebe" />
기록이 없는 경우에 대한 예외 처리
<img width="565" alt="image" src="https://github.com/user-attachments/assets/fe5d8141-9020-4d0b-8979-0aaa11ee3580" />

- 사용자 입력에 대한 유효성 검증
<img width="565" alt="image" src="https://github.com/user-attachments/assets/1cb75974-a2a5-4c67-bf04-a8d024add89c" />

- 게임 설명 보기
<img width="565" alt="image" src="https://github.com/user-attachments/assets/19f1b180-b1a9-4c0b-b723-51de9595ca03" />


## 기술 스택
- 언어: Swift
- 입출력: 콘솔 기반 상호작용

## 프로젝트 구조
```
BaseBallGame/
├── main.swift  // 게임 실행
├── BaseBallGame.swift  // 게임 메인 로직 구현
└── GameHistory.swift   // 게임 기록 모델
```

## 구현 세부사항
- `BaseBallGame` 구조체: 게임의 주요 로직과 흐름 제어
  - `start()`: 게임 시작 및 메뉴 관리
  - `makeAnswer()`: 서로 다른 숫자로 구성된 3자리 정답 생성
  - `findStrike()`: 스트라이크 계산
  - `findBall()`: 볼 계산
- `GameHistory` 구조체: 게임 기록 관리
  - 게임 번호와 시도 횟수 저장
  - 게임 결과 출력

## 제작자
3팀 iOS_마스터_6기 송규섭
