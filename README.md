# 마음카드 부스

청년마음돌봄 부스용 마음체크 웹앱 + 관리자 통계/운영가이드 페이지.

## 구성

- `마음카드_부스.html` — 참가자용. 카드 선택 → 6문항 유형검사 → 결과(유형/대화멘트/아이템). 완료 시 Supabase에 기록 전송.
- `admin.html` — 관리자용. "참여 통계" 탭(전체/카드별 인원, 유형 분포, 최근 기록) + "운영 가이드" 탭.
- `config.js` — Supabase 연결 정보 (URL, anon key).
- `schema.sql` — Supabase에 한 번 실행할 테이블/권한 설정 SQL.

## 처음 설정하는 법

### 1. Supabase 프로젝트 만들기 (무료)

1. [supabase.com](https://supabase.com) 에서 새 프로젝트 생성
2. 왼쪽 메뉴 **SQL Editor** → 이 저장소의 `schema.sql` 내용 전체를 붙여넣고 실행
3. 왼쪽 메뉴 **Project Settings → API** 에서 **Project URL** 과 **anon public** key 복사
4. `config.js` 파일을 열어 두 값을 채워넣기:
   ```js
   const SUPABASE_URL = 'https://abcdxyz.supabase.co';
   const SUPABASE_ANON_KEY = 'eyJhbGciOi...';
   ```

> `config.js`를 채우지 않아도 앱은 동작합니다. 이 경우 참여 기록은 그 브라우저(기기)에만 저장되고, 관리자 페이지도 같은 기기에서만 통계가 보입니다.

### 2. GitHub Pages로 올리기

1. GitHub에서 새 저장소 생성 (Public 또는 Private)
2. 이 폴더의 파일 전체를 그 저장소에 push
3. 저장소 **Settings → Pages** → Source를 main 브랜치로 설정
4. 1~2분 뒤 `https://아이디.github.io/저장소이름/마음카드_부스.html` 로 접속해서 확인
5. 관리자 페이지는 `https://아이디.github.io/저장소이름/admin.html`

### 3. 부스 운영 전 체크

- [ ] `config.js`에 실제 Supabase 값이 들어있는지 확인
- [ ] 참가자용 주소로 직접 검사 하나를 완료해보고, 관리자 페이지에 숫자가 올라가는지 확인
- [ ] 관리자 페이지 주소는 운영진만 공유 (별도 로그인 보호는 없음)
