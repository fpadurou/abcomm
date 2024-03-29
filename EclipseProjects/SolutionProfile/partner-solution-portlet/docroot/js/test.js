/*
  -------------------------------------------------------------------------
		      JavaScript Form Validator (gen_validatorv31.js)
              Version 3.1.1
	Copyright (C) 2003-2008 JavaScript-Coder.com. All rights reserved.
	You can freely use this script in your Web pages.
	You may adapt this script for your own needs, provided these opening credit
    lines are kept intact.
		
	The Form validation script is distributed free from JavaScript-Coder.com
	For updates, please visit:
	http://www.javascript-coder.com/html-form/javascript-form-validation.phtml
	
	Questions & comments please send to form.val at javascript-coder.com
  -------------------------------------------------------------------------  
*/
<!-- Begin
function isValidDate(dateStr) {
// Date validation function courtesty of 
// Sandeep V. Tamhankar (stamhankar@hotmail.com) -->

// Checks for the following valid date formats:
// MM/DD/YY   MM/DD/YYYY   MM-DD-YY   MM-DD-YYYY

var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/; // requires 4 digit year

var matchArray = dateStr.match(datePat); // is the format ok?
if (matchArray == null) {
alert(dateStr + " Date is not in a valid format.")
return false;
}
month = matchArray[1]; // parse date into variables
day = matchArray[3];
year = matchArray[4];
if (month < 1 || month > 12) { // check month range
alert("Month must be between 1 and 12.");
return false;
}
if (day < 1 || day > 31) {
alert("Day must be between 1 and 31.");
return false;
}
if ((month==4 || month==6 || month==9 || month==11) && day==31) {
alert("Month "+month+" doesn't have 31 days!")
return false;
}
if (month == 2) { // check for february 29th
var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
if (day>29 || (day==29 && !isleap)) {
alert("February " + year + " doesn't have " + day + " days!");
return false;
   }
}
return true;
}

function isValidTime(timeStr) {
// Time validation function courtesty of 
// Sandeep V. Tamhankar (stamhankar@hotmail.com) -->

// Checks if time is in HH:MM:SS AM/PM format.
// The seconds and AM/PM are optional.

var timePat = /^(\d{1,2}):(\d{2})(:(\d{2}))?(\s?(AM|am|PM|pm))?$/;

var matchArray = timeStr.match(timePat);
if (matchArray == null) {
alert("Time is not in a valid format.");
return false;
}
hour = matchArray[1];
minute = matchArray[2];
second = matchArray[4];
ampm = matchArray[6];

if (second=="") { second = null; }
if (ampm=="") { ampm = null }

if (hour < 0  || hour > 23) {
alert("Hour must be between 1 and 12. (or 0 and 23 for military time)");
return false;
}
if (hour <= 12 && ampm == null) {
if (confirm("Please indicate which time format you are using.  OK = Standard Time, CANCEL = Military Time")) {
alert("You must specify AM or PM.");
return false;
   }
}
if  (hour > 12 && ampm != null) {
alert("You can't specify AM or PM for military time.");
return false;
}
if (minute < 0 || minute > 59) {
alert ("Minute must be between 0 and 59.");
return false;
}
if (second != null && (second < 0 || second > 59)) {
alert ("Second must be between 0 and 59.");
return false;
}
return true;
}



function confirmDelete(delUrl) {
  if (confirm("Are you sure you want to delete")) {
    document.location = delUrl;
  }
}

