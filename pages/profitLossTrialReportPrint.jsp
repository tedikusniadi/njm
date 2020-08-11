<%@ include file="/common/tld-common.jsp"%>	
<table width="60%">
      <tr>
        <td colspan="3" class="pageTitle">Profit And Loss Trial</td>
      </tr>
      <tr>
        <td colspan="3" class="pageTitle">&nbsp;</td>
      </tr>
      <tr >
          <td width="15%">Period</td>
          <td width="1%">:</td>
          <td width="84%">
              <c:forEach items='${criteria.accountingPeriods}' var='period'>
                  ${period.name},
              </c:forEach>
          </td>
      </tr>
      <tr >			  
          <td>Company</td>
          <td>:</td>
          <td>
              <c:forEach items='${criteria.organizations}' var='org'>
                  <c:out value='${org.firstName} ${org.middleName} ${org.lastName}'/>,
              </c:forEach>
          </td>
      </tr>
      </table>
      <br/>
    <table style="width:80%;" cellpadding="4" cellspacing="0" class="report-table">
      <c:forEach items='${adapter.grouped}' var='grup'>
      <c:if test="${not empty grup.head}">
          <tr>
            <td width="60%">
              <strong>${grup.head}</strong>
            </td>
            <td width="20%" align="right">
              &nbsp;
            </td>
          </tr>   
        </c:if>
          <c:forEach items='${grup.parents}' var='parent'>
              <c:forEach items='${parent.value.accounts}' var='account'>
              <tr>
                  <td>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value='${account.value.account.code} - '/>
                      <c:if test="${criteria.aliases == 'name'}">
                          ${account.value.account.name}
                      </c:if>
                      <c:if test="${criteria.aliases == 'alias'}">
                          ${account.value.account.alias}
                      </c:if>
                  </td>
                  <td align="right">
                      <c:if test='${account.value.amount> 0}'>
                          <fmt:formatNumber value='${account.value.amount}' pattern=',##0.00'/>
                      </c:if>
                      <c:if test='${account.value.amount < 0}'>
                          (<fmt:formatNumber value='${account.value.amount * -1}' pattern=',##0.00'/>)
                      </c:if>
                 </td>
              </tr>
              </c:forEach>
          </c:forEach>
          <c:if test="${not empty grup.foot}">
          <tr>
            <td align="right"><strong>${grup.foot} : </strong></td>
             <td align="right">
              <strong>
                  <c:if test='${grup.total> 0}'>
                      <fmt:formatNumber value='${grup.total}' pattern=',##0.00'/>
                  </c:if>
                  <c:if test='${grup.total < 0}'>
                      (<fmt:formatNumber value='${grup.total * -1}' pattern=',##0.00'/>)
                  </c:if>
              </strong>
             </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
             <td>&nbsp;</td>
          </tr>
        </c:if>     
      </c:forEach>
      <tr >
          <td><strong>Net Income</strong></td>
          <td align="right"  style="{border-left: 1px solid black;}">
             	<strong>
                  <c:if test='${adapter.grand > 0}'>
                      <fmt:formatNumber value='${adapter.grand}' pattern=',##0.00'/>
                  </c:if>
                  <c:if test='${adapter.grand < 0}'>
                      (<fmt:formatNumber value='${adapter.grand * -1}' pattern=',##0.00'/>)
                  </c:if>
              </strong>                                            
          </td>
        </tr>
</table>