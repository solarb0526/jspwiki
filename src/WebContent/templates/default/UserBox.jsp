<%@ taglib uri="http://jakarta.apache.org/jspwiki.tld" prefix="wiki" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://stripes.sourceforge.net/stripes.tld" prefix="stripes" %>
<div class="userbox">

  <wiki:UserCheck status="anonymous">
    <span class="username anonymous">
      <fmt:message key="fav.greet.anonymous" />
    </span>
  </wiki:UserCheck>
  <wiki:UserCheck status="asserted">
    <span class="username asserted">
      <fmt:message key="fav.greet.asserted">
      <fmt:param><wiki:Translate>[<wiki:UserName/>]</wiki:Translate></fmt:param>
    </fmt:message>
    </span>
  </wiki:UserCheck>
  <wiki:UserCheck status="authenticated">
    <span class="username authenticated">
      <fmt:message key="fav.greet.authenticated">
        <fmt:param><wiki:Translate>[<wiki:UserName/>]</wiki:Translate></fmt:param>
      </fmt:message>
    </span>
  </wiki:UserCheck>

  <%-- action buttons --%>
  <wiki:UserCheck status="notAuthenticated">
    <wiki:CheckRequestContext context='!login'>
      <wiki:Permission permission="login">
        <c:set var="loginTitle"><fmt:message key='actions.login.title' /></c:set>
        <stripes:link
          beanclass="org.apache.wiki.action.LoginActionBean"
          class="action login"
          title="${loginTitle}">
          <stripes:param name="redirect" value="${wikiContext.page.name}" />
          <fmt:message key="actions.login"/>
        </stripes:link>
      </wiki:Permission>
    </wiki:CheckRequestContext>
  </wiki:UserCheck>
  
  <wiki:UserCheck status="authenticated">
    <c:set var="logoutTitle"><fmt:message key='actions.logout.title' /></c:set>
    <stripes:link
      beanclass="org.apache.wiki.action.LoginActionBean" event="logout"
      class="action logout"
      title="${logoutTitle}">
      <fmt:message key="actions.login"/>
    </stripes:link>
  </wiki:UserCheck>

  <wiki:CheckRequestContext context='!prefs'>
    <wiki:CheckRequestContext context='!preview'>
      <c:set var="prefsTitle"><fmt:message key='actions.prefs.title' /></c:set>
      <stripes:link
        beanclass="org.apache.wiki.action.UserPreferencesActionBean"
        class="action prefs" accesskey="p"
        title="${prefsTitle}">
        <stripes:param name="redirect" value="${wikiContext.page.name}" />
        <fmt:message key="actions.prefs"/>
      </stripes:link>
    </wiki:CheckRequestContext>
  </wiki:CheckRequestContext>

  <div class="clearbox"></div>

</div>