function Validator(frmname)
{
  this.formobj=document.forms[frmname];
	if(!this.formobj)
	{
	  alert("Error: couldnot get Form object "+frmname);
		return;
	}
	if(this.formobj.onsubmit)
	{
	 this.formobj.old_onsubmit = this.formobj.onsubmit;
	 this.formobj.onsubmit=null;
	}
	else
	{
	 this.formobj.old_onsubmit = null;
	}
	this.formobj._sfm_form_name=frmname;
	this.formobj.onsubmit=form_submit_handler;
	this.addValidation = add_validation;
	this.setAddnlValidationFunction=set_addnl_vfunction;
	this.clearAllValidations = clear_all_validations;
    this.disable_validations = false;//new
    document.error_disp_handler = new sfm_ErrorDisplayHandler();
    this.EnableOnPageErrorDisplay=validator_enable_OPED;
	this.EnableOnPageErrorDisplaySingleBox=validator_enable_OPED_SB;
    this.show_errors_together=true;
    this.EnableMsgsTogether=sfm_enable_show_msgs_together;
}
function set_addnl_vfunction(functionname)
{
  this.formobj.addnlvalidation = functionname;
}
function sfm_enable_show_msgs_together()
{
    this.show_errors_together=true;
    this.formobj.show_errors_together=true;
}
function clear_all_validations()
{
	for(var itr=0;itr < this.formobj.elements.length;itr++)
	{
		this.formobj.elements[itr].validationset = null;
	}
}
function form_submit_handler()
{
   var bRet = true;
    document.error_disp_handler.clear_msgs();
	for(var itr=0;itr < this.elements.length;itr++)
	{
		if(this.elements[itr].validationset &&
	   !this.elements[itr].validationset.validate())
		{
		  bRet = false;
		}
        if(!bRet && !this.show_errors_together)
        {
          break;
        }
	}
    if(!bRet)
    {
      document.error_disp_handler.FinalShowMsg();
      return false;
    }

	if(this.addnlvalidation)
	{
	  str =" var ret = "+this.addnlvalidation+"()";
	  eval(str);
    if(!ret) return ret;
	}

	 if (confirm("Are you sure you want to save changes and exit?")) 
    	{return true;}
    else
    	{return false;}
	
	return true;
}
function add_validation(itemname,descriptor,errstr)
{
	var condition = null;
	if(arguments.length > 3)
	{
	 condition = arguments[3]; 
	}
  if(!this.formobj)
	{
		alert("Error: The form object is not set properly");
		return;
	}//if
	var itemobj = this.formobj[itemname];
    if(itemobj.length && isNaN(itemobj.selectedIndex) )
    //for radio button; don't do for 'select' item
	{
		itemobj = itemobj[0];
	}	
  if(!itemobj)
	{
		alert("Error: Couldnot get the input object named: "+itemname);
		return;
	}
	if(!itemobj.validationset)
	{
		itemobj.validationset = new ValidationSet(itemobj,this.show_errors_together);
	}
	itemobj.validationset.add(descriptor,errstr,condition);
    itemobj.validatorobj=this;
}
function validator_enable_OPED()
{
    document.error_disp_handler.EnableOnPageDisplay(false);
}

function validator_enable_OPED_SB()
{
	document.error_disp_handler.EnableOnPageDisplay(true);
}
function sfm_ErrorDisplayHandler()
{
  this.msgdisplay = new AlertMsgDisplayer();
  this.EnableOnPageDisplay= edh_EnableOnPageDisplay;
  this.ShowMsg=edh_ShowMsg;
  this.FinalShowMsg=edh_FinalShowMsg;
  this.all_msgs=new Array();
  this.clear_msgs=edh_clear_msgs;
}
function edh_clear_msgs()
{
    this.msgdisplay.clearmsg(this.all_msgs);
    this.all_msgs = new Array();
}
function edh_FinalShowMsg()
{
    this.msgdisplay.showmsg(this.all_msgs);
}
function edh_EnableOnPageDisplay(single_box)
{
	if(true == single_box)
	{
		this.msgdisplay = new SingleBoxErrorDisplay();
	}
	else
	{
		this.msgdisplay = new DivMsgDisplayer();		
	}
}
function edh_ShowMsg(msg,input_element)
{
	
   var objmsg = new Array();
   objmsg["input_element"] = input_element;
   objmsg["msg"] =  msg;
   this.all_msgs.push(objmsg);
}
function AlertMsgDisplayer()
{
  this.showmsg = alert_showmsg;
  this.clearmsg=alert_clearmsg;
}
function alert_clearmsg(msgs)
{

}
function alert_showmsg(msgs)
{
    var whole_msg="";
    var first_elmnt=null;
    for(var m in msgs)
    {
        if(null == first_elmnt)
        {
            first_elmnt = msgs[m]["input_element"];
        }
        whole_msg += msgs[m]["msg"] + "\n";
    }
	
    alert(whole_msg);

    if(null != first_elmnt)
    {
        first_elmnt.focus();
    }
}
function sfm_show_error_msg(msg,input_elmt)
{
    document.error_disp_handler.ShowMsg(msg,input_elmt);
}
function SingleBoxErrorDisplay()
{
 this.showmsg=sb_div_showmsg;
 this.clearmsg=sb_div_clearmsg;
}

