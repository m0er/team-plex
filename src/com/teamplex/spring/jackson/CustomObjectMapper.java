package com.teamplex.spring.jackson;

import org.bson.types.ObjectId;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ser.CustomSerializerFactory;

import com.teamplex.spring.annotation.ServletComponent;

/**
 * MappingJackson에 커스텀 시리얼라이저(일종의 컨터버)를 등록하기 위해 사용한다.
 * 
 * @author mOer
 *
 */
@ServletComponent
public class CustomObjectMapper extends ObjectMapper {
	
	public CustomObjectMapper() {
		CustomSerializerFactory sf = new CustomSerializerFactory();
        sf.addSpecificMapping(ObjectId.class, new ObjectIdSerializer());
        this.setSerializerFactory(sf);
	}
}
