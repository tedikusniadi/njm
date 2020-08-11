<%@ include file="/common/tld-common.jsp"%>	
                                <table width="60%">
                               <tr>
                                  <td colspan="3" class="pageTitle">Profit Loss Consecutive</td>
                                </tr>
                                <tr>
                                  <td colspan="3" class="pageTitle">&nbsp;</td>
                                </tr>
                                <tr >
                                    <td width="15%">Period</td>
                                    <td width="1%">:</td>
                                    <td width="84%">
                                            ${criteria.year}
                                    </td>
                                </tr>
                                <tr >			  
                                    <td>Company</td>
                                    <td>:</td>
                                    <td>
                                        <c:forEach items='${criteria.organizations}' var='org'>
                                            <c:out value='${org.firstName} ${org.middleName} ${org.lastName}'/>
                                        </c:forEach>
                                    </td>
                                </tr>
                                </table>
                                <br/>                       
                                <table style ="width: 150%;" cellpadding="4" cellspacing="0" class="report-table" >
                                <thead>
                                <tr>
                                  <th width="60%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">Profit And Loss</th>
                                  <c:forEach items='${months}' var='month'>
                                      <th width="8%" align="left" style="border-bottom:1px solid black;border-top:1px solid black;">${month.normalizedName}</th>
                                  </c:forEach>
                                </tr>
                                </thead>
                                <tbody>
                              <c:forEach items='${adapter.consecutiveGrouped}' var='grup'>
                                <c:if test="${not empty grup.head}">
                                    <tr>
                                      <td>
                                        <strong>${grup.head}</strong>
                                      </td>
                                      <td align="right">
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
                                                <c:if test='${account.value.january> 0}'>
                                                    <fmt:formatNumber value='${account.value.january}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.january < 0}'>
                                                    (<fmt:formatNumber value='${account.value.january * -1}' pattern=',##0.00'/>)
                                                </c:if>
                                           </td>
                                             <td align="right">
                                                <c:if test='${account.value.febuary> 0}'>
                                                    <fmt:formatNumber value='${account.value.febuary}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.febuary < 0}'>
                                                    (<fmt:formatNumber value='${account.value.febuary * -1}' pattern=',##0.00'/>)
                                                </c:if>
                                           </td>
                                             <td align="right">
                                                <c:if test='${account.value.march> 0}'>
                                                    <fmt:formatNumber value='${account.value.march}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.march < 0}'>
                                                    (<fmt:formatNumber value='${account.value.march * -1}' pattern=',##0.00'/>)
                                                </c:if>
                                           </td>
                                             <td align="right">
                                                <c:if test='${account.value.april> 0}'>
                                                    <fmt:formatNumber value='${account.value.april}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.april < 0}'>
                                                    (<fmt:formatNumber value='${account.value.april * -1}' pattern=',##0.00'/>)
                                                </c:if>
                                           </td>
                                             <td align="right">
                                                <c:if test='${account.value.may> 0}'>
                                                    <fmt:formatNumber value='${account.value.may}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.may < 0}'>
                                                    (<fmt:formatNumber value='${account.value.may * -1}' pattern=',##0.00'/>)
                                                </c:if>
                                           </td>
                                             <td align="right">
                                                <c:if test='${account.value.june> 0}'>
                                                    <fmt:formatNumber value='${account.value.june}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.june < 0}'>
                                                    (<fmt:formatNumber value='${account.value.june * -1}' pattern=',##0.00'/>)
                                                </c:if>
                                           </td>
                                             <td align="right">
                                                <c:if test='${account.value.july> 0}'>
                                                    <fmt:formatNumber value='${account.value.july}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.july < 0}'>
                                                    (<fmt:formatNumber value='${account.value.july * -1}' pattern=',##0.00'/>)
                                                </c:if>
                                           </td>
                                             <td align="right">
                                                <c:if test='${account.value.august> 0}'>
                                                    <fmt:formatNumber value='${account.value.august}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.august < 0}'>
                                                    (<fmt:formatNumber value='${account.value.august * -1}' pattern=',##0.00'/>)
                                                </c:if>
                                           </td>
                                            <td align="right">
                                                <c:if test='${account.value.september> 0}'>
                                                    <fmt:formatNumber value='${account.value.september}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.september < 0}'>
                                                    (<fmt:formatNumber value='${account.value.september * -1}' pattern=',##0.00'/>)
                                                </c:if>
                                           </td>
                                            <td align="right">
                                                <c:if test='${account.value.october> 0}'>
                                                    <fmt:formatNumber value='${account.value.october}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.october < 0}'>
                                                    (<fmt:formatNumber value='${account.value.october * -1}' pattern=',##0.00'/>)
                                                </c:if>
                                           </td>
                                            <td align="right">
                                                <c:if test='${account.value.november> 0}'>
                                                    <fmt:formatNumber value='${account.value.november}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.november < 0}'>
                                                    (<fmt:formatNumber value='${account.value.november * -1}' pattern=',##0.00'/>)
                                                </c:if>
                                           </td>
                                            <td align="right">
                                                <c:if test='${account.value.december> 0}'>
                                                    <fmt:formatNumber value='${account.value.december}' pattern=',##0.00'/>
                                                </c:if>
                                                <c:if test='${account.value.december < 0}'>
                                                    (<fmt:formatNumber value='${account.value.december * -1}' pattern=',##0.00'/>)
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
                                            <c:if test='${grup.totalJan> 0}'>
                                                <fmt:formatNumber value='${grup.totalJan}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalJan < 0}'>
                                                (<fmt:formatNumber value='${grup.totalJan * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                       </td>
                                       <td align="right">
                                        <strong>
                                            <c:if test='${grup.totalFeb> 0}'>
                                                <fmt:formatNumber value='${grup.totalFeb}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalFeb < 0}'>
                                                (<fmt:formatNumber value='${grup.totalFeb * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                       </td>
                                       <td align="right">
                                        <strong>
                                            <c:if test='${grup.totalMar> 0}'>
                                                <fmt:formatNumber value='${grup.totalMar}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalMar < 0}'>
                                                (<fmt:formatNumber value='${grup.totalMar * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                       </td>
                                       <td align="right">
                                        <strong>
                                            <c:if test='${grup.totalApr> 0}'>
                                                <fmt:formatNumber value='${grup.totalApr}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalApr < 0}'>
                                                (<fmt:formatNumber value='${grup.totalApr * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                       </td>
                                       <td align="right">
                                        <strong>
                                            <c:if test='${grup.totalMay> 0}'>
                                                <fmt:formatNumber value='${grup.totalMay}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalMay < 0}'>
                                                (<fmt:formatNumber value='${grup.totalMay * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                       </td>
                                       <td align="right">
                                        <strong>
                                            <c:if test='${grup.totalJun> 0}'>
                                                <fmt:formatNumber value='${grup.totalJun}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalJun < 0}'>
                                                (<fmt:formatNumber value='${grup.totalJun * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                       </td>
                                       <td align="right">
                                        <strong>
                                            <c:if test='${grup.totalJul> 0}'>
                                                <fmt:formatNumber value='${grup.totalJul}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalJul < 0}'>
                                                (<fmt:formatNumber value='${grup.totalJul * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                       </td>
                                       <td align="right">
                                        <strong>
                                            <c:if test='${grup.totalAug> 0}'>
                                                <fmt:formatNumber value='${grup.totalAug}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalAug < 0}'>
                                                (<fmt:formatNumber value='${grup.totalAug * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                       </td>
                                       <td align="right">
                                        <strong>
                                            <c:if test='${grup.totalSep> 0}'>
                                                <fmt:formatNumber value='${grup.totalSep}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalSep < 0}'>
                                                (<fmt:formatNumber value='${grup.totalSep * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                       </td>
                                       <td align="right">
                                        <strong>
                                            <c:if test='${grup.totalOct> 0}'>
                                                <fmt:formatNumber value='${grup.totalOct}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalOct < 0}'>
                                                (<fmt:formatNumber value='${grup.totalOct * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                       </td>
                                       <td align="right">
                                        <strong>
                                            <c:if test='${grup.totalNov> 0}'>
                                                <fmt:formatNumber value='${grup.totalNov}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalNov < 0}'>
                                                (<fmt:formatNumber value='${grup.totalNov * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                        </strong>
                                       </td>
                                       <td align="right">
                                        <strong>
                                            <c:if test='${grup.totalDec> 0}'>
                                                <fmt:formatNumber value='${grup.totalDec}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${grup.totalDec < 0}'>
                                                (<fmt:formatNumber value='${grup.totalDec * -1}' pattern=',##0.00'/>)
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
                                    <td align="right"><strong>Net Income : </strong></td>
                                    <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandJan > 0}'>
                                                <fmt:formatNumber value='${adapter.grandJan}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandJan < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandJan * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                  <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandFeb > 0}'>
                                                <fmt:formatNumber value='${adapter.grandFeb}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandFeb < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandFeb * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                  <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandMar > 0}'>
                                                <fmt:formatNumber value='${adapter.grandMar}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandMar < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandMar * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                  <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandApr > 0}'>
                                                <fmt:formatNumber value='${adapter.grandApr}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandApr < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandApr * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                  <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandMay > 0}'>
                                                <fmt:formatNumber value='${adapter.grandMay}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandMay < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandMay * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                  <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandJun > 0}'>
                                                <fmt:formatNumber value='${adapter.grandJun}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandJun < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandJun * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                  <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandJul > 0}'>
                                                <fmt:formatNumber value='${adapter.grandJul}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandJul < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandJul * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                  <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandAug > 0}'>
                                                <fmt:formatNumber value='${adapter.grandAug}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandAug < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandAug * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                  <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandSep > 0}'>
                                                <fmt:formatNumber value='${adapter.grandSep}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandSep < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandSep * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                  <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandOct > 0}'>
                                                <fmt:formatNumber value='${adapter.grandOct}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandOct < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandOct * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                  <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandNov > 0}'>
                                                <fmt:formatNumber value='${adapter.grandNov}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandNov < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandNov * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                  <td align="right"  style="{border-left: 1px solid black;}">
                                       	<strong>
                                            <c:if test='${adapter.grandDec > 0}'>
                                                <fmt:formatNumber value='${adapter.grandDec}' pattern=',##0.00'/>
                                            </c:if>
                                            <c:if test='${adapter.grandDec < 0}'>
                                                (<fmt:formatNumber value='${adapter.grandDec * -1}' pattern=',##0.00'/>)
                                            </c:if>
                                      </strong>                                            
                                  </td>
                                </tr>
                                 </tbody>
                                </table>