function sb_div_clearmsg(msgs)
{
	var divname = form_error_div_name(msgs);
	show_div_msg(divname,"");
}

function sb_div_showmsg(msgs)
{
	var whole_msg="<ul>\n";
	for(var m in msgs)
    {
        whole_msg += "<li>" + msgs[m]["msg"] + "</li>\n";
    }
	whole_msg += "</ul>";
	var divname = form_error_div_name(msgs);
	show_div_msg(divname,whole_msg);
}
function form_error_div_name(msgs)
{
	var input_element= null;

	for(var m in msgs)
	{
	 input_element = msgs[m]["input_element"];
	 if(input_element){break;}
	}

	var divname ="";
	if(input_element)
	{
	 divname = input_element.form._sfm_form_name + "_errorloc";
	}

	return divname;
}
function DivMsgDisplayer()
{
 this.showmsg=div_showmsg;
 this.clearmsg=div_clearmsg;
}
function div_clearmsg(msgs)
{
    for(var m in msgs)
    {
        var divname = element_div_name(msgs[m]["input_element"]);
        show_div_msg(divname,"");
    }
}
function element_div_name(input_element)
{
  var divname = input_element.form._sfm_form_name + "_" + 
                   input_element.name + "_errorloc";

  divname = divname.replace(/[\[\]]/gi,"");

  return divname;
}
function div_showmsg(msgs)
{
    var whole_msg;
    var first_elmnt=null;
    for(var m in msgs)
    {
        if(null == first_elmnt)
        {
            first_elmnt = msgs[m]["input_element"];
        }
        var divname = element_div_name(msgs[m]["input_element"]);
        show_div_msg(divname,msgs[m]["msg"]);
    }
    if(null != first_elmnt)
    {
        first_elmnt.focus();
    }
}
function show_div_msg(divname,msgstring)
{
	if(divname.length<=0) return false;

	if(document.layers)
	{
		divlayer = document.layers[divname];
        if(!divlayer){return;}
		divlayer.document.open();
		divlayer.document.write(msgstring);
		divlayer.document.close();
	}
	else
	if(document.all)
	{
		divlayer = document.all[divname];
        if(!divlayer){return;}
		divlayer.innerHTML=msgstring;
	}
	else
	if(document.getElementById)
	{
		divlayer = document.getElementById(divname);
        if(!divlayer){return;}
		divlayer.innerHTML =msgstring;
	}
	divlayer.style.visibility="visible";	
	return false;
}
function ValidationDesc(inputitem,desc,error,condition)
{
  this.desc=desc;
	this.error=error;
	this.itemobj = inputitem;
	this.condition = condition;
	this.validate=vdesc_validate;
}
function vdesc_validate()
{
	if(this.condition != null )
	{
		if(!eval(this.condition))
		{
			return true;
		}
	}
	if(!validateInput(this.desc,this.itemobj,this.error))
	{
		this.itemobj.validatorobj.disable_validations=true;
		this.itemobj.focus();
		return false;
	}
	return true;
}
function ValidationSet(inputitem,msgs_together)
{
    this.vSet=new Array();
	this.add= add_validationdesc;
	this.validate= vset_validate;
	this.itemobj = inputitem;
    this.msgs_together = msgs_together;
}
function add_validationdesc(desc,error,condition)
{
  this.vSet[this.vSet.length]= 
  new ValidationDesc(this.itemobj,desc,error,condition);
}
function vset_validate()
{
    var bRet = true;
    for(var itr=0;itr<this.vSet.length;itr++)
    {
        bRet = bRet && this.vSet[itr].validate();
        if(!bRet && !this.msgs_together)
        {
            break;
        }
    }
    return bRet;
}
function validateEmail(email)
{
    var splitted = email.match("^(.+)@(.+)$");
    if(splitted == null) return false;
    if(splitted[1] != null )
    {
      var regexp_user=/^\"?[\w-_\.]*\"?$/;
      if(splitted[1].match(regexp_user) == null) return false;
    }
    if(splitted[2] != null)
    {
      var regexp_domain=/^[\w-\.]*\.[A-Za-z]{2,4}$/;
      if(splitted[2].match(regexp_domain) == null) 
      {
	    var regexp_ip =/^\[\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\]$/;
	    if(splitted[2].match(regexp_ip) == null) return false;
      }// if
      return true;
    }
return false;
}

