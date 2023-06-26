<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorBoard_UpdateForm</title>
</head>
<style>
    /* ===================================================== 영역잡기 */
    div{ box-sizing: border-box;}
    .createSettingForm{width: 1200px; margin: auto; padding-top: 200px; font-size: 17px;}
    
    .createSettingForm>form>div{width: 100%; margin-bottom: 50px;}
    .libraryName-author-area{height: 70px; position: relative;}
    .menual-code-area, .option-area{overflow: auto;}
    .button-area{height: 100px;}

	/* ============================= */
    .libraryName-author-area>div{height: 100%; float: left; position: absolute;}
    .libraryName-area{width: 50%; left: 0;}
    .author-area{width: 30%; right: 0;}
    .libraryName-author-area input{
        width: 65%;
        height: 50%;
        background-color: rgb(30, 30, 30);
        color: rgb(255, 217, 217);
        border-bottom: 2px solid white;
        font-size: 18px;
    }
    /* ============================= */
    .menual-code-area>div{float: left;}
    .menual-area{width: 48%; margin-right: 2%;}
    .code-area{width: 48%; margin-left:  2%;}   
    .menual-area>div{width: 100%; padding: 20px; background-color: white; border: 1px solid gray;}
    .code-area>div{width: 100%; padding: 20px;  background-color: black;}
    .menual-code-area textarea{
        width: 100%;
        height: 600px;
        resize: none;
        outline: none;
        border: none;
    }
    .code-box>textarea{background-color: black; color: white;}
    /* ============================= */
    .option-box{
        width: 100%;
        padding: 20px;
        border: 3px solid rgb(131, 131, 131);
        overflow: auto;
    }
    .option-box>div{
        width: 50%;
        float: left;
        padding: 0 30px;
    }
    .option-box>div>div{width: 100%;}
    .ajax-input>div, .ajax-select>div{width:100%; margin-bottom: 20px;}
    .ajax-input>div>input, .ajax-select>div>input, .select-child-area>div>div>input{
        width: 250px;
        height: 27px;
        border: 1px solid gray;
    }
    .select-child-area{width: 60%; margin-left: 150px; padding: 10px 0;}
    .select-child-area>div>div{margin-bottom:10px;}
    .option-area p{color: rgb(255, 212, 92);}
    .option-area i:hover{cursor: pointer;}
    /* ===================================================== 버튼 */
    .button-area>div{width: 40%; height: 60%; margin: auto; position: relative;}
    .button-area>div>button{width: 45%; height: 100%; margin-top: 50px; position: absolute;}
    #cancelBtn{left: 0;}
    #cancelBtn:hover{background-color:rgb(180, 180, 180); border: 1px solid gray;}
    #submitBtn{right:0; background-color: rgb(224, 130, 130);}
    #submitBtn:hover{background-color: rgb(224, 100, 100); border: 1px solid gray;}
    /* ===================================================== 공통 */
    input{border: none;}
    input:focus{outline: none;}
    span{font-size: 21px; font-weight: 600; color: rgb(238, 238, 238);}
    p{font-size: 18px; font-weight: 600; margin-bottom: 20px;}
</style>


