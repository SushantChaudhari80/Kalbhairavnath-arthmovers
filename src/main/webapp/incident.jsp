<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Incident Management</title>
	<link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"  rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
		.p_row{
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    margin-left: 80px;
		    margin-right: 80px;
		    flex-direction: row;
		}
		#header{
		    height: 30px;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    border: 1px solid black;
		    
		}
		.i_get{height: 20px;
		    width: 200px;
		    border: 1px solid black;
		    text-align: center;
		    align-items: center;
		}
		.cent{
		    align-items: center;
		    text-align: center;
		    display: flex;
		    flex-direction: column;
		    justify-content: center;
		}
		.p2_row{
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    
		    flex-direction: row;
		    padding-left: 50px;
		    padding-right: 50px;
		}
		.squr{
		    border: 2px solid black;
		}
		.ind{
		   margin:10px;
		}
		.logo{
		    margin-right: 10px;
		    border: 2px solid black;}
		.mar{
		    margin-left: 10px;
		    border: 1px solid black;
		}  
		.dis{border:1px solid black;
		    display:none;
		    width:100%
		}
		button{
		    border: 0px ;
		    height:25px;
		   
		}
		button:hover{
		    background:linear-gradient(to right, rgba(237, 251, 161, 0.952), rgba(59, 239, 252, 0.938));
		    border: 2px solid black ;
		    color: red;
		}
		textarea:hover,input:hover{
		    border: 2px solid black;
		}
		#nikal{ display: none;}
    </style>
</head>
<body style="font-family:'Times New Roman', Times, serif ;">    
    <div  id="header">
        <div class="ind">
            <button><i class="ri-arrow-left-s-line" onclick="back()" ></i></button>
            <button><i class="ri-menu-line"></i></button>
            <span>incident-INC0086533</span>
           
        </div>
        <div class="ind">
            <button><i class="ri-sun-fill" onclick="mode()"></i></button>
            <button><i class="ri-attachment-2"></i> </button>
             <button> <i class="ri-more-fill"  ></i></button>
            <button  class="mar" >submit</button>
            <button  class="mar">resolve incident</button>
            <button  class="mar">save</button>
        </div>
    </div>
    <div class="p_row">
        <div class="ind">
            <span style="padding-left: 69px;">number</span>
            <input type="text" placeholder="INC0086533" class="i_get"> 
        </div>
        <div style="padding-right: 38px;">    
            <span>state</span>
            <select class="i_get" >
                <option>maharastra</option>
                <option>gujrat</option>
                <option>panjab</option>
                <option>rajasthan</option>
                <option>bihar</option>
            </select>
        </div>   
    </div>
        <div class="p_row">
            <div class="ind">
                <i class="ri-asterisk"></i>
                <span  style="padding-left: 16px;">requested by  </span>
                <input type="text" placeholder="mallory ann walker" class="i_get">
                <button><i class="ri-search-line" ></i></button>
                <button><i class="ri-alert-line"></i></button>
                <button><i class="ri-information-2-line" ></i></button>
            </div>
            <div style="padding-right: 5px;">
                <span>time spent  </span>
                <input type="time" value="12:52:52" class="i_get">
                <button><i class="ri-square-fill"></i></button>
            </div>
        </div> 
        <div class="p_row">
            <div class="ind">
                <i class="ri-asterisk"></i>
                <span  style="padding-left: 14px;">requested for  </span>
                <input type="text" placeholder="mallory ann walker" class="i_get">
                 <button><i class="ri-search-line" ></i></button>
                <button><i class="ri-information-2-line"></i></button>
            </div>
            <div style="padding-right: 35px;">
                <span>Opened  </span>
                <input type="date" class="i_get">
            </div>
        </div>
        <div class="p_row">
            <div class="ind">
                <span  style="padding-left: 61px;">Location  </span>
                <input type="text" placeholder="FAC 227A" class="i_get">
                <button><i class="ri-search-line" ></i></button>
                <button><i class="ri-information-2-line" ></i></button>
            </div>
            <div>
                <span>Opened by </span>
                <input type="text" placeholder="mallory ann walker" class="i_get">
                <button><i class="ri-information-2-line" ></i></button>
            </div>
        </div>
        <div class="p_row">
            <div class="ind">
                <div style="display: flex;">
                    <span>alternate phone n.o  </span>
                    <div style="display: flex;flex-direction: column;">
                        <select>
                            <option>other</option>
                            <option>unknown</option>
                        </select>
                        <input type="number" class="i_get">
                    </div> 
                </div>     
                <div class="ind">
                    <span  style="padding-left: 34px;">status_calls</span>
                    <input type="numbet" class="i_get">
                </div>
            </div>
             <div style="padding-right: 20px;">
                <lebal style="padding-left: 69px;">contact_method  </lebal>
                <select class="i_get">
                    <option>phone</option>
                    <option>e-mail</option>
                    <option>social media</option>
                </select>
                <div class="ind" >
                    <label >spacial usear contact info  </label>
                    <textarea style="width:200px"></textarea>
                </div>   
            </div>   
        </div>
        <div class="p_row">
            <div class="ind">
                <i class="ri-asterisk" style="color: red;"></i>
                <span>short_description</span>
                <input type="text" style="width: 830px;height: 20px;">
                <button><i class="ri-lightbulb-line" ></i></button>
            </div>    
        </div>
        <div class="cent" style="margin-top: 20px;">
            <button class="mar" onmouseover="result()">releted serch result :</button>
            <div id="nikal">
                <h3 >No result to display </h3>
                <button class="mar" onclick="ok()">ok</button>
            </div>    
        </div>

        <div class="p_row">
            <div  style="margin-top: 30px;margin-bottom: 20px;">
                <span class="ind">reassingement count</span>
                <input type="text" style="width: 870px; height: 20px;">
            </div>
        </div>        
  <div >
    <button id="showhide">Notes</button>
    <button id="showhide1">Incident Classification</button>
    <button id="showhide3">releted recordes</button>
    <button id="showhide2">closer information</button>     
  </div>
