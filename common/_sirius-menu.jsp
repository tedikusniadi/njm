	<%@ include file="tld-common.jsp"%>
	<div id="se-main-menu">
		<!-- ##### ROOT MENU ###################################################################### -->
		<div id="main_menu_popup" dojoType="MenuBar2" class="menu-popup">
				<c:if test="${menu.Company_Administration}">
					<div dojoType="MenuBarItem2" caption="<spring:message code="sirius.menu.companyadmin"/>" submenuId="companyAdminSub"></div>
				</c:if>
				<c:if test="${menu.Sales}">
					<div dojoType="MenuBarItem2" caption="<spring:message code="sirius.menu.sales"/>" submenuId="sales"></div>
				</c:if>
				<c:if test="${menu.Procurement}">
					<div dojoType="MenuBarItem2" caption="<spring:message code="sirius.menu.procurement"/>" submenuId="procurement"></div>
				</c:if>
				<c:if test="${menu.Financial_Accounting}">
					<div dojoType="MenuBarItem2" caption="<spring:message code="sirius.menu.financialaccounting"/>" submenuId="financialAccounting"></div>
				</c:if>
				<c:if test="${menu.Inventory}">
					<div dojoType="MenuBarItem2" caption="<spring:message code="sirius.menu.inventory"/>" submenuId="inventory"></div>
				</c:if>
				<c:if test="${menu.Production}">
					<div dojoType="MenuBarItem2" caption="<spring:message code="sirius.menu.production"/>" submenuId="production"></div>
				</c:if>
				<c:if test="${menu.Tools}">
					<div dojoType="MenuBarItem2" caption="<spring:message code="sirius.menu.tools"/>" submenuId="tools"></div>
				</c:if>
				<c:if test="${menu.Human_Resource}">
					<div dojoType="MenuBarItem2" caption="<spring:message code="sirius.menu.humanresource"/>" submenuId="hrd"></div>
				</c:if>
		</div>
	</div>
	<!-- ##### END OF ROOT MENU ############################################################################ -->

	<c:if test="${menu.SPBU}">
		<div dojoType="PopupMenu2" widgetId="spbu">
			<c:if test="${menu.Nozzle}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.spbu.nozzle'/>" onclick="go_to('<c:url value='/page/spbunozzleview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Receipt}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.spbu.receipt'/>" onclick="go_to('<c:url value='/page/spbureceiptview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Tank}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.spbu.tank'/>" onclick="go_to('<c:url value='/page/spbutankview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Shift_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.spbu.shift'/>" onclick="go_to('<c:url value='/page/spbushiftview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<!-- ##### Company Administration ###################################################################### -->
	<div dojoType="PopupMenu2" widgetId="companyAdminSub" >
		<c:if test="${menu.Company}">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.company'/>" onclick="go_to('<c:url value='/page/companyview.htm'/>');"></div>
			<div dojoType="MenuSeparator2"></div>
		</c:if>
		<c:if test="${menu.Facility}">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.facility'/>" onclick="go_to('<c:url value='/page/facilityview.htm'/>');"></div>
			<div dojoType="MenuSeparator2"></div>
		</c:if>
		<c:if test="${menu.Organization}">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.organization'/>" onclick="go_to('<c:url value='/page/organizationview.htm'/>');"></div>
			<div dojoType="MenuSeparator2"></div>
		</c:if>
		<c:if test="${menu.Party}">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.party'/>" onclick="go_to('<c:url value='/page/partyview.htm'/>');"></div>
			<div dojoType="MenuSeparator2"></div>
		</c:if>
		<c:if test="${menu.Financial_Information}">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.financialinfo'/>" submenuId="financialInformation"></div>
			<div dojoType="MenuSeparator2"></div>
		</c:if>
		<c:if test="${menu.General_Setting}">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.generalsetting'/>" submenuId="generalSettingSub"></div>
		</c:if>
	</div>

	<c:if test="${menu.Sales}">
		<div dojoType="PopupMenu2" widgetId="sales">
			<c:if test="${menu.BPKB}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.bpkb"/>" onclick="go_to('<c:url value='/page/bpkbview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Customer}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.customer"/>" onclick="go_to('<c:url value='/page/customerview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Consignment}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.consignment"/>" submenuId="consignment"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Follow_Up_History}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.followup"/>" onclick="go_to('<c:url value='/page/followuphistoryview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Plat_Nomor}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.plat"/>" onclick="go_to('<c:url value='/page/platview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Salesman}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesman"/>" onclick="go_to('<c:url value='/page/salesmanview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Unit_Sales_Order_Subdiction}">
				<div dojoType="MenuItem2" caption="Subsidi" onclick="go_to('<c:url value='/page/unitsalesordersubdictionview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Sales_Approver}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesapprover"/>" onclick="go_to('<c:url value='/page/salesapproverview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Sales_Master_Cost}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.mastercost"/>" onclick="go_to('<c:url value='/page/salesmastercostview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.STNK}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.stnk"/>" onclick="go_to('<c:url value='/page/stnkview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Unit_Sales_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.unitsalesorder"/>" onclick="go_to('<c:url value='/page/unitsalesorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Payment_Leasing}">
				<div dojoType="MenuItem2" caption="Proses Leasing" onclick="go_to('<c:url value='/page/paymentleasingview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Unit_Sales_Order}">
				<div dojoType="MenuItem2" caption="Approval Pengiriman Motor" onclick="go_to('<c:url value='/page/unitsalesorderapproval.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Unit_Delivery_Order}">
				<div dojoType="MenuItem2" caption="Pengiriman Motor" onclick="go_to('<c:url value='/page/unitdeliveryorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Sales_Return_Management}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesreturnmanagement"/>" submenuId="returnManagement"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Report_Sales}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.report"/>" submenuId="salesReport"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Report_Sales}">
		<div dojoType="PopupMenu2" widgetId="salesReport">
			<c:if test="${menu.Delivery_Order_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.report.deliveryorder"/>" onclick="go_to('<c:url value='/page/deliveryorderreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.HPP_Daily_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.report.hppdaily"/>" onclick="go_to('<c:url value='/page/hppdailyreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.HPP_Detail_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.report.hppdetail"/>" onclick="go_to('<c:url value='/page/hppdetailreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.HPP_Summary_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.report.hppsummary"/>" onclick="go_to('<c:url value='/page/hppsummaryreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
      		<c:if test="${menu.Sales_Order_Cost_Component_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.sales.report.costcomponent'/>" onclick="go_to('<c:url value='/page/dorealizationcostcomponentgroupreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Sales_Detail_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.report.salesdetail"/>" onclick="go_to('<c:url value='/page/salesdetailreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Sales_Summary}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.report.salessummary"/>" onclick="go_to('<c:url value='/page/salessummaryreportpre.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<%--c:if test="${menu.Sales_Order}">
		<div dojoType="PopupMenu2" widgetId="salesOrder">
			<c:if test="${menu.Direct_Sales_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesorder.directsalesorder"/>" onclick="go_to('<c:url value='/page/directsalesorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Gas_Sales_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesorder.gas"/>" onclick="go_to('<c:url value='/page/gassalesorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Standard_Sales_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesorder.standardsalesorder"/>" submenuId="standardSalesOrder"></div>
			</c:if>
		</div>
	</c:if>
	<c:if test="${menu.Standard_Sales_Order}">
		<div dojoType="PopupMenu2" widgetId="standardSalesOrder">
			<c:if test="${menu.Delivery_Planning}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesorder.standardsalesorder.deliveryplanning"/>" onclick="go_to('<c:url value='/page/deliveryplanningview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Delivery_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesorder.standardsalesorder.deliveryorder"/>" onclick="go_to('<c:url value='/page/deliveryorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Delivery_Order_Realization}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesorder.standardsalesorder.deliveryorderrealization"/>" onclick="go_to('<c:url value='/page/deliveryorderrealizationview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Sales_Cost_Component_Distribution}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesorder.standardsalesorder.costcomponent"/>" onclick="go_to('<c:url value='/page/dorealizationcostcomponentgroupview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Standard_Sales_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesorder.standardsalesorder"/>" onclick="go_to('<c:url value='/page/standardsalesorderview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if--%>

	<c:if test="${menu.Sales_Return_Management}">
		<div dojoType="PopupMenu2" widgetId="returnManagement">
			<c:if test="${menu.Sales_Return}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.salesreturnmanagement.return"/>" onclick="go_to('<c:url value='/page/salesreturnview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Consignment}">
		<div dojoType="PopupMenu2" widgetId="consignment">
			<c:if test="${menu.Consignment_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.consignment.order"/>" onclick="go_to('<c:url value='/page/consignmentorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Consignment_Sales_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.sales.consignment.salesorder"/>" onclick="go_to('<c:url value='/page/consignmentsalesorderview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Transport_Outsource}">
		<div dojoType="PopupMenu2" widgetId="transportOutsource">
			<c:if test="${menu.Transport_Management}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.management'/>" submenuId="transportManagement"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Transport_Outsource_Contract}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.contract'/>" onclick="go_to('<c:url value='/page/transportoutsourcecontractview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Transport_Outsource_Master_Cost}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.mastercost'/>" onclick="go_to('<c:url value='/page/transportoutsourcemastercostview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Transport_Outsource_Reports}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.report'/>" submenuId="transportOutsourceReport"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Transport_Management}">
		<div dojoType="PopupMenu2" widgetId="transportManagement">
			<c:if test="${menu.Shipment}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.management.shipment'/>" onclick="go_to('<c:url value='/page/shipmentview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Transport_Outsource_Reports}">
		<div dojoType="PopupMenu2" widgetId="transportOutsourceReport">
			<c:if test="${menu.Contract_Recapitulation}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.report.contract'/>" onclick="go_to('<c:url value='/page/contractreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Delivery_Recapitulation}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.report.delivery'/>" onclick="go_to('<c:url value='/page/deliveryrecapitulationreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Destination_Recapitulation}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.report.destination'/>" onclick="go_to('<c:url value='/page/destinationrecapitulationpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Driver_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.report.driver'/>" onclick="go_to('<c:url value='/page/driverreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Route_Recapitulation}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.report.rote'/>" onclick="go_to('<c:url value='/page/routerecapitulationreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Shipment_Recapitulation}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.report.shipment'/>" onclick="go_to('<c:url value='/page/shipmentrecapitulationreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Shipment_Summary}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.report.shipemtsummary'/>" onclick="go_to('<c:url value='/page/shipmentsummaryreportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Shipment_Traffic_Detail}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.report.trafficdetail'/>" onclick="go_to('<c:url value='/page/shipmenttrafficreportdetailadd.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Shipment_Traffic_Summary}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.report.trafficsummary'/>" onclick="go_to('<c:url value='/page/shipmenttrafficreportsummaryadd.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Vehicle_Recapitulation}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.report.vehicle'/>" onclick="go_to('<c:url value='/page/vehiclerecapitulationpre.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.General_Setting}">
		<div dojoType="PopupMenu2" widgetId="generalSettingSub">
			<c:if test="${menu.Currency}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.generalsetting.currency'/>" onclick="go_to('<c:url value='/page/currencyView.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Geographic}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.generalsetting.geographic'/>" onclick="go_to('<c:url value='/page/geographicview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Geographic_Type}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.generalsetting.geographictype'/>" onclick="go_to('<c:url value='/page/geotypeview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Industry_Classification}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.generalsetting.partyclass'/>" onclick="go_to('<c:url value='/page/industryclassificationview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Unit_of_Measure}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.generalsetting.uom'/>" onclick="go_to('<c:url value='/page/uomView.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Vehicle_Management}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.transportoutsource.management.vehicle'/>" onclick="go_to('<c:url value='/page/vehicleview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Financial_Information}">
		<div dojoType="PopupMenu2" widgetId="financialInformation">
			<c:if test="${menu.Cash_Account}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.financialinfo.cashaccount'/>" onclick="go_to('<c:url value='/page/cashAccountView.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Tax}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.companyadmin.financialinfo.tax'/>" onclick="go_to('<c:url value='/page/taxView.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>
	<!-- ##### END Company Administration ###################################################################### -->

	<!-- ##### Financial Accounting ###################################################################### -->
	<c:if test="${menu.Financial_Accounting}">
		<div dojoType="PopupMenu2" widgetId="financialAccounting" >
			<c:if test="${menu.Accounting_Setting}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountingsetting'/>" submenuId="accountSetting"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Account_Payables}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable'/>" submenuId="payable"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Account_Receivables}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable'/>" submenuId="receivable"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Cash_Bank_Management}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement'/>" submenuId="cashbank"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Fixed_Asset}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.fixedasset'/>" submenuId="fixedAsset"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Journal_Entrys}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.journalentrys'/>" submenuId="entrys"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Journal_Entry_Batching}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.journalentrybatching'/>" onclick="go_to('<c:url value='/page/journalBatchingList.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Reports}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.report'/>" submenuId="financialReports"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Cash_Bank_Management}">
		<div dojoType="PopupMenu2" widgetId="cashbank">
			<c:if test="${menu.Reimbursements}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.reimbursements'/>" submenuId="reimbursements"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inter_Facility_Transaction}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.interfacility'/>" submenuId="interFacilityTransaction"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Cash_Bank_Transaction_Expense}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.expense'/>" onclick="go_to('<c:url value='/page/cashbanktransactionexpenseview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Cash_Bank_Transaction_Income}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.income'/>" onclick="go_to('<c:url value='/page/cashbanktransactionincomeview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Cash_Bank_Management_Reports}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.reports'/>" submenuId="cashBankManagementReports"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Reimbursements}">
		<div dojoType="PopupMenu2" widgetId="reimbursements">
			<c:if test="${menu.Clear_Reimbursement}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.reimbursements.clear'/>" onclick="go_to('<c:url value='/page/clearreimbursementview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Reimbursement}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.reimbursements.reimbursement'/>" onclick="go_to('<c:url value='/page/reimbursementview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Reimbursement_Requisition}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.reimbursements.requisition'/>" onclick="go_to('<c:url value='/page/reimbursementrequisitionview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Inter_Facility_Transaction}">
		<div dojoType="PopupMenu2" widgetId="interFacilityTransaction">
			<c:if test="${menu.Cross_Deposit}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.interfacility.crossdeposit'/>" onclick="go_to('<c:url value='/page/crossdepositview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inter_AP}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.interfacility.interap'/>" onclick="go_to('<c:url value='/page/requestableintertransactionrequisitionview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inter_Transaction_Acknowledgement}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.interfacility.intertransactionacknowledgement'/>" onclick="go_to('<c:url value='/page/intertransactionacknowledgementview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inter_Transaction_Requisition}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.interfacility.intertransactionrequisition'/>" onclick="go_to('<c:url value='/page/intertransactionrequisitionview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Loan_Acknowledgement}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.interfacility.loanacknowledgement'/>" onclick="go_to('<c:url value='/page/loanacknowledgementview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inter_Facility_Payment}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.interfacility.loanpayment'/>" onclick="go_to('<c:url value='/page/interfacilitypaymentview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inter_Facility_Payment_Clearing}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.interfacility.loanpaymentclearing'/>" onclick="go_to('<c:url value='/page/interfacilitypaymentclearingview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Loan_Requisition}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.interfacility.loanrequisition'/>" onclick="go_to('<c:url value='/page/loanrequisitionview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>
	<c:if test="${menu.Cash_Bank_Management_Reports}">
		<div dojoType="PopupMenu2" widgetId="cashBankManagementReports">
			<c:if test="${menu.Cross_Deposit_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.reports.crossdeposit'/>" onclick="go_to('<c:url value='/page/crossdepositreportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inter_AP_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.cashbankmanagement.reports.interap'/>" onclick="go_to('<c:url value='/page/interapreportprepare.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>


	<c:if test="${menu.Account_Receivables}">
		<div dojoType="PopupMenu2" widgetId="receivable">
			<c:if test="${menu.Billing}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.billing'/>" onclick="go_to('<c:url value='/page/billingview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Clear_Receipt}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.clearreceipt'/>" onclick="go_to('<c:url value='/page/clearreceiptview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Credit_Memo}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.memo'/>" onclick="go_to('<c:url value='/page/creditmemoview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Billing_Collecting}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.collectingdoc'/>" onclick="go_to('<c:url value='/page/billingcollectingdocumentview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Invoice_Tax}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.invoicetax'/>" onclick="go_to('<c:url value='/page/invoicetaxview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Manual_Billing}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.manualbilling'/>" onclick="go_to('<c:url value='/page/manualbillingview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Manual_Billing_Opening}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.manualbillingopeningbalance'/>" onclick="go_to('<c:url value='/page/manualbillingopeningbalanceview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.PPH}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.pph'/>" onclick="go_to('<c:url value='/page/pphview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Prepayment}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.prepayment'/>" onclick="go_to('<c:url value='/page/prepaymentview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Receipt}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.receipt'/>" onclick="go_to('<c:url value='/page/receiptview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports'/>" submenuId="arReport"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.AR_Report}">
		<div dojoType="PopupMenu2" widgetId="arReport">
			<c:if test="${menu.Ageing_Summary}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.agengsummary'/>" onclick="go_to('<c:url value='/page/ageingsummaryreportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Ageing_Detail}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.ageingdetail'/>" onclick="go_to('<c:url value='/page/ageingdetailreportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_Billing_Collector_Recapitulation}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.billingcollectrecap'/>" onclick="go_to('<c:url value='/page/accountreceivablesbillingreportcollectorprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_Billing_Detail_Recapitulation}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.billingdetrecap'/>" onclick="go_to('<c:url value='/page/accountreceivablesbillingreportdetailprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_Billing_Finance_Recapitulation}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.billingfinancerecap'/>" onclick="go_to('<c:url value='/page/accountreceivablesbillingreportfinanceprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_Billing_Summary_Recapitulation}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.billingsumrecap'/>" onclick="go_to('<c:url value='/page/accountreceivablesbillingreportsummaryprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_Ledger_Detail}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.ledgerdetail'/>" onclick="go_to('<c:url value='/page/ledgerdetailreportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_Ledger_Summary}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.ledgersummary'/>" onclick="go_to('<c:url value='/page/ledgersummaryreportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_PPH}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.pph'/>" onclick="go_to('<c:url value='/page/accountreceivablespphreportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_Register_Detail}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.registerdetail'/>" onclick="go_to('<c:url value='/page/arregisterdetaireportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_Register_Summary}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.registersummary'/>" onclick="go_to('<c:url value='/page/registersummaryreportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_Tax_Invoice}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.artax'/>" onclick="go_to('<c:url value='/page/taxinvoicereportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
      		<c:if test="${menu.Clearing_Receipt_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.clearreceipt'/>" onclick="go_to('<c:url value='/page/clearingreceiptreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AR_Invoice_Status}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.invoicestatus'/>" onclick="go_to('<c:url value='/page/arinvoicestatuspre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Receipt_Detail}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.receiptdetpercustomer'/>" onclick="go_to('<c:url value='/page/receiptdetailreportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Receipt_Summary}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.receiptsumpercustomer'/>" onclick="go_to('<c:url value='/page/receiptsummaryreportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Receipt_Detail_Per_CashBank}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.receiptdetperbank'/>" onclick="go_to('<c:url value='/page/receiptdetailcashbankreportprepare.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Receipt_Summary_Per_CashBank}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountreceivable.reports.receiptsumperbank'/>" onclick="go_to('<c:url value='/page/receiptsummarycashbankreportprepare.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Account_Payables}">
		<div dojoType="PopupMenu2" widgetId="payable">
			<c:if test="${menu.Direct_Invoice_Verification}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.advancepertamina'/>" onclick="go_to('<c:url value='/page/directinvoiceverificationview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Clear_Payment}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.clearpayment'/>" onclick="go_to('<c:url value='/page/clearpaymentview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Unit_Invoice_Verification_Discount}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.discountunit'/>" onclick="go_to('<c:url value='/page/unitinvoiceverificationdiscountview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Invoice_Verification}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.verification'/>" onclick="go_to('<c:url value='/page/invoiceverificationview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Manual_Invoice_Verification}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.manualverification'/>" onclick="go_to('<c:url value='/page/manualinvoiceverificationview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Unit_Invoice_Verification}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.unitdebetverification'/>" onclick="go_to('<c:url value='/page/unitinvoiceverificationview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Unit_Invoice_Verification_Component}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.otherpricediscount'/>" onclick="go_to('<c:url value='/page/unitinvoiceverificationcomponentview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Payment}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.payment'/>" onclick="go_to('<c:url value='/page/paymentview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Plafon}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.plafon'/>" onclick="go_to('<c:url value='/page/plafonview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Plafon_Debit}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.plafondebit'/>" onclick="go_to('<c:url value='/page/plafondebitview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.PO_Cost_Component_Verification}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.costcomponentverification'/>" onclick="go_to('<c:url value='/page/purchaseordercostcomponentverificationview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.SO_Cost_Component_Verification}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.socostcomponentverification'/>" onclick="go_to('<c:url value='/page/socostcomponentverificationview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Unit_Invoice_Verification_Dealer}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.unitverification'/>" onclick="go_to('<c:url value='/page/unitinvoiceverificationdealerview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AP_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports'/>" submenuId="apReport"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.AP_Report}">
		<div dojoType="PopupMenu2" widgetId="apReport">
   			<c:if test="${menu.Advance_Pertamina_Verification_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports.advancepertamina'/>" onclick="go_to('<c:url value='/page/directinvoiceverificationreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AP_Ageing_Detail}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports.ageingdetail'/>" onclick="go_to('<c:url value='/page/apageingdetailpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AP_Ageing_Summary}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports.ageingsummary'/>" onclick="go_to('<c:url value='/page/apageingsummarypre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Invoice_Verification_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports.verification'/>" onclick="go_to('<c:url value='/page/invoiceverificationreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AP_Ledger_Detail}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports.ledgerdetail'/>" onclick="go_to('<c:url value='/page/apledgerdetailpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AP_Ledger_Summary}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports.ledgersummary'/>" onclick="go_to('<c:url value='/page/apledgersummarypre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AP_Payment_Detail}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports.paymentdetail'/>" onclick="go_to('<c:url value='/page/appaymentdetailpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AP_Payment_Summary}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports.paymentsummary'/>" onclick="go_to('<c:url value='/page/appaymentsummarypre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.PO_Cost_Component_Verification}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports.costcomponentverification'/>" onclick="go_to('<c:url value='/page/pocostcomponentverificationreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AP_Register_Detail}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports.registerdetail'/>" onclick="go_to('<c:url value='/page/apregisterdetailpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.AP_Register_Summary}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountpayable.reports.registersummary'/>" onclick="go_to('<c:url value='/page/apregistersummarypre.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Fixed_Asset}">
		<div dojoType="PopupMenu2" widgetId="fixedAsset">
			<c:if test="${menu.Asset_Management}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.fixedasset.assetmanagement'/>" onclick="go_to('<c:url value='/page/fixedAssetGroupView.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Journal_Entrys}">
		<div dojoType="PopupMenu2" widgetId="entrys">
			<c:if test="${menu.Journal_Entry}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.journalentrys.journalentry'/>" onclick="go_to('<c:url value='/page/journalentryview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inter_From_Journal_Entry}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.journalentrys.interfromjournalentry'/>" onclick="go_to('<c:url value='/page/interjournalfromview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inter_To_Journal_Entry}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.journalentrys.intertojournalentry'/>" onclick="go_to('<c:url value='/page/interjournaltoview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Recurring_Journal_Entry}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.journalentrys.reccuringjournalentry'/>" onclick="go_to('<c:url value='/page/recurringjournalentryview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Schematic_Journal_Entry}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.journalentrys.schematicjournalentry'/>" onclick="go_to('<c:url value='/page/schematicjournalentryview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Accounting_Setting}">
		<div dojoType="PopupMenu2" widgetId="accountSetting">
			<c:if test="${menu.Accounting_Period}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountingsetting.accountingperiod'/>" onclick="go_to('<c:url value='/page/accountingperiodview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Accounting_Schema}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountingsetting.accountingschema'/>" onclick="go_to('<c:url value='/page/accountingschemaview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Bank_Account}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountingsetting.bankaccount'/>" onclick="go_to('<c:url value='/page/bankaccountview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Chart_Of_Account}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountingsetting.chartofaccount'/>" onclick="go_to('<c:url value='/page/chartofaccountview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Currency_Management}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountingsetting.currencymanagement'/>" onclick="go_to('<c:url value='/page/exchangemanagementview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Closing_Account_Type}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountingsetting.closingaccounttype'/>" onclick="go_to('<c:url value='/page/closingaccounttypeview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inter_Journal_Schema}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountingsetting.interjournalschema'/>" onclick="go_to('<c:url value='/page/interjournalschemaview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Journal_Entry_Index}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountingsetting.journalentryindex'/>" onclick="go_to('<c:url value='/page/journalentryindexview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Journal_Schema}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountingsetting.journalschema'/>" onclick="go_to('<c:url value='/page/standardjournalschemaview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Reimbursement_Journal_Schema}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.financialaccounting.accountingsetting.reimbursementjournalschema'/>" onclick="go_to('<c:url value='/page/reimbursementjournalschemaview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<!-- ##### END Financial Accounting ###################################################################### -->

	<!-- ##### INVENTORY ##################################################################################### -->
	<c:if test="${menu.On_Hand_Quantity}">
		<div dojoType="PopupMenu2" widgetId="onhandquantity">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.onhand'/> Unit" onclick="go_to('<c:url value='/page/onhandquantityview.htm?cat=1'/>');"></div>
			<div dojoType="MenuSeparator2"></div>
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.onhand'/> Spare-Part" onclick="go_to('<c:url value='/page/onhandquantityview.htm?cat=2'/>');"></div>
			<div dojoType="MenuSeparator2"></div>
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.onhand'/> Barang" onclick="go_to('<c:url value='/page/onhandquantityview.htm?cat=3'/>');"></div>
		</div>
	</c:if>
	<c:if test="${menu.Inventory}">
		<div dojoType="PopupMenu2" widgetId="inventory" >
			<c:if test="${menu.On_Hand_Quantity}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.onhand'/>"  submenuId="onhandquantity"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Item_Management}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.productmanage'/>" submenuId="itemManagement"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Warehouse_Management}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.warehousemanage'/>" submenuId="warehousemanagement"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inventory_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.report'/>" submenuId="invReport"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Inventory_Report}">
		<div dojoType="PopupMenu2" widgetId="invReport">
			<c:if test="${menu.Inventory_Ledger}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.rp.ledger'/>" onclick="go_to('<c:url value='/page/inventoryledgerpre.htm'/>');"></div>
			</c:if>
			<c:if test="${menu.Inventory_Ledger and menu.Inventory_Ledger_Detail}">
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inventory_Ledger_Detail}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.rp.ledgerdetail'/>" onclick="go_to('<c:url value='/page/inventoryledgerdetailpre.htm'/>');"></div>
			</c:if>
			<c:if test="${menu.Inventory_Ledger_Detail and menu.Inventory_Ledger_Serial}">
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Inventory_Ledger_Serial}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.rp.ledgerserial'/>" onclick="go_to('<c:url value='/page/inventoryledgerserialpre.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Item_Management}">
		<div dojoType="PopupMenu2" widgetId="itemManagement">
			<c:if test="${menu.Product_Category}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.productmanage.category'/>" onclick="go_to('<c:url value='/page/productcategoryview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Product_Feature}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.productmanage.feature'/>" onclick="go_to('<c:url value='/page/productfeatureview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Product}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.productmanage.product'/>" onclick="go_to('<c:url value='/page/productview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Warehouse_Management}">
		<div dojoType="PopupMenu2" widgetId="warehousemanagement">
			<c:if test="${menu.Goods_Issue}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.wm.gi'/>" onclick="go_to('<c:url value='/page/goodsissueview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<%-- <c:if test="${menu.Goods_Receipt}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.wm.gr'/>" onclick="go_to('<c:url value='/page/goodsreceiptview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if> --%>
			<c:if test="${menu.Goods_Receipt_From_File}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.wm.gr'/>" onclick="go_to('<c:url value='/page/goodsreceiptfromfileview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Goods_Receipt_Verification}">
				<div dojoType="MenuItem2" caption="PDI Motor" onclick="go_to('<c:url value='/page/goodsreceiptitemverificationview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Goods_Receipt_Unit}">
				<div dojoType="MenuItem2" caption="Penerimaan Unit Motor" onclick="go_to('<c:url value='/page/goodsreceiptunitview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Product_Consumption}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.wm.consumption'/>" onclick="go_to('<c:url value='/page/productconsumptionview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Serials}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.wm.serial'/>" onclick="go_to('<c:url value='/page/serialsview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Stock_Adjustment}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.wm.adjustment'/>" onclick="go_to('<c:url value='/page/unitstockadjustmentview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Stock_Opname}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.wm.opname'/>" onclick="go_to('<c:url value='/page/stockopnameview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Transfer_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.wm.to'/>" onclick="go_to('<c:url value='/page/transferorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Virtual_Stock_Adjustment}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.inventory.wm.vadjustment'/>" onclick="go_to('<c:url value='/page/virtualadjustmentview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>


	<!-- ##### END INVENTORY ##################################################################################### -->

	<!-- ##### TOOLS ##################################################################################### -->
	<c:if test="${menu.Tools}">
		<div dojoType="PopupMenu2" widgetId="tools" style="float:right;" >
			<c:if test="${menu.User_Management}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.tools.um'/>" submenuId="userManagement"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Change_Password}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.tools.cp'/>" onclick="go_to('<c:url value='/page/userpreeditpassword.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.News}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.tools.news'/>" onclick="go_to('<c:url value='/page/newsView.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.My_Approval}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.tools.app'/>" onclick="go_to('<c:url value='/page/approvalview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Journal_Balance}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.tools.jb'/>" onclick="go_to('<c:url value='/page/journalbalancesynchronizepre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Configuration_Assistance}">
				<div dojoType="MenuItem2" caption="Control Panel" submenuId="controlPanel"></div>
			</c:if>
		</div>
	</c:if>
	<c:if test="${menu.Configuration_Assistance}">
		<div dojoType="PopupMenu2" widgetId="controlPanel">
		<c:if test="${menu.Audit_Trail}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.tools.au'/>" onclick="go_to('<c:url value='/page/activityHistoryView.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Module_Group}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.tools.mg'/>" onclick="go_to('<c:url value='/page/modulegroupview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Configuration_Assistance}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.tools.apc'/>" onclick="go_to('<c:url value='/page/configurationassistancepreedit.htm?id=1'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Sdk}">
				<div dojoType="MenuItem2" caption="SDK Page Viewer" onclick="go_to('<c:url value='/page/sdkpageview.htm?v=dashBoard'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Exception_Viewer}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.tools.ev'/>" onclick="go_to('<c:url value='/page/exceptionviewerview.htm?id=1'/>');"></div>
			</c:if>
		</div>
	</c:if>
		<c:if test="${menu.User_Management}">
			<div dojoType="PopupMenu2" widgetId="userManagement">
				<c:if test="${menu.Role}">
					<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.tools.um.role'/>" onclick="go_to('<c:url value='/page/roleview.htm'/>');"></div>
				</c:if>
				<c:if test="${menu.Role and menu.User}">
					<div dojoType="MenuSeparator2"></div>
				</c:if>
				<c:if test="${menu.User}">
					<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.tools.um.user'/>" onclick="go_to('<c:url value='/page/userview.htm'/>');"></div>
				</c:if>
			</div>
		</c:if>

	<!-- ##### END TOOLS ##################################################################################### -->

	<!-- ##### REPORTS ##################################################################################### -->
	<c:if test="${menu.Reports}">
		<div dojoType="PopupMenu2" widgetId="financialReports" >
			<c:if test="${menu.Financial_Accounting}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting"/>" submenuId="financialReport"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Accounting}">
			<div dojoType="PopupMenu2" widgetId="financialReport">
					<c:if test="${menu.Advance_Profit_And_Loss}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.advprofitloss"/>" onclick="go_to('<c:url value='/page/advanceprofitlossreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Advance_Profit_Loss_Summary}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.advprofitlosssum"/>" onclick="go_to('<c:url value='/page/advanceprofitlosssummaryreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Advance_Trial_Balance}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.advtrialbalance"/>" onclick="go_to('<c:url value='/page/trialbalanceadvancereportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Balance_Sheet}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.balancesheet"/>" onclick="go_to('<c:url value='/page/balancesheetreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Balance_Sheet_Consecutive}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.balancesheetcons"/>" onclick="go_to('<c:url value='/page/balancesheetconsecutivereportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Balance_Sheet_Trial}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.balancesheettrial"/>" onclick="go_to('<c:url value='/page/balancesheettrialreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Balance_Sheet_Summary}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.balancesheetsum"/>" onclick="go_to('<c:url value='/page/balancesheetsummaryreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Bank_Account_Report}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.bankaccount"/>" onclick="go_to('<c:url value='/page/reportbankaccountpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Cashflow}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.cashflow"/>" onclick="go_to('<c:url value='/page/cashflowreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Fixed_Asset_Report}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.fixedasset"/>" onclick="go_to('<c:url value='/page/fixedassetreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.General_Journal}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.generaljournal"/>" onclick="go_to('<c:url value='/page/generaljournalreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.GL_Register}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.glregister"/>" onclick="go_to('<c:url value='/page/glregisterreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Inter_From_Journal}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.interfromjournal"/>" onclick="go_to('<c:url value='/page/interfromjournalreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Inter_To_Journal}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.intertojournal"/>" onclick="go_to('<c:url value='/page/intertojournalreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Payable_Cash_Bank_Report}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.payablecashbank"/>" onclick="go_to('<c:url value='/page/reportpayablecashbankpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Plafon_Account_Report}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.plafonaccount"/>" onclick="go_to('<c:url value='/page/plafonreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Pre_Posting_Trial_Balance}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.prepostingtrial"/>" onclick="go_to('<c:url value='/page/prepostingtrialbalancereportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Post_Closing_Trial_Balance}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.postclosingtrial"/>" onclick="go_to('<c:url value='/page/postclosingtrialbalancereportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Profit_And_Loss}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.profitloss"/>" onclick="go_to('<c:url value='/page/profitlossreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Profit_And_Loss_Consecutive}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.profitlosscons"/>" onclick="go_to('<c:url value='/page/profitlossconsecutivereportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Profit_And_Loss_Trial}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.profitlosstrial"/>" onclick="go_to('<c:url value='/page/profitlosstrialreportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Trial_Balance}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.trialbalance"/>" onclick="go_to('<c:url value='/page/trialbalancereportpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Vehicle_Profit_and_Lost}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.vehicleprofitloss"/>" onclick="go_to('<c:url value='/page/vehicleregisterpre.htm'/>');"></div>
						<div dojoType="MenuSeparator2"></div>
					</c:if>
					<c:if test="${menu.Worksheet}">
						<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.financialaccounting.report.financialaccounting.worksheet"/>" onclick="go_to('<c:url value='/page/worksheetreportpre.htm'/>');"></div>
					</c:if>
			</div>
		</c:if>

	<!-- ##### END REPORTS ##################################################################################### -->

	<div dojoType="PopupMenu2" widgetId="hrd" >
			<c:if test="${menu.Personnel}">
				<div dojoType="MenuItem2" caption="Personnel" submenuId="personel"></div>
			</c:if>
	</div>

		<c:if test="${menu.Personnel_Management}">
			<div dojoType="PopupMenu2" widgetId="personel">
					<c:if test="${menu.Personnel_Management}">
						<div dojoType="MenuItem2" caption="Personnel Management" onclick="go_to('<c:url value='/page/personListView.htm'/>');"></div>
					</c:if>
					<div dojoType="MenuItem2" caption="Applicant Form" onclick="go_to('<c:url value='/page/applicantFirstPrepare.htm'/>');"></div>
			</div>
		</c:if>

	<!-- ####### START PROCUREMENT ############################################################ -->
	<c:if test="${menu.Procurement}">
		<div dojoType="PopupMenu2" widgetId="procurement" >
			<c:if test="${menu.Direct_Purchase_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.procurement.directpurchaseorder"/>" onclick="go_to('<c:url value='/page/directpurchaseorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Pertamina_Procurement}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.procurement.pertamina"/>" submenuId="pertamina"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Procurement_Master_Cost}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.procurement.mastercost"/>" onclick="go_to('<c:url value='/page/procurementmastercostview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Purchase_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.procurement.purchaseorder"/>" onclick="go_to('<c:url value='/page/purchaseorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Purchase_Requisition}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.procurement.purchaserequisition"/>" onclick="go_to('<c:url value='/page/purchaserequisitionview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Supplier}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.procurement.supplier"/>" onclick="go_to('<c:url value='/page/supplierview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Procurement_Reports}">
				<div dojoType="MenuItem2" caption="<spring:message code="sirius.menu.procurement.report"/>" submenuId="proReport"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Procurement_Reports}">
		<div dojoType="PopupMenu2" widgetId="proReport" >
      		<c:if test="${menu.Collecting_Order_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.procurement.report.collectingorder'/>" onclick="go_to('<c:url value='/page/collectingorderreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
      		<c:if test="${menu.Loading_Order_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.procurement.report.loadingorder'/>" onclick="go_to('<c:url value='/page/loadingorderreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
      		<c:if test="${menu.Loading_Order_Realization_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.procurement.report.loadingorderrealization'/>" onclick="go_to('<c:url value='/page/loadingorderrealizationreportpre.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Pertamina_Procurement_Report}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.procurement.report.pertamina'/>" onclick="go_to('<c:url value='/page/pertaminaprocurementreportpre.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<c:if test="${menu.Pertamina_Procurement}">
		<div dojoType="PopupMenu2" widgetId="pertamina" >
			<c:if test="${menu.Collecting_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.procurement.pertamina.collectingorder'/>" onclick="go_to('<c:url value='/page/collectingorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Loading_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.procurement.pertamina.loadingorder'/>" onclick="go_to('<c:url value='/page/loadingorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Pertamina_Purchase_Order}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.procurement.pertamina.purchaseorder'/>" onclick="go_to('<c:url value='/page/ext1purchaseorderview.htm'/>');"></div>
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Purchase_Order_from_Sales}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.procurement.pertamina.purchaseordersales'/>" onclick="go_to('<c:url value='/page/pofromsalesview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<div dojoType="PopupMenu2" widgetId="production" >
		<c:if test="${menu.Master}">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.production.master'/>" submenuId="master"></div>
		</c:if>
		<c:if test="${menu.Master and menu.Production_Planning}" >
			<div dojoType="MenuSeparator2"></div>
		</c:if>
		<c:if test="${menu.Production_Planning}">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.production.planning'/>" onclick="go_to('<c:url value='/page/productionplanningview.htm'/>');"></div>
		</c:if>
		<c:if test="${menu.Production_Order and menu.Production_Planning}" >
			<div dojoType="MenuSeparator2"></div>
		</c:if>
		<c:if test="${menu.Production_Order}">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.production.order'/>" onclick="go_to('<c:url value='/page/productionorderview.htm'/>');"></div>
		</c:if>
		<c:if test="${menu.Production_Order and menu.Production_Material_Request}" >
			<div dojoType="MenuSeparator2"></div>
		</c:if>
		<c:if test="${menu.Production_Material_Request}">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.production.material'/>" onclick="go_to('<c:url value='/page/productionmaterialrequestview.htm'/>');"></div>
		</c:if>
		<c:if test="${menu.Production_Order_Realization and menu.Production_Material_Request}" >
			<div dojoType="MenuSeparator2"></div>
		</c:if>
		<c:if test="${menu.Production_Order_Realization}">
			<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.production.realization'/>" onclick="go_to('<c:url value='/page/productionorderrealizationview.htm'/>');"></div>
		</c:if>
	</div>

	<c:if test="${menu.Master}">
		<div dojoType="PopupMenu2" widgetId="master" >
			<c:if test="${menu.Production_Resource}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.production.master.resource'/>" onclick="go_to('<c:url value='/page/productionresourceview.htm'/>');"></div>
			</c:if>
			<c:if test="${menu.Production_Resource and menu.Production_Work_Unit}" >
				<div dojoType="MenuSeparator2"></div>
			</c:if>
			<c:if test="${menu.Production_Work_Unit}">
				<div dojoType="MenuItem2" caption="<spring:message code='sirius.menu.production.master.workunit'/>" onclick="go_to('<c:url value='/page/productionworkunitview.htm'/>');"></div>
			</c:if>
		</div>
	</c:if>

	<!-- ####### END OF PROCUREMENT ############################################################ -->


