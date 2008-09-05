<%
/**
 * Copyright (c) 2000-2008 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet" %>

<%@ page import="com.sample.searchprofile.model.UserItem" %>
<%@ page import="com.sample.searchprofile.model.CountryItem" %>
<%@ page import="com.sample.searchprofile.model.CompanyItem" %>
<%@ page import="com.sample.searchprofile.model.BusinesstypeItem" %>
<%@ page import="com.sample.searchprofile.model.UserItemDAO" %>
<%@ page import="com.sample.searchprofile.model.CountryItemDAO" %>
<%@ page import="com.sample.searchprofile.model.CompanyItemDAO" %>
<%@ page import="com.sample.searchprofile.model.AdressItem" %>
<%@ page import="com.sample.searchprofile.model.AdressItemDAO" %>
<%@ page import="com.sample.searchprofile.model.BusinesstypeItemDAO" %>
<%@ page import="com.sample.searchprofile.model.CompanyToBusinesstypeItemDAO" %>
<%@ page import="com.sample.searchprofile.model.SAPSolutionItem" %>
<%@ page import="com.sample.searchprofile.model.SAPSolutionItemDAO" %>
<%@ page import="com.sample.searchprofile.model.IndustryItem" %>
<%@ page import="com.sample.searchprofile.model.IndustryItemDAO" %>
<%@ page import="com.sample.searchprofile.util.ConnectionPool" %>
<%@ page import="com.sample.searchprofile.model.CompanyUtil" %>

<%@ page import="java.util.List" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.lang.Math" %>

<%@ page import="javax.portlet.WindowState" %>

<portlet:defineObjects />

