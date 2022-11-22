# secedit
secedit edit general user 윈도우 보안 설정

#### 1. [secedit 편집 실행 파일](https://github.com/oklokl/secedit/releases/tag/batch_file)

16.bat 파일 위에 cfg.ini 파일을 드래그 하면 알아서 걸러 주네요.

[제작 관련 정보](https://cafe.daum.net/candan/Lrrl/5)

`zero_frame.txt` 뼈대 파일을 가지고 수정 해서 쓰시면 되네요. 

가장 핵심은 

`특수 문자가 있다면 \표시를 앞에 붙쳐 주시고요. * 별표의 경우 \* 이런식으로. 그리고 BBB 부분에는 \표시를 넣지 마세요. 앞단에만 넣으셔야 하네요`

ex>
```
echo cfg.ini 
*AAA,A*AA

REM 이런 문장이 있다면

REM 기존양식
type %DropPath% | powershell -Command "$input | ForEach-Object { $_ -replace \"AAA\",	 \"BBB\" }" > %temp%\1.txt

REM 변경할 양식
type %DropPath% | powershell -Command "$input | ForEach-Object { $_ -replace \"\*AAA,A\*AA\",	 \"*BBB,B*BB\" }" > %temp%\1.txt

REM 이렇게 뒷 부분은 \를 쓰지 않는 거죠 
```

그리고 다음의 새로운 줄을 써야 한다면
```
`nABCDE1234
```
이런식으로 해야 하고 또 그아래 하려면 계속 추가 하면 되네요 카페 참고 하세요

하지만 윗 줄을 먼져 동일 하게 써주어야 하네요.


### 샘플 파일들 입니다 zero_frame.bat 뼈대 이고요.  sample_file.bat 영상속 편집 파일이에요. 02는 마지막 간의 완성품 

https://github.com/oklokl/secedit/blob/main/edit/zero_frame.bat 뼈대

https://github.com/oklokl/secedit/blob/main/edit/sample_file.bat 처음 편집 할때 쓸수 있는

https://github.com/oklokl/secedit/blob/main/edit/sample%20file02.bat 대충 임시 간의 완성품 

https://github.com/oklokl/secedit/blob/main/edit_run/16.bat  완전 완성품


[과거 글](https://github.com/oklokl/advfirewall-ip-list-firehol_level1.netset/releases/tag/secedit) 여기에 있다 이사 왔어요 ㅎㅎ 좀 복잡해지고 지저분해질까봐 이사 왔네요

## 주의사항: 윈도우는 전체 백업 하세요 secedit 잘못 적용 하면 윈도우 로그인 자체를 못하실수도 있습니다.

고스트 트루 이미지 등으로 백업 하세요

컴퓨터를 다루지 못하는 분은 사용 하지 마시길 권합니다.

`sfc /SCANNOW` 무결성 검사 입니다. 에러가 나면 꼭 이걸 하세요.

원본 파일로 복구 하시고요. 백업은 꼭 하세요.
