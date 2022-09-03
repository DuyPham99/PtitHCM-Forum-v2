package com.forum.respository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.forum.entity.Post;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {
	@Query(value = "SELECT * FROM forum.post\r\n"
			+ "WHERE username= ?1\r\n"
			+ "ORDER BY id_post DESC\r\n"
			+ "LIMIT 1;", nativeQuery = true)
	Post getLastPostOfUser(String username);
	
	@Query(value = "SELECT * FROM forum.post\r\n"
			+ "WHERE username= ?1\r\n"
			+ "ORDER BY id_post DESC\r\n", nativeQuery = true)
	public List<Post> getPostOfUser(String username);

	@Query(value = "SELECT * FROM forum.post\r\n"
			+ "WHERE id_category = 1\r\n"
			+ "ORDER BY id_post desc\r\n"
			+ "LIMIT 5;", nativeQuery = true)
	Optional<List<Post>> getActivePost();

	List<Post> findAllByCategory_IdCategory(int id, Pageable pageable);

	@Query(value = "SELECT * FROM forum.post\r\n"
			+ "WHERE id_category = 2\r\n"
			+ "ORDER BY id_post desc\r\n"
			+ "LIMIT 5;", nativeQuery = true)
	public List<Post> getStudyPost();
	
	@Query(value = "SELECT * FROM forum.post\r\n"
			+ "WHERE id_category = 3\r\n"
			+ "ORDER BY id_post desc\r\n"
			+ "LIMIT 5;", nativeQuery = true)
	public List<Post> getClubPost();
	
	@Query(value = "SELECT * FROM forum.post\r\n"
			+ "WHERE id_category = 4\r\n"
			+ "ORDER BY id_post desc\r\n"
			+ "LIMIT 4;", nativeQuery = true)
	public List<Post> getTalkPost();
	
	@Query(value = "SELECT * FROM forum.post\r\n"
			+ "WHERE id_category = 5\r\n"
			+ "ORDER BY id_post desc\r\n"
			+ "LIMIT 4;", nativeQuery = true)
	public List<Post> getExpPost();
	
	@Query(value = "SELECT * FROM forum.post\r\n"
			+ "WHERE id_category = 6\r\n"
			+ "ORDER BY id_post desc\r\n"
			+ "LIMIT 5;", nativeQuery = true)
	public List<Post> getAnotherPost();
	
	@Query(value = "SELECT * FROM forum.post WHERE id_category = :category", nativeQuery = true)
	Page<Post> findAll(Pageable pageable, int category);
	
	@Query(value="SELECT count(*) FROM forum.post WHERE id_category = :category", nativeQuery = true)
	public int countRecord(int category);
	
	@Query(value = "SELECT * FROM forum.post", nativeQuery = true)
	Page<Post> findAllAdmin(Pageable pageable);
}
