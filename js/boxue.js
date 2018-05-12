
function getusername() {
	 // alert(typeof(sessionStorage.getItem('username')));
	 var user=Number(sessionStorage.getItem('username'));
	 var username=sessionStorage.getItem('username');
	 
	  if (username==null) {
            
	 }else{
	 	document.getElementById('login').innerHTML=username;
	 	document.getElementById('login').href='#';
	 	
	  }


	}

function show(a) //负责切换书籍介绍和评价的界面（默认两个都是隐藏起来的）
{
     if (a) {
       document.getElementById("pinglun").style.display="block";
       document.getElementById("bookshow").style.display="none";
     }else{
       document.getElementById("bookshow").style.display="block";
       document.getElementById("pinglun").style.display="none";
     }
	
}
function add(a) {
	var num=parseInt(document.getElementById("booknum").value);
    num=num+a;
   if(num<0)
   {
      num=0;
   }
   document.getElementById("booknum").value=num;
}
function searchbook() {
	// body...
	var input=document.getElementById("bookname").value;
	// alert(input)
	if(input=="人间知味")
	{
		window.location.href="item-01.html";
	}else if (input=="蜂鸟摄影学院") 
	        {
		      window.location.href="item-02.html";
	        }else if (input=="阿米巴经营") 
	             {
	 	         window.location.href="item-03.html"
	             }else if (input=="动物农场") {
	             	window.location.href="item-04.html"
	             }else if (input=="房思琪的初恋乐园") 
	               {
	             	window.location.href="item-05.html"
	               }else if (input=="自控力") {
	               	window.location.href="item-06.html"
	               }else
	               alert("未找到书籍《"+input+"》请从新输入书名！！");

}
function addbooktocar() {
	// body...
	var buynum=document.getElementById("booknum").value;
	document.getElementById("shopcarnum").innerHTML=buynum;
}
function buybook(a) {
	var buynum=Number(document.getElementById('booknum').value);
	var price=Number(document.getElementById('price'+a).innerHTML).toFixed(2);//Number将返回的string转化成number类型，toFixed(2)是保留小数点后两位
	 var pay=(buynum*price).toFixed(2);
	 // alert(pay);
	var pic;
	switch(a)
	{
		case 1:
		pic="images/banner/人间知味.jpg";
		break;
		case 2:
		pic="images/item/单反摄影.jpg";
		break;
		case 3:
		pic="images/item/阿米巴经营.jpg";
		break;
		case 4:
		pic="images/banner/动物农场.jpg";
		break;
		case 5:
		pic="images/item/房思琪的初恋乐园.jpg";
		break;
		case 6:
		pic="images/item/自控力.jpg";
		break;
	}
	
	sessionStorage.setItem('buybooknum',buynum);
	sessionStorage.setItem('bookprice',price);
	sessionStorage.setItem('paynum',pay);
	sessionStorage.setItem('imgurl',pic);
	window.location.href="shopCar.html";
    
	
}

function shopCarload() {
	document.getElementById('price').innerHTML=sessionStorage.getItem('bookprice');
    document.getElementById('num').innerHTML=sessionStorage.getItem('buybooknum');
    document.getElementById('sum').innerHTML=sessionStorage.getItem('paynum');
    document.getElementById('bookpic').src=sessionStorage.getItem('imgurl');
    document.getElementById('pay').innerHTML=sessionStorage.getItem('paynum');
    var user=Number(sessionStorage.getItem('username'));
	 var username=sessionStorage.getItem('username');
	 
	  if (username==null) {
            
	 }else{
	 	document.getElementById('login').innerHTML=username;
	 	document.getElementById('login').href='#';
	 	
	  }
}
function confirmpay() {
	alert('付款成功！');
	window.location.href="index.html";
}