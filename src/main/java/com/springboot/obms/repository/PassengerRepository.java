package com.springboot.obms.repository;

import com.springboot.obms.model.Passenger;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import io.swagger.v3.oas.annotations.tags.Tag;


@Tag(name = "Passenger - Rest API Controllers", description = "Passenger API")
@RepositoryRestResource(collectionResourceRel = "passenger", path="passenger")
public interface PassengerRepository extends JpaRepository<Passenger, Integer> {

	public Passenger findByEmail(@Param("email") String email);
}