function IsCheckSelected(objValue,chkValue)
{
    var selected=false;
	var objcheck = objValue.form.elements[objValue.name];
    if(objcheck.length)
	{
		var idxchk=-1;
		for(var c=0;c < objcheck.length;c++)
		{
		   if(objcheck[c].value == chkValue)
		   {
		     idxchk=c;
			 break;
		   }//if
		}//for
		if(idxchk>= 0)
		{
		  if(objcheck[idxchk].checked=="1")
		  {
		    selected=true;
		  }
		}//if
	}
	else
	{
		if(objValue.checked == "1")
		{
			selected=true;
		}//if
	}//else	

	return selected;
}
function TestDontSelectChk(objValue,chkValue,strError)
{
	var pass = true;
	pass = IsCheckSelected(objValue,chkValue)?false:true;

	if(pass==false)
	{
     if(!strError || strError.length ==0) 
        { 
        	strError = "Can't Proceed as you selected "+objValue.name;  
        }//if			  
	  sfm_show_error_msg(strError,objValue);
	  
	}
    return pass;
}
function TestShouldSelectChk(objValue,chkValue,strError)
{
	var pass = true;

	pass = IsCheckSelected(objValue,chkValue)?true:false;

	if(pass==false)
	{
     if(!strError || strError.length ==0) 
        { 
        	strError = "You should select"+objValue.name;  
        }//if			  
	  sfm_show_error_msg(strError,objValue);
	  
	}
    return pass;
}
function TestRequiredInput(objValue,strError)
{
 var ret = true;
 var val = objValue.value;
 val = val.replace(/^\s+|\s+$/g,"");//trim
    if(eval(val.length) == 0) 
    { 
       if(!strError || strError.length ==0) 
       { 
         strError = objValue.name + " : Required Field"; 
       }//if 
       sfm_show_error_msg(strError,objValue); 
       ret=false; 
    }//if 
return ret;
}
function TestMaxLen(objValue,strMaxLen,strError)
{
 var ret = true;
    if(eval(objValue.value.length) > eval(strMaxLen)) 
    { 
      if(!strError || strError.length ==0) 
      { 
        strError = objValue.name + " : "+ strMaxLen +" characters maximum "; 
      }//if 
      sfm_show_error_msg(strError,objValue); 
      ret = false; 
    }//if 
return ret;
}
function TestMinLen(objValue,strMinLen,strError)
{
 var ret = true;
    if(eval(objValue.value.length) <  eval(strMinLen)) 
    { 
      if(!strError || strError.length ==0) 
      { 
        strError = objValue.name + " : " + strMinLen + " characters minimum  "; 
      }//if               
      sfm_show_error_msg(strError,objValue); 
      ret = false;   
    }//if 
return ret;
}
function TestInputType(objValue,strRegExp,strError,strDefaultError)
{
   var ret = true;

    var charpos = objValue.value.search(strRegExp); 
    if(objValue.value.length > 0 &&  charpos >= 0) 
    { 
     if(!strError || strError.length ==0) 
      { 
        strError = strDefaultError;
      }//if 
      sfm_show_error_msg(strError,objValue); 
      ret = false; 
    }//if 
 return ret;
}

