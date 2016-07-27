/**
 * - 숫자 유효성 검사<br/>
 * - 사용법 : <input type="text" placeholder="8자리 입력(예19870321)" maxlength="8" onkeyup="GJF_Only_Number(this);" onkeypress="GJF_Only_Number(this);"><br/>
 */
function GJF_Only_Number(obj)
{
	obj.value = obj.value.replace(/[a-zA-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣\`\~\!\-\#\$\%\^\&\*\(\)\=\+\\\{\}\[\]\'\"\;\:\<\,\>\?\/\s]/g, '' );
	return true;
}

/**
 * 이메일 유효성 검사<br/>
 * 사용법 : <input type="email" placeholder="email@yeamin.com" onkeyup="GJF_Only_Email(this);" onkeypress="GJF_Only_Email(this);"><br/>
 */
function GJF_Only_Email(obj)
{
	obj.value = obj.value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣\`\~\!\#\$\%\^\&\*\(\)\=\+\\\{\}\[\]\'\"\;\:\<\,\>\?\/\s]/g, '' );
	return true;
}

$(document.body).ready(function () {
	$("label[for]").each(function(index, element) {
		$(element).children().first().prepend("<span style='color: red;'>* </span>");
	});
});

function emptyRequiredValueCheck(checkAreaId) {
	var isEmptyRequiredValue = false;
	var selector = "";
	
	if(checkAreaId == undefined) {
		selector = "label[for]";
	} else {
		if($("#" + checkAreaId).length == 1) {
			selector = "#" + checkAreaId + " label[for]";
		} else {
			console.log(checkAreaId + "를 id로 사용하는 태그가 없거나 하나 이상입니다.");
			return false;
		}
	}
	
	$(selector).each(function(index, element) {
		var requiredLabel= $(element).children().first().text();
		var requiredId = $(this).attr("for");
		var requiredVaule = $("#" + requiredId).val();
		
		if(requiredVaule != undefined) {
			if(requiredVaule === "") {
				console.log(requiredId + "를 id로 사용한 태그의 값이 비워져 있습니다.");
				dialog.push({
        			top: "350",
        			title: "필수 항목 미입력",
        			body: "<b>경고</b> - \"" + requiredLabel.replace("* ", "") + "\"을/를 입력하세요.",
        			type: "Caution",
        			onConfirm: function() {
        				$("#" + requiredId).focus();
    				}
        		});
				
				isEmptyRequiredValue = true;
				return false;
			}
		} else {
			console.log("label 태그의 for 속성에서 추출한 " + requiredId + "를 id로 사용한 태그가 없습니다.");
		}
	});
	
	return isEmptyRequiredValue;
}