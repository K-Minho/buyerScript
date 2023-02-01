package shop.mtcoding.ajax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.ajax.dto.ResponseDto;

@Controller
public class Usercontroller {

    @GetMapping(value = "/joinForm")
    public String joinForm() {
        return "joinForm";
    }

    @GetMapping(value = "/user/username-samecheck")
    public @ResponseBody ResponseDto<?> check(String username) {
        // 입력확인 (존재하지 않을경우 500 오류)
        // 200 응답을 통해 제어함
        if (username == null || username.isEmpty()) {
            return new ResponseDto<>(-1, "insert username", null);
        }
        // 중복확인
        if (username.equals("ssar")) {
            return new ResponseDto<>(-1, "already has exit", false);
        } else {
            return new ResponseDto<>(1, "can use this one", true);
        }
    }

}
