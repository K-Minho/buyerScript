package shop.mtcoding.ajax.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ResponseDto<O> {
    private int code;
    private String msg;
    private O object;
    // 제너릭에 ?를 넣으면 object의 모든 구조를 사용가능함

}
