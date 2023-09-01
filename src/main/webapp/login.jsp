<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Login Page</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      $(document).ready(function () {
        $("form").submit(function (event) {
          var userID = $("input[name='userID']").val();
          var password = $("input[name='password']").val();

          if (userID === "" || password === "") {
            event.preventDefault(); 
            alert("User ID and Password are required.");
          }
        });
      });
    </script>
  </head>
  <body>
    <h1>Login Page</h1>
    <form action="login" method="post">
      User ID: <input type="text" name="userID" required /><br />
      Password: <input type="password" name="password" required /><br />
      <input type="submit" value="Login" />
    </form>
    <p>${error}</p>
  </body>
</html>
