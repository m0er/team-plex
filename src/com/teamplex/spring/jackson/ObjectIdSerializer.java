package com.teamplex.spring.jackson;

import java.io.IOException;

import org.bson.types.ObjectId;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;

import com.teamplex.spring.annotation.ServletComponent;

/**
 * {@link org.bson.types.ObjectId}를 객체가 아닌 String 타입으로 변환하기 위한 시리얼라이저.
 * 
 * @author mOer
 *
 */
@ServletComponent
public class ObjectIdSerializer extends JsonSerializer<ObjectId> {
	
    @Override
    public void serialize(ObjectId value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        jgen.writeString(value.toString());
    }

}
