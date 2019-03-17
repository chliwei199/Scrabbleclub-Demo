package Scrabbleclub.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Scrabbleclub.repositories.GameRepository;

@Controller
public class LeaderboardController {

	@Autowired
	GameRepository gameRepository;
	
	@RequestMapping(value = { "/leaderboard"})
	public String index(Model model) {
		
		ArrayList<HashMap<String, Object>> top10_results=gameRepository.getTop10();
		HashMap<String, Object> leaderHighestScore_results=gameRepository.getLeaderHighestScore();
		HashMap<String, Object> leaderLowestScore_results=gameRepository.getLeaderLowestScore();
		model.addAttribute("content_top10", top10_results);
		model.addAttribute("content_leaderHighestScore", leaderHighestScore_results);
		model.addAttribute("content_leaderLowestScore", leaderLowestScore_results);
		
		return "leaderboard";
	}
	
	
}