# 모두의 발레 앱

## 개요

모두의 발레 서비스를 위한 플러터 앱입니다.

## 개발 환경

- Flutter 3.7.0 with FVM

### 개발 환경 구축 팁

[FVM](https://fvm.app/) 설치 후 아래 명령어를 실행합니다.

```bash
  $ fvm install 3.7.0
  $ fvm flutter pub get
```

사용하는 IDE에 따라 fvm 을 인식하도록 설정합니다.([#](https://fvm.app/docs/getting_started/configuration#ide))

## 실행 방법

### Firebase 설정

Firebase 설정에 필요한 파일은 모두의 발레 구글 드라이브 개발 폴더에 있습니다.

파일을 다운받아 아래 경로에 저장합니다.

- `lib/config/firebase_config.dart`
- `android/app/google-services.json`
- `ios/firebase_app_id_file.json`
- `ios/Runner/GoogleService-Info.plist`

### 의존성 설치

```bash
  $ fvm flutter pub get
```

### 실행

```bash
  $ fvm flutter run
```

## 배포

현재는 Firebase CLI 를 사용하여 내부 배포만 진행합니다.
관련한 세팅은 [Firebase 앱 배포 페이지](https://firebase.google.com/docs/app-distribution?authuser=0&hl=ko)
를 참조하시기 바랍니다.

### Android

```bash
  $ fvm flutter build apk
  $ firebase appdistribution:distribute build/app/outputs/flutter-apk/app-release.apk \
  --app $(cat android/app/google-services.json | jq -r '.client[0].client_info.mobilesdk_app_id')
```

### iOS

iOS 빌드는 개발자 계정이 필요합니다.

> TBD

### Web

간단한 UI 확인을 위해 Firebase web hosting도 사용합니다.
Firebase 설정 후 아래 명령어를 실행합니다.

```bash
 $ fvm flutter build web --web-renderer canvaskit
 $ firebase deploy
```
