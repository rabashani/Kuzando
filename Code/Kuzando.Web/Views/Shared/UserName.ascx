﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<StackUnderflow.Model.Entities.User>" %>
<span class="user-name">
<%= Html.ActionLink(Model.Name, "Details", "User", new { Id = Model.Id }, null)%>
</span>