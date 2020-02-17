---
date: 2019-08-19
title: Mac에 VirtualBox 설치하고 Windows10 설치하기
tags: [Virtual Box, "설치"]
categories: [기록]
draft: false
---

맥에서 VirtualBox를 설치하는 것을 알아본다. 맥 환경은 다음과 같다.

![MacBookPro_Info](/2019/08-19/macbookpro_info.png)

# VirtualBox 설치하기

1. https://www.virtualbox.org/ 접속, 왼쪽 메뉴 `Downloads` 클릭
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-01.png)
2. 아래그림과 같이 빨간색 박스를 클릭해서 다운로드
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-02.png)
3. 다운로드 받은 파일 중, **dmg 파일** 클릭
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-03.png)
4. 아래 그림과 같이 1번 `VirtualBox.pkg` 클릭하고, `Continue` 클릭
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-04.png)
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-05.png)
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-06.png)
5. 설치 권한의 암호를 묻는다. 지문으로 풀던, 암호입력으로 풀던해서 입력하면 설치가 진행된다.
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-07.png)
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-08.png)
6. 설치가 완료되면, 설치파일을 삭제할 것인가 묻는다. 그냥 지우지 않았다. 쓸 수 있는데, 다시 다운받기 귀찮아서. `Keep` 버튼을 누르고 종료한다.
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-09.png)
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-10.png)
7. 두 번째, `Application` 디렉터리를 클릭하면, `VirtualBox.app` 실행파일이 보인다. 클릭하자.
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-11.png)
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-12.png)
8. 실행하면 다음과 그림이 나오면 정상적으로 설치가 되었다.
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-13.png)
9. 이제 두 번째로 다운받은 **익스텐션 파일**을 실행하자.
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-14.png)
10. 실행하게 되면 자동으로, 설치할 것인가 묻는다. `Install` 버튼을 클릭하자. 그리고 `I Agree` 클릭한다.
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-15.png)
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-16.png)
11. 설치를 위해 권한의 암호를 묻는다. 자신의 맥북 사용자 암호를 입력한다. 그러면 아래와 같이 성공적으로 설치했다는 팝업창이 뜬다.
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-17.png)
    ![VirtualBox-Installation](/2019/08-19/VirtualBox-Installation/virtualbox-installation-18.png)


# 가상머신 이미지 환경 세팅하기

1. `VirtualBox`를 실행한다.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-01.png)
2. `New` 툴바를 클릭한다.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-02.png)
3. `Expert Mode`를 클릭하고, `Name: Windows10` 입력하고 메모리는 `8192`를 입력한다. `Name`은 사용자가 원하는대로 입력하면 되고, `메모리 크기`는 호스트 환경에 따라서 설정한다. 현재 데모 호스트 환경은 맥북의 맥 OSX 를 사용하고 있으며, 이 환경의 메모리는 `16GB` 메모리를 사용하고 있다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-03.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-04.png)
4. 디스크 크기는 `60.00GB` 입력한다. 마찬가지로 `디스크 크기`는 호스트 환경에 따라서 설정한다. 현재 데모 호스트 환경은 맥북의 맥 OSX 를 사용하고 있으며, 이 환경의 디스크 크기는 `512GB SSD`를 사용하고 있다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-05.png)
5. 가상머신의 이미지의 환경을 세팅하기 위해서 `Settings`를 클릭한다. `General 메뉴바`에서 `Advanced 탭`을 클릭하고, 두 가지 설정을 아래 그림처럼 한다. `Shared Clipboard` 설정은 호스트의 클립보드에 있는 내용과 가상머신의 클립보드 내용을 공유해서 동시에 사용하기 위함이다. 또한 `Drag'n Drop`은 호스트와 가상환경 간의 `Drag & Drop` 기능을 사용하기 위함이다.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-06.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-08.png)
6. `System` 메뉴바의 `Processor` 탭을 클릭한다. 그리고 자신의 환경에 맞게 `Core 개수`를 설정한다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-10.png)
7. `Storage 메뉴바`에서 `CD` 모양의 `Empty` 부분을 클릭 선택하고 오른쪽의 별표 위의 `CD 모양`을 클릭해서 `Windows 10 iso` 파일을 찾아 선택 삽입한다. 정상적으로 삽입되었다면, 아래 그림처럼 보인다.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-11.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-12.png)
8. `Audio 메뉴바`에서 아래 그림처럼 `체크박스`를 선택으로 한다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-13.png)
9. `Shared Folders 메뉴바`에서 오른쪽 `폴더의 더하기 모양`의 아이콘을 클릭한다. 그리고 호스트 머신의 공유하고 싶은 디렉터리를 선택한다. 여기에서는 `/Users/ryan` 계정의 전체를 공유했다. `OK` 버튼을 누르고 `Start` 버튼을 눌러 시작하자.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-14.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-15-1.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-15-2.png)

