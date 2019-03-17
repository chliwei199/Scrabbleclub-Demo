package Scrabbleclub.controllers;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import Scrabbleclub.entities.Member;
import Scrabbleclub.repositories.MemberRepository;

@Controller
public class MemberController {
	@Autowired
	MemberRepository repository;

	@RequestMapping(value = { "/", "/index" })
	public String index(Model model) {
		
		ArrayList<HashMap<String, Object>> result = new ArrayList<HashMap<String, Object>>();
		for (Member cust : repository.findAll()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_id", cust.getMember_id());
			map.put("name", cust.getName());
			map.put("phone", cust.getPhone());
			map.put("create_at", cust.getCreate_at());
			result.add(map);
		}
		model.addAttribute("content", result);
		
		return "index";
	}

	@GetMapping("/signup")
	public String signup(Model model) {
		return "signup";
	}

	@PostMapping(value = "/signup", consumes = "application/json")
	public ResponseEntity signupPost(@RequestBody String ori) throws JSONException {
		
		JSONObject jsonObj = new JSONObject(ori);
		java.util.Date currentTime = new java.util.Date();
		repository.save(new Member(jsonObj.get("name").toString(), jsonObj.get("phone").toString(), currentTime));
		
		return new ResponseEntity(HttpStatus.OK);
	}

	@PostMapping(value = "/edit/{id}")
	public ResponseEntity edit(@PathVariable String id, @RequestBody String ori) throws JSONException {
	
		JSONObject jsonObj = new JSONObject(ori);
		Member pantsInDB = repository.findById(Long.parseLong(id)).get();
		pantsInDB.setName(jsonObj.get("name").toString());
		pantsInDB.setPhone(jsonObj.get("phone").toString());
		repository.save(pantsInDB);
		
		return new ResponseEntity(HttpStatus.OK);
	}
}