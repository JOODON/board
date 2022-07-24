let curPos=0; //현재 보여주는 이미지의 인덱스 번호
let positionValue= 0;//위치이동
const img_width=1280;

const nextbt=document.querySelector(`.next`);
const prevbt=document.querySelector(`.prev`);
const img=document.querySelector(`.imags`);

function next(){
    if(curPos<2){
        prevbt.removeAttribute(`disabled`)
        positionValue -=img_width;
        img.style.transform=`translateX(${positionValue}px)`
        curPos+=1;
    }
    if (curPos===2){
        nextbt.setAttribute(`disabled`,true);
    }
}

function prev(){
    if(curPos>0){
        nextbt.removeAttribute(`disabled`)
        positionValue +=img_width;
        img.style.transform=`translateX(${positionValue}px)`
        curPos-=1;
    }
    if (curPos===0){
        prevbt.setAttribute(`disabled`,true);
    }
}

function init(){
    prevbt.setAttribute(`disabled`,true);
    nextbt.addEventListener("click",next);
    prevbt.addEventListener("click",prev);
}

init();