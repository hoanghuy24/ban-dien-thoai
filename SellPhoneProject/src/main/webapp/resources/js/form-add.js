var button = document.getElementById("button");
var count = 0;
    var file1 = document.getElementById("file-1");
    var file2 = document.getElementById("file-2");
    var file3 = document.getElementById("file-3");
    var file4 = document.getElementById("file-4");
    var fileDel1 = document.getElementById("file-del-1");
    var fileDel2 = document.getElementById("file-del-2");
    var fileDel3 = document.getElementById("file-del-3");
    var fileDel4 = document.getElementById("file-del-4");
button.onclick = function(){
    ++count;
    if(count == 1){
        file1.style = "display: block";
        fileDel1.style = "display:block"
    }
    if(count == 2){
        file1.style = "display: block";
        file2.style = "display: block";
        fileDel1.style = "display:block";
        fileDel2.style = "display:block";
    }
    if(count == 3){
        file1.style = "display: block";
        file2.style = "display: block";
        file3.style = "display: block";
        fileDel1.style = "display:block";
        fileDel2.style = "display:block";
        fileDel3.style = "display:block";
    }
    if(count == 4){
        file1.style = "display: block";
        file2.style = "display: block";
        file3.style = "display: block";
        file4.style = "display: block";
        fileDel1.style = "display:block";
        fileDel2.style = "display:block";
        fileDel3.style = "display:block";
        fileDel4.style = "display:block";
    }

    if(count == 5){
        count = 4;
        alert("you can add 4 images for this product")
    }
    console.log(count);
    console.log(urlImg.value);
    return false;

}

fileDel1.onclick = function(){
    file1.style = "display: none";
    fileDel1.style = "display:none";
    file1.value = "";
    count --;
    return false;
}

fileDel2.onclick = function(){
    file2.style = "display: none";
    fileDel2.style = "display:none";
    file2.value = "";
    count --;
    return false;
}

fileDel3.onclick = function(){
    file3.style = "display: none";
    fileDel3.style = "display:none";
    file3.value = "";
    console.log(file3.value);
    count --;
    return false;
}

fileDel4.onclick = function(){
    file4.style = "display: none";
    fileDel4.style = "display:none";
    file4.value ="";
    count --;
    return false;
}

var urlImg = document.getElementById("file-1");
console.log(urlImg.value);