<div class="dis" id="main" style="display:block">       
       <div class="p2_row">
                <div class="ind" style="padding-left: 60px;">
                        <span style="padding-right: 20px;">watch list</span>
                        <button><i class="ri-lock-line" ></i></button>
                        <button><i class="ri-user-add-line"></i></button>
                </div>
                <div style="padding-right: 100px;">
                        <span class="ind" style="padding-right: 10px;">work note list </span>
                        <button><i class="ri-lock-line" ></i></button>
                        <button><i class="ri-user-add-line" ></i></button>
                </div>
        </div>   
        <div class="p2_row">
            <div class="ind">
                <span style="padding-right: 20px;">Disable requested by notification </span>
                <input type="checkbox" >
            </div>
            <div style="padding-right: 120px;">
                <span style="padding-right: 20px;">Disable requested for notification </span>
                <input type="checkbox" >
            </div>    
        </div> 
        <div class="p2_row">
            <div class="cent">
                <span>additioal comments </span>
                <span>(coustomer visibility)</span>
            </div>
            <div>
                <textarea style="width: 920px;height: 40px;" class="ind"></textarea>
            </div>
        </div> 
        <div class="p2_row">
            <div class="cent">
                <span style="padding-left: 70px;"> work note </span>
            </div>
            <div>
                <textarea style="width: 920px;height: 80px;background-color: rgb(232, 252, 144);" class="ind"></textarea>
            </div>
        </div> 
</div> 
<div class="dis" id="main2" >
  <h1>hii</h1>
  <span>here is incident classification</span>
  <h1>create anything for display</h1>
</div>
<div class="dis" id="main3" >
    <h1>hii</h1>
    <span>here is closer info</span>
    <h1>create anything for display in closer info</h1>
  </div>  
<div class="dis" id="main4">
    <h1>hii</h1>
    <span>here is releted recordes</span>
    <h1>create anything for display in releted recordes</h1>

</div>        
  <script>
    var content = document.getElementById('main');
    var content2 = document.getElementById('main2');
    var content3 = document.getElementById('main3');
    var content4 = document.getElementById('main4')
    
    document.getElementById('showhide').onclick= function() {
        if (content.style.display =='none') {
            content.style.display = 'block';
            content2.style.display = 'none';
            content3.style.display = 'none';
            content4.style.display = 'none';
        } else {
            content.style.display = 'none';
        }
    };

    document.getElementById('showhide1').onclick = function() {
        if (content2.style.display =='none') {
            content2.style.display = 'block';
            content.style.display='none';
            content3.style.display = 'none';
            content4.style.display = 'none';
        } else {
            content2.style.display = 'none';
        }
    };

    document.getElementById('showhide2').onclick = function() {
        if (content3.style.display == 'none') {
            content3.style.display = 'block';
            content.style.display = 'none';
            content2.style.display = 'none';
            content4.style.display = 'none';
        } else {
            content3.style.display = 'none';
        }
    };
    document.getElementById('showhide3').onclick = function(){
        if (content4.style.display == 'none') {
            content4.style.display = 'block';
            content.style.display = 'none';
            content2.style.display = 'none';
        } else {
            content4.style.display = 'none';
        }
    };
    function back(){
        alert('are you sure want to exit !');
    };
    var mod=document.querySelector('body');
    var display="light";
    function mode(){
        if(display=="light"){
            display="dark";
            mod.style.backgroundColor=('black');
            mod.style.color=('white');
        }
        else{
            display="light";
            mod.style.backgroundColor=('white');
            mod.style.color=('black');
        };

    };
    function result(){
        document.getElementById('nikal').style.display='block';
    };
    function ok(){
        document.getElementById('nikal').style.display='none';
    }
</script>
</body>
  
</html>
