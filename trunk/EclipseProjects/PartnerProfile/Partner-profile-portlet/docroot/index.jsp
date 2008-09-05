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

<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>

<f:view>
	<f:loadBundle basename="Language" var="msgs" />

	<h:form>
		<table class="lfr-table">
		<tr>
			<td>
				<h:outputText value="#{msgs.first_name}" />
			</td>
			<td>
				<h:inputText id="name" required="true" value="#{user.name}" />
			</td>
			
			<td>
				<h:message for="name" />
			</td>
		</tr>
		<tr>
			<td>
				<h:outputText value="#{msgs.last_name}" />
			</td>
			<td>
				<h:inputText id="name" required="true" value="#{user.name}" />
			</td>
			
			<td>
				<h:message for="name" />
			</td>
		</tr>

		<tr>
			<td>
				<h:outputText value="#{msgs.company_name}" />
			</td>
			<td>
				<h:inputText id="name" required="true" value="#{user.name}" />
			</td>
			
			<td>
				<h:message for="name" />
			</td>
		</tr>

		<tr>
			<td>
				<h:outputText value="#{msgs.company_position}" />
			</td>
			<td>
				<h:inputText id="name" required="true" value="#{user.name}" />
			</td>
			
			<td>
				<h:message for="name" />
			</td>
		</tr>
		
		<tr>
			<td>
				<h:outputText value="#{msgs.mobile_phone}" />
			</td>
			<td>
				<h:inputText id="name" required="true" value="#{user.name}" />
			</td>
			
			<td>
				<h:message for="name" />
			</td>
		</tr>

		<tr>
			<td>
				<h:outputText value="#{msgs.work_phone}" />
			</td>
			<td>
				<h:inputText id="name" required="true" value="#{user.name}" />
			</td>
			
			<td>
				<h:message for="name" />
			</td>
		</tr>
		
		
		</table>

		<br />

		<h:commandButton action="submit" value="Submit" />
	</h:form>
</f:view>