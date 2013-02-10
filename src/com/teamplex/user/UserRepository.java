package com.teamplex.user;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;

import com.teamplex.security.Role;

public interface UserRepository extends MongoRepository<User, ObjectId> {

	User findOneByEmailAndPassword(String email, String password);
	
	User findOneByIdAndPassword(ObjectId id, String password);
	
	List<User> findByTagsValue(String value);
	
	@Query(value = "{ 'id' : ?0 }", fields = "{password: 0}")
	User findOneSimpleById(ObjectId id);
	
	@Query(value = "{ 'tags.value' : ?0 }", fields = "{password: 0}")
	List<User> findSimpleByTagsValue(String value);
	
	@Query(value = "{}", fields = "{password: 0}")
	List<User> findAllSimple();
	
	@Query(value = "{}", fields = "{password: 0}")
	List<User> findAllSimplePageable(Pageable pageable);
	
	User findOneByEmail(String email);
	
	@Query(value = "{ 'role' : ?0 }", fields = "{password: 0}")
	List<User> findSimpleByRole(Role role);
	
}
