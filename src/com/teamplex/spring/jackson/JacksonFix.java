
package com.teamplex.spring.jackson;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJacksonHttpMessageConverter;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

import com.teamplex.spring.annotation.ServletComponent;

/**
 * 디폴트로 등록되는 MappingJackson은 커스텀 ObjectMapper 객체를 등록하지 않는다. 따라서 수동으로 등록해줘야 함.  
 * 
 * @author mOer
 *
 */
@ServletComponent
public class JacksonFix {
	@Autowired RequestMappingHandlerAdapter requestMappingHandlerAdapter;
	@Autowired CustomObjectMapper objectMapper;

	@PostConstruct
	public void init() {
		List<HttpMessageConverter<?>> messageConverters = requestMappingHandlerAdapter.getMessageConverters();
		
		for (HttpMessageConverter<?> messageConverter : messageConverters) {
			if (messageConverter instanceof MappingJacksonHttpMessageConverter) {
				MappingJacksonHttpMessageConverter m = (MappingJacksonHttpMessageConverter) messageConverter;
				m.setObjectMapper(objectMapper);
			}
		}
	}
	
}
