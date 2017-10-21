/**
 * 입력화면에서 입력내용을 체크해줄 자바스크립트 파일 
 */

function writeSave() {
	if(document.writeform.writer.value==""){
		alert("작성자를 입력하시오.");
		document.writeform.writer.focus();
		return false;
	}
	if(document.writeform.subject.value==""){
		alert("제목을 입력하세요.");
		docoment.writeform.subject.focus();
		return false;
	}
	if(document.writeform.content.value==""){
		alert("내용을 입력하세요.");
		document.writeform.content.focus();
		return false;
	}
	
	if(document.writeform.pass.value==""){
		alert("비밀번호를 입력하세요.");
		document.writeform.pass.focus();
		return false;
	}
	
}