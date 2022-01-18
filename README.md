# w2-signup-profile

## IBOutlet, IBAction
Edit 버튼 클릭 시 Label의 backgroundColor, textColor, alpha, text content가 변경됩니다.
<img src="https://user-images.githubusercontent.com/95681572/149738907-ea5e3002-4323-41f9-9013-29f3747de79d.png" width=50%><img src="https://user-images.githubusercontent.com/95681572/149738942-de6b4469-d42a-454f-a88c-f8571d8dc17c.png" width=50%>

### 학습거리
- **action** → function that triggers when a specific event occurs in your app
- **outlet** → a reference from an object in a stroryboard to a source file
- 버튼에 IBAction을 추가할 때의 이벤트 종류 https://developer.apple.com/documentation/uikit/uicontrol/event
- 버튼이 여러개일 때 하나의 액션에 추가할 수 있을까? 가능하다.
- 버튼 하나에 여러개의 액션을 추가할 수 있을까? 가능하다.


<img src="https://s3-us-west-2.amazonaws.com/secure.notion-static.com/7e588db0-97e1-43bc-ac05-8621f048fdf5/Untitled.png" width=50%>

### 학습거리
- (open) → viewDidLoad → viewWillAppear → viewDidAppear → (cancel) → viewWillDisappear → viewDidDisappear
- IBAction과 Segue 중 IBAction이 먼저 작동하고, Segue가 작동한다.
- type of segue : https://stackoverflow.com/questions/25966215/whats-the-difference-between-all-the-selection-segues
