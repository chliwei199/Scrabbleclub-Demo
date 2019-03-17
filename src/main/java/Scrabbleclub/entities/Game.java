package Scrabbleclub.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "game")
public class Game implements Serializable {

	private static final long serialVersionUID = -3009157732242241606L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long game_id;

	@Column(name = "game_name")
	private String game_name;

	@Column(name = "winner_id")
	private long winner_id;
	
	@Column(name = "loser_id")
	private long loser_id;
	
	@Column(name = "winner_point")
	private String winner_point;

	@Column(name = "loser_point")
	private String loser_point;
	
	@Column(name="create_at", insertable=false)
	@Temporal(TemporalType.TIMESTAMP)
	private Date create_at;
	
	protected Game() {
	}

	public Game(String game_name, long winner_id, long loser_id,String winner_point,String loser_point,Date create_at) {
		this.game_name = game_name;
		this.winner_id = winner_id;
		this.loser_id = loser_id;
		this.winner_point = winner_point;
		this.loser_point = loser_point;
		this.create_at = create_at;
	}

	public long getGame_id() {
		return game_id;
	}

	public void setGame_id(long game_id) {
		this.game_id = game_id;
	}

	public String getGame_name() {
		return game_name;
	}

	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}

	public long getWinner_id() {
		return winner_id;
	}

	public void setWinner_id(long winner_id) {
		this.winner_id = winner_id;
	}

	public long getLoser_id() {
		return loser_id;
	}

	public void setLoser_id(long loser_id) {
		this.loser_id = loser_id;
	}

	public String getWinner_point() {
		return winner_point;
	}

	public void setWinner_point(String winner_point) {
		this.winner_point = winner_point;
	}

	public String getLoser_point() {
		return loser_point;
	}

	public void setLoser_point(String loser_point) {
		this.loser_point = loser_point;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}


}
