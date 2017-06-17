function messageshow(){
        var comment=document.getElementById('comment_reply');
        if(comment.style.display==""||comment.style.display=="none"){
            comment.style.display="block";
        }else{
            comment.style.display="none";
        }
    }