function TestDate(objValue,strError)
{
var ret = true;
     if(objValue.value.length > 0 && !isValidDate(objValue.value)	 ) 
     { 
       if(!strError || strError.length ==0) 
       { 
          strError = objValue.name+": Enter a valid Date "; 
       }//if                                               
       sfm_show_error_msg(strError,objValue); 
       ret = false; 
     }//if 
return ret;
}

function TestDateLessThanToday(objValue,strError)
{
	var ret = true;
	if(objValue.value.length > 0 && Date.parse(objValue.value) > new Date())
	{ 
	    if(!strError || strError.length ==0) 
	    { 
	      strError = objValue.name + " : value should be less than today "; 
	    }//if               
    sfm_show_error_msg(strError,objValue); 
    ret = false;                 
   }//if   
return ret;          
}

function TestDateGreaterThan(objValue,strError)
{
	var ret = true;
	var itemobj ;
	try{
	itemobj = document.getElementById('sapCertSince');
	} catch (e) {
	alert("The following error occurred: " + e.name + " - " 
	+ e.message); }

	if(Date.parse(objValue.value) < Date.parse(itemobj.value))
	{ 
	    if(!strError || strError.length ==0) 
	    { 
	      strError = objValue.name + " : value should be greater than SAP certified date"; 
	    }//if               
    sfm_show_error_msg(strError,objValue); 
    ret = false;                 
   }//if   
return ret;          
}


function TestEmail(objValue,strError)
{
var ret = true;
     if(objValue.value.length > 0 && !validateEmail(objValue.value)	 ) 
     { 
       if(!strError || strError.length ==0) 
       { 
          strError = objValue.name+": Enter a valid Email address "; 
       }//if                                               
       sfm_show_error_msg(strError,objValue); 
       ret = false; 
     }//if 
return ret;
}
function TestLessThan(objValue,strLessThan,strError)
{
var ret = true;
	  if(isNaN(objValue.value)) 
	  { 
	    sfm_show_error_msg(objValue.name +": Should be a number ",objValue); 
	    ret = false; 
	  }//if 
	  else
	  if(eval(objValue.value) >=  eval(strLessThan)) 
	  { 
	    if(!strError || strError.length ==0) 
	    { 
	      strError = objValue.name + " : value should be less than "+ strLessThan; 
	    }//if               
	    sfm_show_error_msg(strError,objValue); 
	    ret = false;                 
	   }//if   
return ret;          
}
function TestGreaterThan(objValue,strGreaterThan,strError)
{
var ret = true;
     if(isNaN(objValue.value)) 
     { 
       sfm_show_error_msg(objValue.name+": Should be a number ",objValue); 
       ret = false; 
     }//if 
	 else
     if(eval(objValue.value) <=  eval(strGreaterThan)) 
      { 
        if(!strError || strError.length ==0) 
        { 
          strError = objValue.name + " : value should be greater than "+ strGreaterThan; 
        }//if               
        sfm_show_error_msg(strError,objValue);  
        ret = false;
      }//if  
return ret;           
}
function TestRegExp(objValue,strRegExp,strError)
{
var ret = true;
    if( objValue.value.length > 0 && 
        !objValue.value.match(strRegExp) ) 
    { 
      if(!strError || strError.length ==0) 
      { 
        strError = objValue.name+": Invalid characters found "; 
      }//if                                                               
      sfm_show_error_msg(strError,objValue); 
      ret = false;                   
    }//if 
return ret;
}
function TestDontSelect(objValue,dont_sel_index,strError)
{
var ret = true;
    if(objValue.selectedIndex == null) 
    { 
      sfm_show_error_msg("ERROR: dontselect command for non-select Item"); 
      ret =  false; 
    } 
    if(objValue.selectedIndex == eval(dont_sel_index)) 
    { 
     if(!strError || strError.length ==0) 
      { 
      strError = objValue.name+": Please Select one option "; 
      }//if                                                               
      sfm_show_error_msg(strError); 
      ret =  false;                                   
     } 
return ret;
}
function TestSelectOneRadio(objValue,strError)
{
	var objradio = objValue.form.elements[objValue.name];
	var one_selected=false;
	for(var r=0;r < objradio.length;r++)
	{
	  if(objradio[r].checked == "1")
	  {
	  	one_selected=true;
		break;
	  }
	}
	if(false == one_selected)
	{
      if(!strError || strError.length ==0) 
       {
	    strError = "Please select one option from "+objValue.name;
	   }	
	  sfm_show_error_msg(strError,objValue);
	}
return one_selected;
}

