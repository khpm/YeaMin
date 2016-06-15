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