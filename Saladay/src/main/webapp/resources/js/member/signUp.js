// 비밀번호 CapsLock알람
function checkCapsLock(e) {

    var myKeyCode=0;
    var myShiftKey=false;
    var myMsg='<Caps Lock>이 켜져있습니다.\n\nCaps Lock이 켜져있으면 암호를 올바르게 입력하지 못할 수 있습니다.\n암호를 입력하기 전 확인해주세요.';

    // Internet Explorer 4+
    if ( document ) {
        myKeyCode=e.keyCode;
        myShiftKey=e.shiftKey;

    // Netscape 4
    } else if ( document.layers ) {
        myKeyCode=e.which;
        myShiftKey=( myKeyCode == 16 ) ? true : false;

    // Netscape 6
    } else if ( document.getElementById ) {
        myKeyCode=e.which;
        myShiftKey=( myKeyCode == 16 ) ? true : false;
    }

    
    if ( ( myKeyCode >= 65 && myKeyCode <= 90 ) && !myShiftKey ) {
        alert( myMsg );
        return false;

    
    } else if ( ( myKeyCode >= 97 && myKeyCode <= 122 ) && myShiftKey ) {
        alert( myMsg );
        return false;
    }
}