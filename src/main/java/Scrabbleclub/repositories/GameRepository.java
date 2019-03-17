package Scrabbleclub.repositories;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface GameRepository {
	ArrayList<HashMap<String, Object>> getWinAndAvg();
	ArrayList<HashMap<String, Object>> getLose();
	ArrayList<HashMap<String, Object>> getHighScore();
	HashMap<String, Object> getHighScoreDetail(@Param("member_id") String member_id);
	ArrayList<HashMap<String, Object>> getTop10();
	HashMap<String, Object> getLeaderHighestScore();
	HashMap<String, Object> getLeaderLowestScore();
}