function validateInput(strValidateStr,objValue,strError) 
{ 
    var ret = true;
    var epos = strValidateStr.search("="); 
    var  command  = ""; 
    var  cmdvalue = ""; 
    if(epos >= 0) 
    { 
     command  = strValidateStr.substring(0,epos); 
     cmdvalue = strValidateStr.substr(epos+1); 
    } 
    else 
    { 
     command = strValidateStr; 
    } 
    switch(command) 
    { 
        case "req": 
        case "required": 
         { 
		   ret = TestRequiredInput(objValue,strError)
           break;             
         }//case required 
        case "maxlength": 
        case "maxlen": 
          { 
			 ret = TestMaxLen(objValue,cmdvalue,strError)
             break; 
          }//case maxlen 
        case "minlength": 
        case "minlen": 
           { 
			 ret = TestMinLen(objValue,cmdvalue,strError)
             break; 
            }//case minlen 
        case "alnum": 
        case "alphanumeric": 
           { 
				ret = TestInputType(objValue,"[^A-Za-z0-9]",strError, 
						objValue.name+": Only alpha-numeric characters allowed ");
				break; 
           }
        case "alnum_s": 
        case "alphanumeric_space": 
           { 
				ret = TestInputType(objValue,"[^A-Za-z0-9\\s]",strError, 
						objValue.name+": Only alpha-numeric characters and space allowed ");
				break; 
           }		   
        case "num": 
        case "numeric": 
           { 
                ret = TestInputType(objValue,"[^0-9]",strError, 
						objValue.name+": Only digits allowed ");
                break;               
           }
        case "dec": 
        case "decimal": 
           { 
                ret = TestInputType(objValue,"[^0-9\.]",strError, 
						objValue.name+": Only numbers allowed ");
                break;               
           }
        case "alphabetic": 
        case "alpha": 
           { 
                ret = TestInputType(objValue,"[^A-Za-z]",strError, 
						objValue.name+": Only alphabetic characters allowed ");
                break; 
           }
        case "alphabetic_space": 
        case "alpha_s": 
           { 
                ret = TestInputType(objValue,"[^A-Za-z\\s]",strError, 
						objValue.name+": Only alphabetic characters and space allowed ");
                break; 
           }
        case "email": 
          { 
			   ret = TestEmail(objValue,strError);
               break; 
          }
        case "lt": 
        case "lessthan": 
         { 
    	      ret = TestLessThan(objValue,cmdvalue,strError);
              break; 
         }
        case "gt": 
        case "greaterthan": 
         { 
			ret = TestGreaterThan(objValue,cmdvalue,strError);
            break; 
         }//case greaterthan 
        case "regexp": 
         { 
			ret = TestRegExp(objValue,cmdvalue,strError);
           break; 
         }
        case "dontselect": 
         { 
			 ret = TestDontSelect(objValue,cmdvalue,strError)
             break; 
         }
		case "dontselectchk":
		{
			ret = TestDontSelectChk(objValue,cmdvalue,strError)
			break;
		}
		case "shouldselchk":
		{
			ret = TestShouldSelectChk(objValue,cmdvalue,strError)
			break;
		}
		case "selone_radio":
		{
			ret = TestSelectOneRadio(objValue,strError);
		    break;
		}		 
		case "date":
		{
			ret = TestDate(objValue,strError);
		    break;
		}		 
		case "date_lessthan_today":
		{
			ret = TestDateLessThanToday(objValue,strError);
		    break;
		}		 
		case "date_greater_than":
		{
			ret = TestDateGreaterThan(objValue,strError);
		    break;
		}		 
    }//switch 
	return ret;
}
function VWZ_IsListItemSelected(listname,value)
{
 for(var i=0;i < listname.options.length;i++)
 {
  if(listname.options[i].selected == true &&
   listname.options[i].value == value) 
   {
     return true;
   }
 }
 return false;
}
function VWZ_IsChecked(objcheck,value)
{
 if(objcheck.length)
 {
     for(var c=0;c < objcheck.length;c++)
     {
       if(objcheck[c].checked == "1" && 
	     objcheck[c].value == value)
       {
        return true; 
       }
     }
 }
 else
 {
  if(objcheck.checked == "1" )
   {
    return true; 
   }    
 }
 return false;
}

