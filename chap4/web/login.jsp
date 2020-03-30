<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Login</title>
  <link rel="stylesheet" type="text/css" href="style.css"/>
  <script language=JavaScript>
    today=new Date();
    document.write(
            "<font color='#4682b4' size='2'>",today,"</font>" );
  </script>
</head>
<body>
<div class="show-login-btn">
  -> 开始登录
</div>

<div class="login-box">
  <div class="hide-login-btn">
    +
  </div>
  <form action="login_check.jsp" method="POST" class="login-form">
    <h1>欢迎登录</h1>
    <input class="txtb" type="text" name="userid" placeholder="Username" />
    <input class="txtb" type="password" name="password" placeholder="Password" />
    <input class="login-btn" type="submit" name="" value="登录" />
  </form>
</div>
<script type="text/javascript">
  function hasClass(element, clssname) {
    return element.className.match(new RegExp('(\\s|^)' + clssname + '(\\s|$)'))
  }
  function addClass(element, clssname) {
    if (!this.hasClass(element, clssname)) element.className += ' ' + clssname
  }
  function removeClass(element, clssname) {
    if (hasClass(element, clssname)) {
      var reg = new RegExp('(\\s|^)' + clssname + '(\\s|$)')
      element.className = element.className.replace(reg, ' ')
    }
  }
  function toggleClass(element, clssname) {
    if (hasClass(element, clssname)) {
      removeClass(element, clssname)
    } else {
      addClass(element, clssname)
    }
  }
  var loginBox = document.getElementsByClassName('login-box')
  var showBtn = document.getElementsByClassName('show-login-btn')
  var hideBtn = document.getElementsByClassName('hide-login-btn')
  showBtn[0].addEventListener('click', function() {
    toggleClass(loginBox[0], 'showed')
  })
  hideBtn[0].addEventListener('click', function() {
    toggleClass(loginBox[0], 'showed')
  })
</script>
</body>
</html>