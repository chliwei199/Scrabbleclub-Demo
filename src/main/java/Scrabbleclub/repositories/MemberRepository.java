package Scrabbleclub.repositories;

import org.springframework.data.repository.CrudRepository;

import Scrabbleclub.entities.Member;

public interface MemberRepository extends CrudRepository<Member, Long> {
	
}
