<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ include file="/common/tld-common.jsp"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" +request.getServerPort()+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<head>
	<title>Reimbursement Requisition Print</title>
	<style type="text/css" media="screen">
		<!-- @import url("assets/sirius.css"); -->
		<!-- @import url("css/report_format.css"); -->
    </style>
    
    <style type="text/css" media="print">
		<!-- @import url("css/print_format.css"); -->
    </style>
	
	<script type="text/javascript">	
		function printPage(){print();}
	</script>
</head>

<body>
	<div class="area" id="quick_link_container"><%@ include file="/common/sirius-header.jsp"%></div>

	<div id="se-r00">
		<div id="se-r01">&nbsp;</div>
		<div id="se-r02">&nbsp;</div>
	</div>

	<div id="se-containers">
        <div class="area" id="quick_link_container"><%@ include file="/common/sirius-menu.jsp"%></div>	
        
        <div id="r11">
            <div id="r12">
                <div id="r13">
                    <div id="r14">
                        <div id="se-contents">
                            <div class="main-box">
                            	<table style="border:none" cellpadding="5" cellspacing="0" width="100%">
                                <tbody>
                                <tr>
                                	<td colspan="3">Bayar Kepada : <c:out value='${requisition.requisitioner.firstName} ${requisition.requisitioner.lastName} ${requisition.requisitioner.middleName}'/></td>
                                    <td colspan="3">&nbsp;</td>
                                    <td colspan="2">No Bukti : <c:out value='${requisition.code}'/></td>
                                </tr>
                                <tr>
                                	<td colspan="3">&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
                                    <td colspan="2">Tanggal : <fmt:formatDate value='${requisition.date}' pattern='dd-MM-yyyy'/></td>
                                </tr>
                                <tr>
                                	<td colspan="8" align="center"><h3>BUKTI PENGELUARAN KAS</h3></td>
                                </tr>
                                <tr>
                               	 	<td colspan="2" style="border-top:solid 1px black;border-bottom:solid 1px black;border-right:solid 1px black;">No. Perkiraan</td>
                                    <td colspan="4" style="border:solid 1px black;border-left:none;">Keterangan</td>
                                    <td width="35%" colspan="2" style="border-top:solid 1px black;border-bottom:solid 1px black;">Jumlah</td>
                                </tr>
                                <c:forEach items='${requisition.items}' var='item'>
                                <tr>
                                	<td colspan="2" style="border-right:solid 1px black;"><c:out value='${item.journalSchema.account.code} ${item.journalSchema.account.name}'/></td>
                                  	<td colspan="4" style="border-right:solid 1px black;"><c:out value='${item.journalSchema.name}'/></td>
                                    <td colspan="2" align="right"><fmt:formatNumber value='${item.amount}' pattern=',##0.00'/></td>
                                </tr>
                                </c:forEach>
                                <tr>
                                	<td height="60" colspan="2" style="border-right:solid 1px black;">&nbsp;</td>
                                  	<td colspan="4" style="border-right:solid 1px black;">&nbsp;</td>
                                    <td colspan="2" align="right">&nbsp;</td>
                                </tr>
                                <tr>
                                	<td colspan="2" style="border-bottom:solid 1px black;border-right:solid 1px black;border-top:solid 1px black">Produk :</td>
                                	<td colspan="3" style="border-bottom:solid 1px black;border-top:solid 1px black">Inter To :</td>
                                	<td style="border-bottom:solid 1px black;border-top:solid 1px black" align="right">Jumlah :</td>
                                    <td colspan="2" style="border-bottom:solid 1px black;border-top:solid 1px black" align="right"><fmt:formatNumber value='${total}' pattern=',##0.00'/></td>
                                </tr>
                                <tr>
                                	<td colspan="2" style="border-right:solid 1px black;">Dept/div :</td>
                                	<td colspan="2" style="border-right:solid 1px black;">Finance Department :</td>
                                	<td colspan="4">Terbilang : <c:out value='${say}'/></td>
                                </tr>
                                <tr>
                                	<td colspan="2" style="border-right:solid 1px black;">Dibuat oleh :</td>
                                	<td colspan="2" style="border-right:solid 1px black;">Diperiksa oleh :</td>
                                	<td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                	<td height="59" colspan="2" style="border-right:solid 1px black;">&nbsp;</td>
                           	  	  <td colspan="2" style="border-right:solid 1px black;">&nbsp;</td>
                                	<td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                	<td colspan="2" style="border-right:solid 1px black;border-bottom:solid 1px black;">Nama : <c:out value='${requisition.createdBy.firstName} ${requisition.createdBy.middleName} ${requisition.createdBy.lastName}'/></td>
                                	<td colspan="2" style="border-right:solid 1px black;border-bottom:solid 1px black;">&nbsp;</td>
                                	<td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                	<td colspan="2" style="border-right:solid 1px black;">Atasan Langsung :</td>
                                	<td colspan="2" style="border-right:solid 1px black;">Disetujui Oleh</td>
                                	<td colspan="4">Penerima</td>
                                </tr>
                                <tr>
                                	<td height="57" colspan="2" style="border-right:solid 1px black;">&nbsp;</td>
                           	  	  <td colspan="2" style="border-right:solid 1px black;">&nbsp;</td>
                                	<td colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                	<td colspan="2" style="border-right:solid 1px black;border-bottom:solid 1px black;">Nama :</td>
                                	<td colspan="2" style="border-right:solid 1px black;border-bottom:solid 1px black;"><c:out value='${requisition.approver.firstName} ${requisition.approver.middleName} ${requisition.approver.lastName}'/></td>
                                	<td colspan="2" style="border-bottom:solid 1px black;">Nama :</td>
                                    <td colspan="2" style="border-bottom:solid 1px black;">Tgl :</td>
                                </tr>
                                <tr>
                                	<td colspan="5">Harus diisi dengan lengkap</td>
                                	<td colspan="3">Lampiran : Semua bukti asli</td>
                                </tr>
                                </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div style="clear:both;height:0px">&nbsp;</div>
        <div id="footer"><div><span>&copy; 2011 siriusERP v1.6-GA</span></div></div>
        <div style="clear:both;height:20px">&nbsp;</div>
	</div>
</body>
</html>
