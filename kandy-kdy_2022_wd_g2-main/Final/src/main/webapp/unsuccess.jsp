<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Unsuccess</title>
<!-- CSS link -->
<link href="noticecss/noticeunsuccess.css" rel="stylesheet"/>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
<style>
     <%@ include file="noticecss/noticeunsuccess.css"%>
     body{
  background: radial-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.2),rgba(0,0,255,0.4)), url('https://images.unsplash.com/photo-1527018601619-a508a2be00cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80');
  background-repeat: no-repeat;
  background-size: 1800px 900px;
  font-family: sans-serif;
  margin: 0px;
  padding: 0px;}
</style>
</head>
<body>
 <!-- Back Button -->
<a href="noticeinsert.jsp"><button class="notice-back-button"><i class="fa fa-chevron-left" aria-hidden="true"></i></button></a>
<!-- middle banner -->
<div class = "homediv">

</div>

<!-- Unsucess message -->
<div class="not-insert-header">
<h4 class="warning_message"><i class="fa fa-exclamation-circle" aria-hidden="true"></i>&nbsp; This operation was unsuccessful</h4>
</div>
</body>
</html>