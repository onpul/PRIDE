# 🗺🚴‍♀️지도 API를 활용한 자전거 라이딩 그룹 매칭 웹 어플리케이션
#### 프로젝트 명 : PRIDE(PROFESSIONAL, PEACEFUL, PERKY RIDE)
#### 프로젝트 기간 : 2022.05~2020.06
---
## 프로젝트 내용
  세계적인 ESG 열풍 가운데 친환경 교통수단으로써 자전거를 긍정적 관점에서 바라보는 분위기가 생겼다. 이에 따라 자전거를 이용할 때 필요한 인프라 지원이 강화되면서 자전거 소비가 증가하였다. 코로나 19 이후 자전거는 친환경 1인 이동 수단으로 주목 받으며 수요가 지속적으로 증가하고 있다. 또한 코로나 19의 확산세가 줄어들며 야외 스포츠가 인기를 끌었고 그룹 라이딩을 하고자 동호회를 찾는 사람들이 증가하는 추세이다. 

  그러나 자전거 동호회를 찾기 위해서는 네이버 카페나 카카오톡 오픈 채팅방 등으로 분산된 정보를 직접 검색해 가입해야 하는 번거로움이 있으며 자전거 라이딩 입문자에게는 지속적인 활동을 전제하는 동호회 가입이 부담스러울 수 있다.

   따라서 본 웹 어플리케이션에서는 그룹 라이딩에 일시적으로 참여하고자 하는 사용자가 부담 없이 원하는 때에 그룹 라이딩에 참여할 수 있도록 한다. 또한 연령대, 성별, 난이도, 라이딩 스타일 등의 분류를 선택해 개인 맞춤 라이딩 그룹 매칭이 가능하도록 하고자 한다.

### 1. 사용기술
> 언어: Java, HTML, CSS, Bootstrap, JS, jQuery, JSP
> 
> 프레임워크: Spring, MyBatis
> 
> 데이터베이스: Oracle
> 
> 프로젝트 관리 도구: Git

### 2. 데이터 베이스 모델링 
![축소판](https://user-images.githubusercontent.com/70316215/176845461-50cda1be-98cf-4d7d-a440-d07505d1cf4f.png)

### 3. 구현 기능 목록
|구분|기능|
|---|---|
|회원가입|닉네임 중복 검사, 특수문자 필터링, 비속어 필터링, 글자 수 제한, 선택한 연령대와 성별에 따라 라이딩 스타일의 라디오 박스 옵션이 동적으로 노출|
|로그인|글자 수 제한, 세션 생성|
|메인페이지|달력-해당 날짜의 완료된 모임 개수와 참여 가능한 모임 개수 뱃지 출력|
|라이딩 모임 리스트|라이딩 스타일 분류에 따른 검색, 사용자의 라이딩 스타일 분류 불러오기, 리스트 정렬|
|라이딩 상세 보기|사용자가 등록한 장소 정보를 지도에 마커로 출력, 지도 확대 및 축소, 1인 1모임 판단하여 참여 제한|
|라이딩 대기실|모임 수정 및 삭제, 모임 준비 상태 변경|

### 4. 주요 기능
#### 1) 분류 선택 및 정렬하여 리스트 조회
![image](https://user-images.githubusercontent.com/70316215/176846006-92bbab38-3205-4464-90b2-b23b45d547e2.png)
- 라이딩 스타일 분류에 따른 리스트 조회
- 회원가입 시 선택한 라이딩 스타일 분류를 적용하여 리스트 조회
- 리스트 정렬하여 조회

#### 2) 지도 API를 사용하여 장소 선택
![image](https://user-images.githubusercontent.com/70316215/176847106-63b40b01-77c0-4436-955c-c4a150d09dbf.png)
- 지도 API를 사용하여 모임에 필요한 장소를 선택

### 5. 프로젝트 문서
1) [표지, 목차](https://docs.google.com/document/d/1pwpWewvLs-Ntk_O1EB-ZqdGQv_zlBz3HbXgUUwgHmKM/edit?usp=sharing)
2) [기획안](https://docs.google.com/document/d/19g1JoS6nhVnfybVJ3t4QulIetCY6jjFEWWDfW9Sfj2w/edit?usp=sharing)
3) [프로젝트 일정](https://docs.google.com/document/d/1xCkvqDeK7ZP2eyaK3m-8PNOSI2Ulp58QfnRxypHkfD4/edit?usp=sharing)
4) [요구사항 분석서](https://docs.google.com/document/d/1xCkvqDeK7ZP2eyaK3m-8PNOSI2Ulp58QfnRxypHkfD4/edit?usp=sharing)
5) [플로우차트](https://docs.google.com/document/d/1fG-PI7GiL5IQ4OTyYRbraa273oaqbYS9lHIGX-ufwE4/edit?usp=sharing)
6) [데이터베이스 모델링](https://docs.google.com/document/d/19zsuLZ_NsP8KNjTtgLLTiV4bqADGkuzeJwtbJp0Te3w/edit?usp=sharing)
7) [파일 구조도](https://docs.google.com/spreadsheets/d/1xwfCYZIIYtxOnWHx9FEk3xbR_F3_nRVF0s7RrnLc_zs/edit?usp=sharing)




