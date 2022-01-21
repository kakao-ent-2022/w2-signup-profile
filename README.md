# w2-signup-profile

## 1. 탭바 컨트롤러 생성

- 시간 : 2022:01.17 12:59
<img src="https://images.velog.io/images/taelee/post/330b6351-1bca-42c0-813f-cf701e570ece/image.png" width = 400>


## 2. 프로필 화면 생성 및 버튼을 눌러 글자 속성 바꾸기

- 시간: 2022.01.17 13:04
- 버튼 누르기 전

<img src="https://images.velog.io/images/taelee/post/4d25bec4-85c0-4277-a342-a43de0a85e81/Simulator%20Screen%20Shot%20-%20iPhone%2013%20-%202022-01-17%20at%2013.57.49.png" width = 300>

- 버튼 누른 후

<img src="https://images.velog.io/images/taelee/post/d32ad4a3-7abf-474d-800d-3542a44f2298/Simulator%20Screen%20Shot%20-%20iPhone%2013%20-%202022-01-17%20at%2013.59.17.png" width = 300>


## 3. 프로필 화면 구성

- 시간: 2022-01-17 16:12
- 프로필 수정화면에서 수정된 내용이 프로필 화면에 반영되도록 함
- 데이터 전달은 delegate 패턴 사용

![](https://images.velog.io/images/taelee/post/b247f943-a9ba-409f-862d-d22b5bbe0320/Jan-17-2022%2016-12-01.gif)

## 4. 프로필 수정화면에서 사진 변경시 프로필 화면 사진이 변경되도록 구현
- 시간: 2022-01-18 11:42
- ImagePickerController를 통해 프로필 사진을 변경할 수 있도록 구현
- 또한 변경된 이미지를 프로필 뷰컨트롤러로 전달함(delegate패턴)
![](https://images.velog.io/images/taelee/post/2fd75e82-4f6a-4a65-b750-160091e15a5d/Jan-18-2022%2013-37-38.gif)

## 5. 로그인 화면 구현 및 이동된 메인화면에서 웹뷰 구현
- 시간: 2022-01-18 15:28
- WKWebView를 통해 page.kakao.com페이지가 앱내에서 보이도록 구현
![](https://images.velog.io/images/taelee/post/4587f912-d951-40b8-8bb4-ff9bb832dbc6/Jan-18-2022%2015-27-34.gif)

## 6. 회원가입 화면 검증 구현
- 시간: 2022-01-21 00: 44
- 텍스트 필드를 xib파일로 나누어서 구현해봤습니다.
- 각각의 텍스트 필드들의 델리게이트를 만들어서 텍스트필드의 변화를 감지하게 했습니다.
- 아래 영상(gif)에서는 편의를 위해 비밀번호 필드와 비밀번호 재확인 필드에 숫자가 보이도록 설정했습니다. 풀리퀘 올린 코드에는 "●●●●●"으로 표시됩니다.

![](https://images.velog.io/images/taelee/post/2a0120d7-2317-4526-b634-ab02773d554d/Simulator%20Screen%20Recording%20-%20iPhone%2013%20Pro%20-%202022-01-21%20at%2000.40.26.gif)