# Windows 10 설치

1. `VirtualBox`의 `Start` 버튼을 누르면 아래처럼 Windows10이 시작하는 것을 볼 수 있다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-16.png)
2. 본인 취향에 맞게 설정한다. 여기에서는 **기본 값**으로 하고 `다음(N)`을 클릭했다. 그리고 `지금 설치(I)`를 클릭해서 설치를 계속 진행한다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-17.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-18.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-19.png)
3. 설치하고자 하는 Windows 10 이미지가 보인다. 가장 아래의 것을 선택한다. <u>*이 항목은 사용자의 이미지에 따라 다를 수 있다.*</u>
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-20.png)
4. `동의함(A)` 체크박스를 선택하고 `다음(N)`을 클릭한다. 그리고, `사용자 지정: Windows만 설치(고급)(C)` 선택한다.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-21.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-22.png)
5. 운영체제가 설치 될 디스크 공간을 설정하는 곳이다. 우리는 이미지 세팅할 때, **60GB** 설정했었다. 여기서 `새로 만들기(E)` 클릭하고, `크기(S)`는 기본 값인 `61438`으로 하고 적용을 클릭하고, `다음(N)`을 클릭하고 `확인` 이후 `다음(N)` 클릭하고 진행한다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-23.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-24.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-25.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-26.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-27.png)
6. 설치가 되는 과정이다.  
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-29.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-30.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-31.png)
7. 사용할 지역 `한국`을 클릭하고 `예`를 클릭한다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-32.png)
8. `Microsoft 입력기`를 클릭하고 `예`를 클릭한다. 키보드는 부분은 `건너뛰기`를 클릭한다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-33.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-34.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-35.png)
9. `개인용 설정`을 선택 후, `다음(N)` 클릭하고 진행한다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-36.png)
10. 로그인 부분은 `오프라인 계정`을 선택 후, `다음(N)` 클릭하고 진행한다. 다음 화면에서 `아니요`를 선택한다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-37.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-38.png)
11. 적당한 `사용자 이름`과 `비밀번호`를 입력한다.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-39.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-40.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-41.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-42.png)
12. 보안 질문 3가지를 작성한다.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-43.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-44.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-45.png)
13. `예`를 클릭한다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-46.png)
14. `장치의 개인 정보 설정 선택` 부분은 모두 `아니요`로 선택하고 `수락`누르고 진행한다.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-47.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-48.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-49.png)
15. 엣지(Edge) 브라우저를 클릭하고, 브라우저에서 사용할 언어를 선택한다. 인터넷이 연결되었다면 MSN 사이트로 접속이 될 것이다. https://wwww.daum.net 도 접속해보자.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-50.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-51.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-52.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-53.png)
16. VirtualBox의 **메인 메뉴바**의 **`Devices`** 메뉴를 클릭 **`Insert Guest Additions CD Images`** 메뉴를 선택하자. 그리고 `파일 탐색기`를 열고 `내 PC`를 클릭하자. 그러면 자동으로 **`CD 드라이브(D:) VirtualVBox Guest Additions`** 가 보일 것이다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-54.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-55.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-56.png)
17. 드라이브를 클릭하고, **`VBoxWindowsAdditions`** 클릭해서 설치한다.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-57.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-58.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-59.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-60.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-61.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-62.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-63.png)
18. `Reboot now` 선택하고 `Finish`를 클릭하고 가상머신의 **Windows 10** 을 재시작한다.
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-64.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-65.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-66.png)
19. **로그인**을 하고 왼쪽 상단의 **녹색** 단추를 클릭해서 전체화면 보기를 시작하고, `Switch` 버튼을 클릭해서 전체화면 보기를 한다. 
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-67.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-68.png)
    ![Windows10-Installation](/2019/08-19/Windows10-Installation/Windows10-Installation-69.png)