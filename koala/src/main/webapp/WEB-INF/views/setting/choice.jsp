<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DownloadFiles</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<style>
    body{
        background-color: black;
        box-sizing: border-box;
        }
    .wrapper{
        width: 100%;
        height: 1200px;
        padding-top:200px;
    }
    .body_content{
        display: flex;
        justify-content: center;
        align-items: center;
        width: 80%;
        height: 80%;
        margin: auto;
        position: relative;
        
    }
    .block{
        /* border: 1px solid red; */
        height: 100%;
        width: 50%;
        display: flex;
        flex-direction: column;
        display: inline-block;
        /* background-color: ; */
        background-color: rgba(53, 44, 59, 0.5);
        
    }

    .block_title{
        margin-top: 20px;
        font-size: 35px;
        color: rgb(156, 220, 254);
        font-weight: bold;
        margin-bottom: 40px;
        margin-left: 30px;

    }
    #versionHistory{
        border-radius: 5px;
        height: 30px;
        float: right;
        margin-right: 40px;
        margin-top: 30px;
        background-color: rgb(41, 23, 44);
        color: white;
        font-weight: bold;
        font-size : 12px;
    }

    .choice_title{
        margin-top: 30px;
        color: rgb(255, 201, 20);
        font-size: 20px;
        font-weight: bold;
        margin-left: 20px;
    }
    .choice_content {
        margin-top: 30px;
        display: flex;
        color: white;
        font-size: 20px;
        margin-left: 30px;
    }
    .choice_content>input[type="text"]{
        border-radius: 5px;
        width: 300px;
        height: 25px;
    }
    #choiceSub{
        float: right;
        border-radius: 5px;
        margin-right: 50px;
        background-color: rgb(255, 201, 20);
        font-size: 20px;
        margin-top: 30px;
        height: 40px;
        width: 100px;
        cursor: pointer;
        font-weight: bold;
    }
    #choiceSub:hover{
        border: 2px solid grey;
        background-color: black;
        color: rgb(255, 201, 20);
    }
    .code_content{
        color: white;
        margin-left: 50px;
        background-color: 000000;
        opacity: 0.9;
        font-size: 15px;
    }
    .commonStyle{
        color: rgb(86,156,214);
    }
    .addStyle{
        color: grey;
    }
    hr{
        height:100vh;
        width:.5vw;
        border-width:0;
        color:#000;
        background-color:#000;
        }
    .lastButton{
        float: right;
        margin-top: 200px;
        margin-right: 50px;
    }
    .lastButton>button{
        height: 30px;
        font-weight: bold;
        font-size: 18px;
        border-radius: 5px;
        height: 40px;
        width: 100px;
        cursor: pointer;
        margin-left: 20px;
        /* color: white; */
        
    }
    .copyButton{
        background-color: #4B0082;
        color: #D9D2D9;
        border: none;
        cursor:pointer;
    }
    .downButton{
        background-color: #D9D2D9;
        color: #4B0082;
        border: none;
        cursor:pointer;
    }
    .copyButton:hover,.downButton:hover{
        background-color: black;
        color: #4B0082;
        border: 2px solid grey;
    }
    /* .button2:hover{
        background-color: black;
        color: #D9D2D9;
    } */

	.desArea{
		display : none;
		font-size: 15px;
	}
	.desTitle{
		margin-left:20px;
		margin-bottom:20px;
		font-size:20px;
		margin-top:20px;
	}
	.desContent{
		width:80%;
		margin-top:20px;
		margin-left:20px;
		font-size:12px;
	}
	.description{
		margin-top:20px;
		margin-left:20px;
		font-size:15px;
	}
	#description_part2{
		margin-top:20px;
	}

</style>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
    <div class="wrapper">
        <div class="body_content">
            <div class="block">
                <div class="block_title">
                    <span>${setting.settingTitle}<!-- commons --></span>
                </div>
                <div class="desArea">
                <div class="description">
	              <p id="description_part1">
	              		${setting.sortDescription }
