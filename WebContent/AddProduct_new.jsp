<!DOCTYPE html>
<html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<head>
  <title>CELEPROKART</title>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <style>
  body{
  background-image:url("http://72gpf1za5iq428ekh3r7qjc1.wpengine.netdna-cdn.com/wp-content/uploads/2015/04/ecommerce.jpg");
  background-repeat:no-repeat;
  background-size:cover;
  }
  
  </style>
  <body>
  <div class="container">
  <div class="row">
  <div class="col-md-offset-4 col-md-4">
  
  <h1 align="center">PRODUCT</h1>
  <form action="ProductDAO" method="post" enctype="multipart/form-data">
  <div class="form-group" >
  <label for="text">Name</label>
  <input type="text" class="form-control" id="text" name="ProductName"/>
  </div>
  <div class="form-group" >
  <label for="text">Category</label>
  <select name="Category" id="selectboxid_category" class="form-control" required>
					<option value="Sports">Sports</option>
					<option value="Electronic Gadgets">Electronic Gadgets</option>
					<option value="Clothes">Clothes</option>
					<option value="Accessories">Accessories</option>
					<option value="Musical Instruments">Musical Instruments</option>
					<option value="Handmade">Handmade</option>
				</select>
  </div>
  <div class="form-group" >
  <label for="text">Sell Or Donate</label>
  <select name="SellOrDonate" id="selectboxid_sellDonate" class="form-control" required>
					<option value="Sell">Sell</option>
					<option value="Donate">Donate</option>
				</select>
  </div>
  <div class="form-group" >
  <label for="text">Set price</label>
  <input type="text" name="Price" class="form-control" ng-model="Price" required/>
  </div><br>
  <div class="form-group" >
  <label for="text">Charity</label>
  <select name="Charity" id="selectboxid_Charity" class="form-control" ng-model="Charity" required>
					<option value="Charity1">Charity1</option>
					<option value="Charity2">Charity2</option>
				</select>
  </div><br>
  <div class="form-group" >
  <label for="text">Image</label>
  <input type="file" name="file" class="form-control" ng-model="file"/>
  </div><br>
   <div class="col-md-offset-4">
   <div class="form-group" >
  <input type="submit" class="btn btn-danger" id="submit" value="Add Product" align="center" name="AddProduct"/>
  </div>
  
  </div>
  </form>
  </div>
  </div>
  </div>
  </body>
</html>
