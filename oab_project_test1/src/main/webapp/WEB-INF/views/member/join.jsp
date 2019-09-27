<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Join Member!</title>

<!-- 모바일 웹 페이지 설정 -->
<!-- <link rel="shortcut icon" href="/resources/image/icon.png" />
<link rel="apple-touch-icon" href="/resources/image/icon.png" /> -->
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
      <script src="/resources/include/js/html5shiv.js"></script>
      <![endif]-->

<script type="text/javascript"
   src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/join.js"></script>
<script type="text/javascript">
   function errCodeCheck() {
      var errCode = '<c:out value="${errCode}" />';
      if (errCode != '') {
         switch (parseInt(errCode)) {
         case 1:
            alert("이미 가입된 회원입니다!");
            break;
         case 2:
            alert("회원가입 처리가 실패하였습니다. 잠시 후 다시 시도해 주십시오.");
            break;
         }
      }
   }
</script>

<link type="text/css" rel="stylesheet"
   href="/resources/include/css/join.css">

</head>
<body>
   <form id="memberForm" class="joinform" name="form">
      <div id="mainsize">
			<div>
				<table>
					<tr>
						<td width="100%" height="10%"><span
							style="padding-left: 160px"></span>&nbsp; <br>
							<hr></td>
					</tr>
					<tr>
						<td width="100%" height="20%" align="center">
							<p align="left">
								<span> <b id="oab"> OAB 텐트 약관동의</b></span>
							</p> <br> <textarea rows="35" cols="70" readonly="readonly">가. 수집하는 개인정보의 항목첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
회원가입
- 이름, 생년월일, 성별, 아이디, 비밀번호, 이메일, 연락처(메일주소, 휴대폰 번호), 가입인증정보
만14세 미만 아동 회원가입 
- 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호, 연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
단체아이디 회원가입 
- 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소, 관리자 아이디, 관리자 연락처, 관리자 부서/직위
- 선택항목 : 대표 홈페이지, 대표 팩스번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다. 
넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다. 
- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다. 
- 신용카드 결제시 : 카드사명, 카드번호 등
- 계좌이체시 : 은행명, 계좌번호 등
나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다. 
- 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
- 협력회사로부터의 제공 
- 생성정보 수집 툴을 통한 수집
   </textarea> <br> <label id="checkbox"><input type="checkbox"
								name="req"><span>개인정보 수집 및 이용에 동의합니다.</span></label>
							<hr>
						</td>
					</tr>
				</table>
			</div>
			<div class="contentContainer">
         <div class="well">
            <div class="form-group">
               <label for="mt_id" class="userId">사용자 ID</label>
               <div>
                  <input type="text" id="mt_id" name="mt_id" maxlength="12"
                     class="userid" placeholder="User ID" /> <input type="button"
                     id="idConfirmBtn" value="아이디 중복체크"
                     class="form-control btn-primary" />
               </div>

               <div class="col-sm-5">
                  <p class="error"></p>
               </div>
            </div>

            <div class="form-group">
               <label for="mt_pw" class="userPw">비밀번호</label>
               <div>
                  <input type="password" id="mt_pw" name="mt_pw" maxlength="15"
                     class="form-control" placeholder="Password" />
               </div>
               <div class="col-sm-5">
                  <p class="error"></p>
               </div>
            </div>

            <div class="form-group">
               <label for="mt_pwCheck" class="userPwCheck">비밀번호 확인</label>
               <div>
                  <input type="password" id="mt_pwCheck" name="mt_pwCheckpw"
                     maxlength="15" class="form-control"
                     placeholder="Password Confirm" />
               </div>
               <div class="col-sm-5">
                  <p class="error"></p>
               </div>
            </div>

            <div class="form-group">
               <label for="mt_phone" class="userPhone">핸드폰 번호</label>
               <div>
                  <input type="text" id="mt_phone" name="mt_phone" maxlength="11"
                     class="form-control" placeholder="Phone Number" />
               </div>
               <div class="col-sm-5">
                  <p class="error"></p>
               </div>
            </div>

            <div class="form-group">
               <label for="mt_email" class="userEmail">이메일</label>
               <div>
                  <input type="text" id="mt_email" name="mt_email" maxlength="60"
                     class="form-control" placeholder="@ 포함 영문/숫자 10~50자 입력"
                     required="required" />
               </div>

               <div class="col-sm-5">
                  <p class="error"></p>
               </div>
            </div>

            <div class="form-group">
               <label for="mt_Birth" class="userBirth">생년월일</label>
               <div>
                  <input type="text" id="mt_birth" name="mt_birth" maxlength="6"
                     class="form-control" placeholder="주민등록번호 앞 6자리" />
               </div>
               <div class="col-sm-5">
                  <p class="error"></p>
               </div>
            </div>

            <div class="form-group">
               <label for="mt_Name" class="userName">회원이름</label>
               <div>
                  <input type="text" id="mt_name" name="mt_name" maxlength="10"
                     class="form-control" placeholder="Name" />
               </div>
               <div class="col-sm-5">
                  <p class="error"></p>
               </div>
            </div>


            <div class="form-group">
               <label for="mt_gender" class="userGender">성별</label>
               <div id="gender">
                  <input type="radio" name="mt_gender" value="Female">여성 <input
                     type="radio" name="mt_gender" value="male">남 성 <input
                     type="radio" name="mt_gender" value="neutral" checked="checked">선택안함
               </div>
               <div class="col-sm-5">
                  <p class="error"></p>
               </div>
            </div>
            <div>
               <div>
                  <input type="button" value="확인" id="joinInsert"
                     class="btn btn-default" /><br> <input type="button" value="재작성"
                     id="joinReset" class="btn btn-default" /> 
               </div>
            </div>
         </div>
      </div>
      
  </div>
   </form>
</body>
</html>