<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>default</title>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        </head>

        <body>
            <h1> 회원가입 페이지 </h1>
            <hr>
            <form action="/join" method="post" onsubmit="return valid()">
                <input id="username" type="text" name="username" placeholder="username" required>
                <button type="button" onclick="sameCheck()">중복확인</button><br>
                <input type="password" name="password" placeholder="password" required><br>
                <input type="email" name="email" placeholder="email" required><br>
                <button type="submit">회원가입</button>
            </form>

            <script>
                let check = false;

                //중복체크후 변경시 다시 리셋
                $("#username").keydown(() => {
                    if (check == true) {
                        check = false;
                    }
                });

                //중복체크 여부 판별
                function valid() {
                    if (check) {
                        return true;
                    } else {
                        alert("중복체크 안함");
                        return false;
                    }
                }

                // 중복체크
                function sameCheck() {
                    let username = $("#username").val();
                    $.ajax({
                        type: "get",
                        url: "/user/username-samecheck?username=" + username
                    }).done(res => {
                        console.log(res);
                        alert(res.msg);
                        check = res.object;
                    }).fail(err => { });
                }
            </script>

        </body>

        </html>