<body>
    <%@include file="../../common/header_copy.jsp"%>
	<script>
		$(function(){
			//input 옵션 생성
			$("#addBtn_input").on("click", function(){
				var str = "<div class=\"input_$\"><input type=\"text\" name=\"\" id=\"\" required><i class=\"fa-solid fa-circle-minus minus_input\" style=\"color: #a0a0a0; margin-left: 10px;\"></i></i></div>";
				$(".ajax-input").append(str);
			});
			//input 옵션 삭제
			$(".input-box").on("click", "i[class*='minus_input']", function(){
				$(this).parent().remove();	
			})
			//select 부모 옵션 생성
			$("#addBtn_select").on("click", function(){
				var str = "<div class=\"select_$\">";
				    str+= "<i class=\"fa-solid fa-paw\" style=\"color: #ffce47;\"></i>";
				    str+= "&nbsp;<input type=\"text\" name=\"\" id=\"\" required>";
				    str+= "<i class=\"fa-solid fa-circle-minus minus_select\" style=\"color: #a0a0a0; margin-left: 10px;\"></i></i>";
				    str+= "<div class=\"select-child-area\">";
				    str+= "<span class=\"hide\" style=\"font-size: 15px; color: #8aa2be;\">[옵션 항목]&nbsp;<i class=\"fa-solid fa-caret-up fa-lg\"></i></span><br>";
				    str+= "<div class=\"ajax-select-child\">";
				    str+= "<div class=\"select_child_$\">";
				    str+= "<input type=\"text\" name=\"\" id=\"\" required>";
				    str+= "<i class=\"fa-solid fa-circle-minus minus_select_child\" style=\"color: #a0a0a0; margin-left: 10px;\"></i></i></div></div>";
				    str+= "<div class=\"addBtn\">";
				    str+= "<i class=\"fa-solid fa-circle-plus addBtn_select_child\" style=\"color: #8aa2be; margin-left: 115px;\"></i></div></div></div>";
				$(".ajax-select").append(str);
			});
			//select 부모 옵션 삭제
			$(".select-box").on("click", "i[class$='minus_select']", function(){
				$(this).parent().remove();	
			})
			//select 자식 옵션 생성
			$(".select-box").on("click", "i[class*='addBtn_select_child']", function(){
				var str = "<div class=\"select_child_$\"><input type=\"text\" name=\"\" id=\"\" required><i class=\"fa-solid fa-circle-minus minus_select_child\" style=\"color: #a0a0a0; margin-left: 10px;\"></i></i></div>"
				$(this).parent().prev().append(str);
			});
			//select 자식 옵션 삭제
			$(".select-box").on("click", "i[class*='minus_select_child']", function(){
				
				if($(this).parent().siblings().length != 0){
					$(this).parent().remove();	
				}else{ //옵션이 하나도 없을 시
					alert("옵션항목은 최소 한개 이상 존재해야 합니다.");
				}
			})
			//select 자식 옵션 접기/풀기
			$(".select-box").on("click", "span[class*='hide']", function(){
				if(($(this).html()).includes('up')){
					$(this).siblings('div').hide();
					$(this).html("[옵션 항목]&nbsp;<i class=\"fa-solid fa-caret-down fa-lg\"></i>");
				}else{
					$(this).siblings('div').show();
					$(this).html("[옵션 항목]&nbsp;<i class=\"fa-solid fa-caret-up fa-lg\"></i>");
				}
			})
			
		})
	</script>
	
    <div class="createSettingForm">
        <form action="" method="post">
        
            <!--이름/작성자 영역-->
            <div class="libraryName-author-area">
                <div class="libraryName-area">
                    <span class="ii">Library Name : &nbsp;</span>
                    <input type="text" name="" id="" placeholder="Enter the Library Title Name..." required>
                </div>
                <div class="author-area">
                    <span class="ii">Author : &nbsp;</span>
                    <input type="text" name="" id="" placeholder="ADMIN" required>
                </div>
            </div>

            <!--설명서/코드 영역-->
            <div class="menual-code-area">
                <div class="menual-area">
                    <p><span class="ii" style="background: linear-gradient(to top, rgba(253, 172, 172, 0.7) 50%, transparent 40%);">&nbsp;<i class="fa-solid fa-star-of-life fa-xs"></i> Menual&nbsp;</span></p>
                    <div class="menual-box">
                        <textarea name="" id="" required></textarea>
                    </div>
                </div>
                <div class="code-area">
                    <p><span class="ii" style="background: linear-gradient(to top, rgba(135, 139, 186, 0.7) 50%, transparent 40%);">&nbsp;<i class="fa-solid fa-star-of-life fa-xs"></i> Code&nbsp;</span></p>
                    <div class="code-box">
                        <textarea name="" id="" required></textarea>
                    </div>
                </div>
            </div>
            
            <!--옵션선택 영역-->
            <div class="option-area">
                <p><span class="ii" style="background: linear-gradient(to top, rgba(234, 255, 118, 0.418) 50%, transparent 40%);">&nbsp;<i class="fa-solid fa-star-of-life fa-xs"></i> Select-box&nbsp;</span></p>
                <div class="option-box">
                    <div class="input-box">
                        <p>[입력사항]</p>
                        <div class="ajax-input"> <!--반복될 영역-->
                        </div>
                        <div class="addBtn">
                            <i id="addBtn_input" class="fa-solid fa-circle-plus fa-lg" style="color: #ffce47; margin-left: 120px;"></i>
                        </div>
                    </div>
                    <div class="select-box">
                        <p>[선택사항]</p>
                        <div class="ajax-select"> <!--반복될 영역-->
                        </div>
                        <div class="addBtn">
                            <i id="addBtn_select" class="fa-solid fa-circle-plus fa-lg" style="color: #ffce47; margin-left: 140px;"></i>
                        </div>
                    </div>
                </div>
            </div>
            
            <!--버튼 영역-->
            <div class="button-area">
                <div>
                    <button id="cancelBtn">cancel</button>
                    <button id="submitBtn">submit</button>
                </div>
            </div>

        </form>
    </div>
    <%@include file="../../common/footer.jsp"%>
</body>
</html>