function formatTelNo (telNo)
{
    // If it's blank, save yourself some trouble by doing nothing.
    if (telNo.value == "") return;

    

    var phone = new String (telNo.value);
    
    phone = phone.substring(0,14);

    /*
    "." means any character. If you try to use "(" and ")", the regular expression becomes 
    complicated sice both are reserve characters and escaping them sometimes fails. So just 
    use "." for any character and replace it later.
    */
    if (phone.match (".[0-9]{3}.[0-9]{3}-[0-9]{4}") == null)
    {
        /*
        Following "if" is for user making any changes to the formatted tel. no. If you don't put this 
        "if" condition, the user can not correct a digit by first deleting it and then entering a 
        correct one, since this will fire two "onkeyup" events : first one on deleting a 
        character and second one on entering the correct one. The first "onkeyup" event will fire this 
        function which will reformatt the tel no before the user gets a chace to correct the digit. This 
        will surely confuse the user. The "if" condition below eliminates that.
        */
        if (phone.match (".[0-9]{2}.[0-9]{3}-[0-9]{4}|" + ".[0-9].[0-9]{3}-[0-9]{4}|" +
            ".[0-9]{3}.[0-9]{2}-[0-9]{4}|" + ".[0-9]{3}.[0-9]-[0-9]{4}") == null)
        {
            /*
            You will reach here only if the user is still typing the number or if he/she has 
            messed up already formatted number. 
            */
            var phoneNumeric = phoneChar = "", i;
            // Loop thru what user has entered.
            for (i=0;i<phone.length;i++)
            {
                // Go thru what user has entered one character at a time.
                phoneChar = phone.substr (i,1);
    
                // If that character is not a number or is a White space, ignore it. Only if it is a digit, 
                // concatinate it with a number string.
                if (!isNaN (phoneChar) && (phoneChar != " ")) phoneNumeric = phoneNumeric + phoneChar;
            }
    
            phone = "";
            // At this point, you have picked up only digits from what user has entered. Loop thru it.
            for (i=0;i<phoneNumeric.length;i++)
            {
                // If it's the first digit, throw in "(" before that.
                if (i == 0) phone = phone + "(";
                // If you are on the 4th digit, put ") " before that.
                if (i == 3) phone = phone + ") ";
                // If you are on the 7th digit, insert "-" before that.
                if (i == 6) phone = phone + "-";
                // Add the digit to the phone charatcer string you are building.
                phone = phone + phoneNumeric.substr (i,1)
            }
        }
    }
    else
    { 
        // This means the tel no is in proper format. Make sure by replacing the 0th, 4th and 8th character.
        phone = "(" + phone.substring (1,4) + ") " + phone.substring (5,8) + "-" + phone.substring(9,13); 
    }
    // So far you are working internally. Refresh the screen with the re-formatted value.
    if (phone != telNo.value) telNo.value = phone;
}

/*
CheckTelNo method takes in current element of the form as input. This method should be 
fired as the user attempts to leave the current element in the form (by using onBlur method). 
It checks to see if the format of the phone is "(123) 456-7890".
Eg. <netui:textBox size="13" maxlength="13" onBlur="javascript:checkTelNo (this);" onKeyUp="javascript:formatTelNo (this);" onKeyDown="javascript:formatTelNo (this);"/>  
*/      
function checkTelNo (telNo)
{
    if (telNo.value == "") return;
    if (telNo.value.match (".[0-9]{3}.[0-9]{3}-[0-9]{4}") == null)
    {
        if (telNo.value.match ("[0-9]{10}") != null)
            formatTelNo (telNo)              
    }
}

/*
	Copyright (C) 2003-2008 JavaScript-Coder.com . All rights reserved.
*/