
function openLeaves(){
  var x=document.getElementById("leavesdiv");
  x.style.display="block";
  var y=document.getElementById("applydiv");
  y.style.display="none";
  var z=document.getElementById("remainingdiv");
  z.style.display="none";
  var w=document.getElementById("salarydiv");
  w.style.display="none";
}

function openApply(){
  var x=document.getElementById("leavesdiv");
  x.style.display="none";
  var y=document.getElementById("applydiv");
  y.style.display="block";
  var z=document.getElementById("remainingdiv");
  z.style.display="none";
  var w=document.getElementById("salarydiv");
  w.style.display="none";
}

function openRemaining(){
  var x=document.getElementById("leavesdiv");
  x.style.display="none";
  var y=document.getElementById("applydiv");
  y.style.display="none";
  var z=document.getElementById("remainingdiv");
  z.style.display="block";
  var w=document.getElementById("salarydiv");
  w.style.display="none";
}

function openSalary(){
  var x=document.getElementById("leavesdiv");
  x.style.display="none";
  var y=document.getElementById("applydiv");
  y.style.display="none";
  var z=document.getElementById("remainingdiv");
  z.style.display="none";
  var w=document.getElementById("salarydiv");
  w.style.display="block";
}