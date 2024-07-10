# bloc를 공부하고 사용하는 이유
1. 뷰 영역과 비지니스 영역을 쉽게 구분할 수 있다.
    - 뷰에 비지니스 로직이 있으면
        - 장점 1. 빠르게 코드를 짤 수 있다
        - 장점 2. 복잡성을 덜수있다
        - 단점 1. 경계없이 쭉 나열되어있어서 분석하기엔 어렵다 
        - 단점 2. 화면만 수정하면 되는것을 비지니스 로직까지 수정해야할수도있고 그 반대일 수도 있다.

        그래서 나온것이 mvc나 mvvm 같은 패턴이다.
    - 뷰와 비지니스 로직이 분리되어 있는경우
        - 장점 1. 분리되어있기때문에 뷰에 비지니스로직이 있을때 단점을 완벽히 보완할 수 있다.

2. 테스트 하기 쉽고, 재사용을 가능하게 해준다 
    - 하나 만들어놓으면 그걸 게속 사용 가능할 수 있다 (기능을 잘 나누고 필요한 부분만 의존성을 가지게 하자)
3. 이벤트 트레킹을 통합적으로 관리할 수 있다

4. 많은 개발자들의 하나의 코드 베이스로 일을 처리할 수 있다 
    - bloc을 사용하는 개발자들은 bloc을 사용할때 따로 개발자들끼리 정해놓은 규칙 없이 그저 하나의 코드베이스로 사용 가능하다

5. github에서 가장 높은 star수를 가지고 있다



# Future에 대해서 
- 비동기적인 작업을 수행할때 사용
- api통신을 통해 데이터를 얻을때 사용

# Stream
- stream이란? 
    - 사전적 의미 : 연속, 흐르다 
- 실시간으로 데이터가 변경된것을 확인하고 변경시켜주는것

# bloc 위잿 종류
- Blocbuilder
- BlocSelector
- BlocProvider
- MultiBlocProvider
- BlocListener
- MultiBlocListener
- BlocConsumer
- RepositoryProvider
- MultiRepositoryProvider

# BlocPrivider
Bloc + provider, 블럭을 제공하는 위젯

ex)

```dart
return BlocProvider(
    create: (context) => SampleBloc(),
    lazy : false,
    child : SampleOage(),
);
```

특징
- 지연 생성 옵션(lazy)
- 하위 계층 위젯들에서 접근 가능
- Bloc 생성 후 메모리 반환의 경우 자동으로 해준다  

# MultiBlocProvider
BlocProvider 다중 등록

ex)

사용전 

```dart
return BolcProvider<BlocA>(
    create: (context) => BlocA(),
    child: BlocPrivider<BlocB>(
        create: (context) => BlocB().
        child : BlocProvider<BlocC>(
            crerate : (context) => BlocC(),
            child : ChildA(),
        ),
    ).
);
```

사용후
 


```dart
return MultiBlocProvider(
    providers:[
        BlocProvider(create: (context) => BlocA()),
        BlocProvider(create: (context) => BlocB()),
        BlocProvider(create: (context) => BlocC()),
    ],
    child : ChildA(),
);
```

# BlocBuilder
BlocProvider로 생성된 bloc을 사용할때 쓰는 widget
- bloc옵션을 사용하지 않고 사용시 현 context로부터 bloc을 찾아 변화를 감지
- bloc을 지정하는 케이스의 경우 특별한 케이스에서 사용하라고 권장한다.

bloc옵션 없이 사용
```dart
child : BlocBuilder<SampleBloc, int>(
    builder: (context, state){
        return Text(
            state.toString(),
            style: Textstyle(fontsize: 70),
        );
    },
),
```

bloc옵션 사용
```dart
content: BlocBuilder<SampleBloc, int>(
    bloc : sampleBloc,
    builder: (context, state){
        return Text(state.toString(),
        style : TextStyle(fontsize: 70),
        );
    },
),
```

- buildWhen 옵션을 통해 필요한 조건일때만 변화를 줄수 있다

# RepositoryProvider, MultiRepositoryProvider
Repository + Provider
Repository(저장소)를 제공하는 위젯입니다 
- 지연생성 옵션(lazy)을 통해 관리할 수 있다.
- 저장소 데이터를 가공할 수 있는 데이터베이스 or 외부 api통신 등 관리할때 사용.

```dart
return RepositoryProvider(
    create: (context) => RepositorySample(),
    child: BlocProvider(
        create: (context) => SampleBlocDI(context.read<RepositorySample>()),
        child: SamplePage(),
    ),
);
```  
# BlocSelector
bloc의 상태중 필요한 부분만 선택적으로 필터링하여 변경에 도움을 주는 widget 

```dart
BlocSelector<BlocSelectorBloc, BlocSelectorState, bool>(
    selector : (state) => state.changeState,
    builder : (context, state){
        return Text(
            state.toString(),
            style: Textstyle(fontsize: 70),
        );
    },
),
```

# BlocListener, MutliBlocListener
상태변환에 따른 이벤트만 처리가 필요할때 사용되는 widget

```dart
child: BlocListener<SampleBloc, int>(
    listenWhen: (previous, current) => current > 5,
    listener : (context, state){
        _showMessage(context);
    },
    child: Text(
        context.read<SampleBloc>().state.toString(),
        style: Textstyle(fontsize: 70),
    ),
),
```

ex) 
- 특정 상태가 변경되었을때 메세지 팝업을 띄워야 하는 상황
- Bloc간 통신이 필요할때

# BlocConsumer
BlocBuilder와 BlocListener를 합쳐놓은 위젯.
- 이벤트도 처리하면서 동시에 화면도 변경을 해줘야 할때 사용
- buildWhen과 listenWhen조건을 통해 적절한 때에만 변경 및 이벤트처리를 할 수 있다.
# Bloc에만 있는 기능
상태변화 모니터링을 이벤트로 확인 가능 하다 

# Bloc_Concurrency란?
Ember_concurrency에서 영감을 받음.
<br>
그럼 여기서 Ember_concurrency란? 
- EmberJS의 플러그인으로 비동기 프로그램을 간결하면서도 강력하게만들어주는 라이브러리다.
    - 그럼 여기서 EmberJS란? 
        - React나 Vue, Angular같은 프레임워크이다. 

웹에서만 사용하던 emberjs같은 기술을 플러터 bloc에서도 사용할 수 있게 하는 라이브러리이다.

그래서 bloc_concurrency또한 비동기로 작동하는것을 손쉽게 코드를 짤 수 있도록 도와준다.

# 