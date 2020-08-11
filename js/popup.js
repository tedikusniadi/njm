function closepopup(id){
		$("#"+id).dialog('destroy');
		$("#"+id).remove();
	}
	function openpopup(url) {
		var id="popup"+Math.floor(Math.random()*9867654321*999);
		$("body").append($('<div id="'+id+'"></div>'));
		$("#"+id).dialog({title:'Loading...',stack:false,autoOpen : false,modal : true,width:650,height:620,close:function(){$("#"+id).remove();}})
		.dialogExtend({"maximize" : true,"dblclick" : "maximize","icons" : {"maximize" : "ui-icon-circle-plus","restore" : "ui-icon-bullet"}})
		.html("<img src='"+base_url+"/assets/images/loading.gif' style='position:relative;left:"+((650/2)-60)+"px;top:"+((620/2)-150)+"px;'/>")
		.load(url+"&popupid="+id,function(){
			$("#ui-dialog-title-"+id).text($("#"+id).find("title").text());
			$("#"+id).find("#se-containers").css("width","100%");
		});
		$("#"+id).attr("url",url);
		$("#"+id).dialog("open");
	}
	
	function progressstart()
	{
		$('#progress-start').show();
	}

	function openorg(target){
		alert("please change openorg to openOrg (case sensitive)!");
	}
	function openParty(target)
	{
		openpopup(base_url+'/page/popuppartyview.htm?target='+ target);
	}
	function openOrg(target)
	{
		openpopup(base_url+'/page/popupcompanystructurerolebasedview.htm?target=' + target);
	}
	function openHolder(target){
		openpopup(base_url+'/page/popupcompanystructureview.htm?partyRole=4&target=' + target);
	}
	function openProduct(target)
	{
		openpopup(base_url+'/page/productpopupview.htm?active=true&target=' + target);
	}
	function openProductByType(target,types)
	{
		openpopup(base_url+'/page/productpopupview.htm?active=true&types='+types+'&target='+ target);
	}
	function openProductByCategory(target,category)
	{
		openpopup(base_url+'/page/productpopupview.htm?active=true&target='+target+'&categoryId='+ category);
	}
	function openProductOnHandByCategory(target,category,index)
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}
		
		var fac = document.getElementById('facility');
		if (fac.value == '')
			openpopup(base_url+'/page/popupproductonhandbycategoryview.htm?active=true&target='+target+'&organization='+org.value+'&categoryId='+category+'&index='+index);
		else
			openpopup(base_url+'/page/popupproductonhandbycategoryview.htm?active=true&target='+target+'&organization='+org.value+'&categoryId='+category+'&index='+index+'&facility='+fac.value);
	}
	function openProductByParam(target,param)
	{
		openpopup(base_url+'/page/productpopupview.htm?'+param+'&target=' + target);
	}
	function openProductByOrg(target)
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}
		openpopup(base_url+'/page/popupproductview.htm?organization=' + org.value + '&target=' + target);
	}
	function openSalesman(target)
	{
		opensalesman(target);
	}
	function opensalesman(target)
	{
		openpopup(base_url+'/page/salesmanpopupview.htm?target=' + target);
	}
	function openSalesmanByOrg(target)
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}
		openpopup(base_url+'/page/salesmanpopupview.htm?target=' + target + '&organization=' + org.value);
	}
	function openSupplierByOrg(target)
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}
		openpopup(base_url+'/page/popupsupplierview.htm?target=' + target + '&organization=' + org.value);
	}
	function openSupplier(target){
		opensupplier(target);
	}
	function opensupplier(target)
	{
		openpopup(base_url+'/page/popupsupplierview.htm?target=' + target);
	}
	function opensupplierpersonal(target)
	{
		var org = document.getElementById('org');
		openpopup(base_url+'/page/popupsupplierview.htm?target=' + target + "&personal=yes&organization="+org.value);
	}

	function openFacility(target)
	{
		openpopup(base_url+'/page/popupfacilityview.htm?target=' + target);
	}

	function openFacilityByOrg(target)
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}

		openpopup(base_url+'/page/popupfacilityview.htm?organization=' + org.value +'&target=' + target);
	}

	function openCustomer(target)
	{
		openpopup(base_url+'/page/popupcustomerview.htm?target=' + target);
	}

	function openCustomerByOrg(target)
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}
		openpopup(base_url+'/page/popupcustomerview.htm?organization=' + org.value + '&target=' + target);
	}

	function openCustomerByOrgInstant(target, instant)
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}
		openpopup(base_url+'/page/popupcustomerview.htm?organization=' + org.value + '&target=' + target + '&instant=' + instant+'&active=true');
	}

	function openCustomerFacilityByOrg(target)
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}
		openpopup(base_url+'/page/popupcustomerfacilityview.htm?organization=' + org.value + '&target=' + target);
	}

	function openCustomerOwner(target)
	{
		openpopup(base_url+'/page/popupcustomerservicetransactionview.htm?target=' + target);
	}

	function openMechanicByOrg(target)
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}
		openpopup(base_url+'/page/popupmechanicview.htm?organization=' + org.value + '&target=' + target);
	}

	function openGridByOrg(target)
	{
		var fac = document.getElementById('facility');

		if(fac.value == '')
		{
			alert('Please select Facility first!');
			return;
		}

		openpopup(base_url+'/page/popupgridview.htm?target='+target+'&facility='+fac.value);
	}

	function openGrid(target)
	{
		openpopup(base_url+'/page/popupgridview.htm?target='+target);
	}

	function openVehicle()
	{
		var org = document.getElementById('org');
		openpopup(base_url+'/page/popupvehicleview.htm?target=vehicle&organization='+org.value);
	}

	function openDriver()
	{
		var org = document.getElementById('org');
		openpopup(base_url+'/page/popupdriverview.htm?target=driver&organization='+org.value);
	}

	function openShipping()
	{
		var org = document.getElementById('org');
		if(org.value == null || org.value == '')
		{
			alert('Please select company first!');
			return;
		}
		openpopup(base_url+'/page/popuppostaladdressview.htm?target=postalAddress&party='+org.value);
	}

	function openExpedition()
	{
		var org = document.getElementById('org');
		if(org.value == null || org.value == '')
		{
			alert('Please select company first!');
			return;
		}
		openpopup(base_url+'/page/popupexpeditionview.htm?target=expedition&organization='+org.value);
	}
	function openPostal(target)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		var customer = document.getElementById('customer');
		var custId="";
		if(customer)
			custId=customer.value;
		openpopup(base_url+'/page/popuppostaladdressview.htm?party='+custId+'&target='+target);
	}
	function openAccount(target,methodType)
	{
		var method = 'CASH';
		if(methodType != 'CASH')
			method = 'BANK';

		openpopup(base_url+'/page/popupbankaccountview.htm?target='+target+'&type='+method);
	}
	function openAccount(target,methodType,org)
	{
		var method = 'CASH';
		if(methodType != 'CASH')
			method = 'BANK';

		openpopup(base_url+'/page/popupbankaccountview.htm?target='+target+'&type='+method+"&org="+org);
	}
	function openAccountByOrg(target,methodType)
	{
		var org = document.getElementById('org');
		if(org.value == '')
		{
			alert('Please select Organization first!');
			return;
		}
		openpopup(base_url+'/page/popupbankaccountview.htm?target='+target+'&organization='+org.value+'&type='+method);
	}

	/**
	* function for open popup prepayment
	* openPrepayment(target,customer,param)
	* @param target as target
	* @param customer as customerid,set null if it unecessary
	* @param param as flag enable,set null if it unecessary
	*/
	function openPrepayment(target,customer,param)
	{
		var org = document.getElementById('org').value;
		var cust="";
		var status="";
		if(customer != null )
			cust=document.getElementById(customer).value;
		if(param != null)
			status="&enabled="+param;
		
		openpopup(base_url+'/page/prepaymentpopup.htm?target='+target+'&customerId='+cust+status+'&organization='+org+'&available=true');
	}

	/**
	* function for open popup unit sales order
	* openSalesOrder(target,organization,param)
	* @param target as target
	* @param param as flag enable,set null if it unecessary
	*/
	function openSalesOrder(target,param,billed)
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}
		var cust = document.getElementById('customer');
		var status="";
		if(param != null)
			status="&enabled="+param;
		openpopup(base_url+'/page/unitsalesorderpopup.htm?target='+target+'&organization='+org.value+'&customer='+cust.value+status+"&billed="+billed);
	}
	
	function openSalesOrderLeasingStatus(target,param,leasing)
	{
		var org = document.getElementById('org');
		if (org.value == '') {
			alert('Please select Organization first!');
			return;
		}
		var cust = document.getElementById('customer');
		if(cust.value == '') {
			alert('Please select Customer firs !!!');
			return;
		}
		var status="";
		if(param != null)
			status="&enabled="+param;
		openpopup(base_url+'/page/unitsalesorderleasingpopup.htm?target='+target+'&organization='+org.value+'&customer='+cust.value+status+"&leasingStatus="+leasing+"&billed=N&returStatus=false");
	}