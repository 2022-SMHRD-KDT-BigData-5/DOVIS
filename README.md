# 업무 일정 관리를 위한 지능형 어시스턴트 (팀명 : 도비스)
딥러닝/머신러닝 모델링크: https://drive.google.com/file/d/1KScKvBWyF5fNogj379mWVDEMYHBOcfXU/view?usp=sharing 
<br>(용량문제로 푸시되지않아서 따로 구글링크로 대체합니다.)
![image](https://user-images.githubusercontent.com/104408785/186540493-1d2f9b8b-89f0-4895-abb8-94dbe6a3b816.png)



## 1. 프로젝트명
* 업무 일정 관리를 위한 지능형 어시스턴트
### 서비스설명 
* 빠르고 원활한 업무관리를 위해 채팅메시지를 통한 일정자동등록
* 일정의 상세정보 및 날짜등을 확인해볼수 있도록 캘린더페이지 구현
* 오늘할 일과 완료된 일등을 보여주는 투두리스트 구현

## 2. 주요기능
* 채팅 페이지
* 캘린더 페이지 
* 투두리스트

## 3. 개발환경
|구분|내용|
|------|---|
|사용언어|Spring Framework, HTML, CSS, JavaScript, Python|
|사용한 라이브러리| Tensorflow, Pytorch / etc...|
|개발도구|E-government framework 3.xx / JupyterNotebook 6.4.12 / Colab/ VisualStudioCode  / etc...|
|서버환경|tomcat 8.5, Flask|
|데이터베이스| MySQL|




## 4. 기능 흐름도


### 서비스 흐름도(유스케이스)
![image](https://user-images.githubusercontent.com/104408785/186541897-4cca42f5-e741-4f3a-a12c-fb0fbd5265cc.png)
### 웹화면 흐름도(유스케이스)
![image](https://user-images.githubusercontent.com/104408785/186545642-4c59e3a8-9257-4e97-9ef7-508fd74dda29.png)
#### ER 다이어그램
![image](https://user-images.githubusercontent.com/104408785/186541819-b3bfe654-2008-4367-84f5-25c8e7aaa758.png)

## 5. SW 동작 화면

## 로그인
  
* 일반로그인
<br>![image](https://user-images.githubusercontent.com/104408785/186545867-c6244653-7f92-44fb-b91f-8e20a947c1f1.png)

* 소셜로그인
<br>![image](https://user-images.githubusercontent.com/104408785/186545961-346dd0f4-6a41-471b-a194-0c765b3a1d2a.png)



##  웹페이지 구현

###  메인화면 
* TO-DO-LIST

![image](https://user-images.githubusercontent.com/104408785/186546186-35798a9e-a62b-4ab6-a08a-97d9a9b53ad6.png)


## 메뉴 (홈, 채팅, 캘린더, 회원수정, 로그아웃)

### 채팅 페이지
* 실시간 소통
![image](https://user-images.githubusercontent.com/104408785/186546642-0179705e-33ac-4b6b-b122-aae9f6d6dfd1.png)


* 일정 등록
![image](https://user-images.githubusercontent.com/104408785/186546544-0010cfb7-2bc1-4ae2-8aa7-858422a12413.png)

### 캘린더 페이지 
* 일정확인
![image](https://user-images.githubusercontent.com/104408785/186547093-514009d1-880b-49a6-aa0a-47037fa36b01.png)

* 일정세부확인
![image](https://user-images.githubusercontent.com/104408785/186547231-d1a4f7b5-2491-4753-90b0-e5f5a91460bb.png)


## 회원정보수정
![image](https://user-images.githubusercontent.com/104408785/186547317-f0d8a3b6-48b0-49a7-9755-0dc0ca021e9a.png)

## 로그아웃
* 일정 재확인
![image](https://user-images.githubusercontent.com/104408785/186547394-119fe038-2e35-4d5e-b730-14b02bad49ba.png)

* 로그아웃
![image](https://user-images.githubusercontent.com/104408785/186547416-f45bf5fc-a27f-4073-9d0a-f5a6ee81250a.png)



## 6. 참고문헌 
![image](https://user-images.githubusercontent.com/104408785/186547566-254ece42-d9fd-4b6b-8e90-4b37b0fc6ddd.png)


## 7. 제작 일정!
![image](https://user-images.githubusercontent.com/104408785/186548498-582c32f3-3252-4583-8c62-8908b88c2284.png)


## 8. 팀원소개 및 업무 
![image](https://user-images.githubusercontent.com/104408785/186548536-12e441de-5079-45d1-918c-86b4e5dc1f3c.png)


## 9. 트러블슈팅

개념: 문제 해결을 위해 문제의 원인을 논리적이고 체계적으로 찾는 일이며 제품이나 프로세스의 운영을 재개
프로젝트 진행하는 동안 발생했던 이슈 중 가장 기억에 남았던 문제와 해결 프로세스 나열
* 문제1<br>
 문제점 설명 및 해결방안<br>
 문제점: 딥러닝모델 활용시 파이썬 라이브러리의 버젼충돌현상발생. <br>
 해결방안 : KoBERT를 활용하여 전이학습을 진행하려했지만 버젼충돌로 인해 학습되지않아 다른 대안이었던 KcBERT모델을 이용하여 전이학습을 시켰으며,
 다행히 버젼충돌의 문제가 발생하지않았다. 이후 Google의 BERT모델과 다른 네이버챌린지데이터셋을 활용한 모델을 전이학습하여 모델를 만들어보았으며 이 둘을 비교해보았을때,
 학습율과 검증율은는 KcBERT모델이 97.6%, 검증율이 93.7%, Google의 BERT모델은 학습율 95.6%, 검증율 95.7%로 거의 비슷하였으나 데이터셋을 다르게 적용시켜서 확인한 것은 
 어떤 데이터셋이 더 우리조가 일정등록할 때 정확하게 후처리를 할 수 있을지에 대해서 생각해보았을때 KcBERT모델이 더 수월하게 처리가 가능할 것으로 판단하여 KcBERT모델을 이용한 딥러닝 모델을 적용시켰다. 
 제공되는 데이터셋이 방대하고, 이를 전처리하는데 시간소모가 많아 제한된 시간에 적용할 수 없을것이라고 판단하여, 다른 두가지 모델과 다른 데이터셋을 활용하여 비교해보았다. 
 
 
* 문제2<br>
 문제점 설명 및 해결방안<br>
 문제점:채팅내용을 딥러닝 모델로 분류한 뒤에 후처리 문제 <br>
 해결방안: 딥러닝의 개체명인식시 토큰과 토큰이 서로 연관되어있다고 판단되면 앞에 ##가 붙으며 이를 파이썬의 Strip함수로 제거하였으며, 동일한 개체명은 하나의 변수로 담는 로직을 만들어 Flask를 통해 Jsp로 값을 전달 시켰다. 
 

* 문제3<br>
  문제점 설명 및 해결방안<br>
  문제점: Flask와 Jsp간의 전달방식에서 에러 <br>
  해결방안: 근본적으로는 데이터타입의 문제였으며, String타입으로 Jsp로 값을 넘기려고 하는 해서 에러가 난 것이며, 이를 ArrayList타입으로 값을 전달하여 에러를 해결하였다. 
