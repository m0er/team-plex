package com.teamplex.spring.annotation;

import java.lang.annotation.*;

import org.springframework.stereotype.Component;

import com.teamplex.spring.jackson.*;

/**
 * applicationContext에서 @Controller 를 제외하고 빈 등록을 하는데, ServletContext와 의존성을 갖는
 * 컴포넌트({@link JacksonFix}, {@link CustomObjectMapper}, {@link ObjectIdSerializer} 등)의
 * 경우 빈 생성 중 예외가 발생 할 수 있다.
 * 
 * ServletComponent 어노테이션을 붙인 빈은 ServletContext에서 빈으로 생성된다.
 * 
 * @author mOer
 *
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Component
public @interface ServletComponent {
	
	String value() default "";
	
}