<!-- 	              Commons Library(http://commons.apache.org/)는 아파치 재단에서 관리하고 있는 라이브러리로  -->
<!-- 		                        프로그램 개발 시 재사용 가능한 자바 컴포넌트들을 모아둔 라이브러리다. <br>  -->
<!-- 		                        아파치 재단에서는 프로젝트에서 유틸리티 클래스와 공통적으로 사용되는 기능 등을 다른 프로젝트에서 재사용 가능하도록  -->
<!-- 		                        컴포넌트 형태로 개발해 Apache Commons Library라는 이름으로 배포하고 있다. <br> -->
<!-- 		                        대부분의 아파치 프로젝트에서는 중복 개발을 피하기 위해 Commons Library를 기본적으로 사용하고 있고,  -->
<!-- 		                        전 세계적으로도 많은 개발자들이 Commons Library를 사용하고 있다. <br> -->
<!-- 		                        그 숫자는 지금도 증가하고 있으며 Commons Library는 구글 라이브러리와 더불어 전 세계적으로 가장 많이 사용되고 있는 라이브러리다.  -->
		            </p>
	                </div>
	                <div class="howTo">
	                    <span class="block_title">다운로드 방법</span>
	                    <div id="description_part2">
	                        <span class="desTitle">How To Copy Code?</span> <br>
	                        <p class="desContent">
	                         ${setting.settingInfo}
<!-- 	                        Press the Copy Button at the bottom<br> -->
<!-- 	                        Or Drag the whole content -->
	                        </p>
	                        <br><br>
	                        <span class="desTitle">How To DownLoad File?</span><br>
	                        <p class="desContent">Press the DownLoad button at the bottom<br>
	                        You can check the generated zip file</p>
	                    </div>
	                </div>
                </div>
<%--                 	<c:if test="${not empty setting.input }"> --%>
                <div class="choice_area">
                		
                		
                		<div class="choice-choice">
                		
                		</div>
<!--                         <div class="choice_title"> -->
<!--                             <span>&lt;선택사항&gt;</span> -->
<!--                         </div> -->
<!--                         <div class="choice_content"> -->
<!--                             <input type="radio" id="choice" name="firstChoice"> -->
<!--                             <label for="choice">true</label> -->
<!--                             <input type="radio" id="choice2" name="firstChoice"> -->
<!--                             <label for="choice">false</label> -->
<!--                         </div> -->
                	
                        
                        <div id="chArea" class="chArea">

<!--                             <div class="choice_title"> -->
<!--                                 <span name="input">&lt;driver class name&gt;</span> -->
<!--                             </div> -->
<!--                             <div class="choice_content" id="classInput"> -->
<!--                                 <input type="text" id="driverClassNameInput" placeholder="Koala.driveClassName"> -->
<!--                             </div> -->
<!--                             <div class="choice_title"> -->
<!--                                 <span name="input">&lt;url&gt;</span> -->
<!--                             </div> -->
<!--                             <div class="choice_content" id="urlInput"> -->
<!--                                 <input type="text" id="driverUrlInput" placeholder="Koala.url"> -->
<!--                             </div> -->
<!--                             <div class="choice_title"> -->
<!--                                 <span name="input">&lt;user name&gt;</span> -->
<!--                             </div> -->
<!--                             <div class="choice_content" id="nameInput"> -->
<!--                                 <input type="text" id="userNameInput" placeholder="Koala.userName"> -->
<!--                             </div> -->
<!--                             <div class="choice_title"> -->
<!--                                 <span name="input">&lt;password&gt;</span> -->
<!--                             </div> -->
<!--                             <div class="choice_content" id="pwdInput"> -->
<!--                                 <input type="text" id="passwordInput" placeholder="Koala.password"> -->
<!--                             </div> -->
    
<!--                             <input type="submit" id="choiceSub" value="submit"> -->
                        </div>
                </div>
<%--                         </c:if> --%>
            </div>
            <hr>
            <div class="block">
                <div class="block_title">
                    <span>${setting.settingTitle}  ${setting.settingVersion }</span>
                    <select name="version" id="versionHistory">
                    	<c:forEach var="option" items="${setting.settingVersion}">
                    			<option value="${setting.settingVersion }" >${setting.settingVersion}</option>
                    	</c:forEach>
<!--                         <option value="commons 2.0.7">commons 2.0.7</option> -->
<!--                         <option value="commons 2.0.7">commons 2.0.7</option> -->
<!--                         <option value="commons 2.0.7">commons 2.0.7</option> -->
<!--                         <option value="commons 2.0.7">commons 2.0.7</option> -->
<!--                         <option value="commons 2.0.7">commons 2.0.7</option> -->
                    </select>
                </div>

                <div class="code_content" id="copy_code">
                <textarea id="codeZoneId" cols="60" rows="14" style="background-color: transparent; border:none; color:white;">${setting.settingCode }</textarea>               
<!--                     <span class="commonStyle">&lt;dependency&gt;</span><br> -->
<!--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;groupId&gt;</span><span>org.springframework</span><span class="commonStyle">&lt;/groupId&gt;</span><br> -->
<!--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;artifacId&gt;</span><span>spring-context</span><span class="commonStyle">&lt;/artifactId&gt;</span><br> -->
<%--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;version&gt;</span><span>${org.springframework-version}</span><span class="commonStyle">&lt;/version&gt;</span><br> --%>
<!--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;exclusions&gt;</span> <br> -->
<!--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="addStyle">&lt;--Exclude Commons Logging in favor of SLF4j --&gt;</span><br> -->
<!--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;exclusion&gt;</span><br> -->
<!--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;groupId&gt;</span><span name="changeClass">Koala.driveClassName</span><span class="commonStyle">&lt;/groupId&gt;</span><br> -->
<!--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;artifactId&gt;</span><span name="changeUrl">Koala.url</span><span class="commonStyle">&lt;/artifactId&gt;</span><br> -->
<!--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;/exclusion&gt;</span><br> -->
<!--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;/exclusions&gt;</span> <br> -->
<!--                     <span class="commonStyle">&lt;/dependency&gt;</span><br> -->
<!--                     <span class="commonStyle">&lt;dependency&gt;</span><br> -->
<!--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;groupId&gt;</span><span name="changeName">Koala.userName</span><span class="commonStyle">&lt;/groupId&gt;</span><br> -->
<%--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;groupId&gt;</span><span name="${changeName}">Koala.userName</span><span class="commonStyle">&lt;/groupId&gt;</span><br> --%>
<!--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;artifacId&gt;</span><span name="changePwd">Koala.password</span><span class="commonStyle">&lt;/artifactId&gt;</span><br> -->
<%--                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="commonStyle">&lt;version&gt;</span><span>${org.springframework-version}</span><span class="commonStyle">&lt;/version&gt;</span><br> --%>
<!--                     <span class="commonStyle">&lt;/dependency&gt;</span><br> -->
                    <div class="lastButton">
                        <button type="button" id="copyBtn" class="copyButton">Copy</button><button type="button" onclick="downloadTextFile();" class="downButton">Download</button>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    
<script>

		if (${empty setting.input}) {//input null일 때 설명 창 바로 보여지게
		    document.querySelector(".desArea").style.display = "block";
		}
	

	$(function(){

		var settingInput = "${setting.input }";
		console.log(settingInput)
		//선택/입력나눠주기
		var choices = settingInput.split("|"); // 선택과 입력을 나눔
		var selections = choices[0].split("/"); // 선택 옵션을 추출
		var inputs = choices[1].split("/"); // 입력 옵션을 추출

		
		// 선택 값들을 담을 배열
	    var selectedValues = [];
		
        //입력값 담을 배열
        var inputValues = [];
        
        //선택 옵션 뿌려주기
        if(selections.length > 0){
        	
       		var str = "";
        	for(var i=0; i<selections.length; i++){
        		
        		//옵션 제목
        		var choiceTitle = selections[i].split("-")[0];
        		str += "<div class=\"choice_title\"><span name=\"choice\">"+choiceTitle+"</span></div>";
        		
        		//옵션 나열된 문자열
        		var option = selections[i].split("-")[1];
        		//옵션 리스트
        		var optionList = option.split(",");
    			
        		
        		str += "<div class=\"choice_content\">";
        		//옵션 리스트 반복문
        		for(var j=0; j<optionList.length; j++){
        			
        			var optionValue = optionList[j];
        			
        			str += "<input type=\"radio\" name=\"choice\" id=\"choice"+j+"\"><label for=\"choice"+j+"\">"+optionValue+"</label>";
        		}
        		str += "</div>";
        		
        	
        	}
        	
        	$(".choice-choice").html(str);
        	
        	//선택값들을 배열에 저장
        	$(".choice-choice input[type='radio']").change(function() {
                var selectedValue = $(this).next("label").text();
                selectedValues.push(selectedValue);
                console.log("1.선택"+selectedValues);
            });
        
	}
    	//inputs 뿌려주기
        if(inputs.length > 0){
        	
       		var str2 = "";
       		
        	for(var i=0; i<inputs.length; i++){
        		
        		str2 += "<div class=\"choice_title\"><span name=\"input\">"+inputs[i]+"</span></div>";
        		str2 += "<div class=\"choice_content\" id=\"classInput\"><input type=\"text\" id=\"driverClassNameInput"+i+"\" placeholder=\""+inputs[i]+"\"></div>";
        		
        	}
        	
        	$(".chArea").html(str2);
        	
        	
        	//입력값 배열에 저장
        	$(".chArea input[type='text']").change(function(){
        		var inputValue = $(this).val();
        		inputValues.push(inputValue);
        		console.log(inputValues);

      	
        	});
        	
    	}
    	
        //입력 부분 생성 및 추가
        var inputArea = document.getElementById("chArea");
    	//submit 버튼 생성
        var submitButton = document.createElement("input");
        submitButton.type = "submit";
        submitButton.id = "choiceSub";
        submitButton.value = "submit";
        inputArea.appendChild(submitButton);
        

		
        //기호 찾아내서 코드 바꾸기
        function updateCodeZone(){
        	//이전 문자열
        	  var codeZoneValue = $("#codeZoneId").val();
        	
        	
        	
        	  //제목 찾아서 ^^ 추가
        	  var preChoice = "^"+$("span[name='choice']").text()+"^";
        	  //사용자가 작성한 값
        	  var selectOption = $("input[type='radio'][name='choice']:checked").next().text()
        	  //처리한 문자열
        	  var result = codeZoneValue.replace(preChoice, selectOption);
        	  
        	  //input제목 찾아서 ^^ 추가
        	  var preChoice2 = "^"+$("span[name='input']").text()+"^";
        	  //사용자 작성한 값
        	  var inputOption = $("input[type='text']")
        	  
        	  
        	  
        	  
        	  //값 넣어주기
        	  $("#codeZoneId").val(result);

        	  //선택 값들을 기호 뒷부분에 뿌려주기
        	  for (var i = 0; i < allValues.length; i++) {

        		//이건 제목값 
        		var changeSpanTitle = "^"+$("span[name='choice']").text()+"^";
        		var	changeInputTitle = "^"+$("span[name='input']").text()+"^";
        		
        		//이게 입력 값  
// 				var changeTag = allValues[i] +"^";
// 				console.log("추가된걸로 나와야 되는데?"+changeTag);
				var result = codeZoneValue.replace(c)
				
        	  }
        	  
        	  


        	 // 수정된 값을 textarea에 넣기
        	  $("#codeZoneId").val(codeZoneValue);
        	  allValues = selectedValues.concat(inputValues);
              console.log("선택 배열: " + selectedValues);
              console.log("합친 배열: " + allValues);
            
        }
        
     	// 선택 값들이 변경될 때마다 코드 업데이트 함수 호출
        $(".choice-choice input[type='radio']").change(updateCodeZone);

        // 입력 값들이 변경될 때마다 코드 업데이트 함수 호출
        $(".chArea input[type='text']").change(updateCodeZone);

        
        // 버튼 클릭 이벤트 처리
        $(document).on("click", "#choiceSub", function() {
            console.log("코드바꾸는 거");
            updateCodeZone(); // 코드 업데이트 함수 호출
        });
        
        
// 		배열 합쳐서 출력하기
		
		var allValues = selectedValues.concat(inputValues);
		console.log("선택 배열 : "+selectedValues);
		console.log("합친 배열 : "+allValues);
	
	});
	

	
	
	
// 	    //입력창 내용 옮기기
		document.getElementById("chArea").addEventListener("click", function (event) {
    		if (event.target.id === "choiceSub") {
        	var desArea = document.querySelector(".desArea");
			var choiceA = document.querySelector(".choice_area");
        	
        console.log("보여줘..");
        desArea.style.display = "block"; // 설명 보여주기
        choiceA.style.display = "none"; // 선택 창 가리기

    	}
		});
	
	 //코드 카피하기
        var codeArea = document.getElementById("codeZoneId");
        
        var textAreaContent = codeArea.value;
		
        document.getElementById("copyBtn").onclick = () => {
            window.navigator.clipboard.writeText(textAreaContent).then(() => {
                // 복사 완료 시 호출
                alert('복사되었습니다!');
            });
        };

        //파일 다운로드하기
        function downloadTextFile(){
        	//태그 내용 추출
        	var codeContent = document.getElementById("copy_code").innerText;
        	
        	//텍스트 파일 만들기
        	var blob = new Blob([codeContent], {type:"text/plain"});
        	
        	//파일 다운로드 링크 생성
        	var downloadLink = document.createElement("a");
        	downloadLink.download = "Koala_Code.txt";//파일 이름
        	downloadLink.href = URL.createObjectURL(blob);
        	
        	//링크 클릭 및 해제
        	downloadLink.click();
        	URL.revokeObjectURL(downloadLink.href);
        
        }

        

</script>


   
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>