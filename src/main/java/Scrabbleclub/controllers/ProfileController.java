package Scrabbleclub.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import Scrabbleclub.entities.Member;
import Scrabbleclub.repositories.GameRepository;
import Scrabbleclub.repositories.MemberRepository;

@Controller
public class ProfileController {
	@Autowired
	MemberRepository repository;

	@Autowired
	GameRepository gameRepository;
	
	@RequestMapping(value = { "/profile"})
	public String index(Model model) {
		
		ArrayList<HashMap<String, Object>> results = new ArrayList<HashMap<String, Object>>();
	
		for (Member cust : repository.findAll()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("member_id", cust.getMember_id());
				map.put("name", cust.getName());
				results.add(map);
		}
	
		ArrayList<HashMap<String, Object>> winner_results=gameRepository.getWinAndAvg();
		ArrayList<HashMap<String, Object>> loser_results=gameRepository.getLose();
		ArrayList<HashMap<String, Object>> HighScore_results=gameRepository.getHighScore();
		model.addAttribute("content", results);
		model.addAttribute("content_winner", winner_results);
		model.addAttribute("content_loser", loser_results);
		model.addAttribute("content_HighScore", HighScore_results);
		
		return "profile";
	}
	
	@RequestMapping(value = { "/scoreDetail/{memberid}"})
	@ResponseBody
	public String scoreDetail(@PathVariable String memberid) throws JsonProcessingException {
	
		HashMap<String, Object> HighScore_results=gameRepository.getHighScoreDetail(memberid);
		ObjectMapper mapper = new ObjectMapper();
		String jsonInString = mapper.writeValueAsString(HighScore_results);
	
		return jsonInString;
	}
	
}