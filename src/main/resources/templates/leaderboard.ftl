<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Scrabble Club</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendors/lightbox/simpleLightbox.css">
<link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
<link rel="stylesheet" href="vendors/animate-css/animate.css">
<link rel="stylesheet" href="vendors/jquery-ui/jquery-ui.css">
<!-- main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
<style>
table, th, td {
	border: none;
	border-collapse: collapse;
}

td {
	padding-left: 80px;"
	text-align: left;
}
</style>
</head>

<body>

	<!--================Header Menu Area =================-->
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<div class="row w-100">
						<div class="col-lg-7 pr-0">
							<ul class="nav navbar-nav center_nav pull-right">
								<li class="nav-item"><a class="nav-link" href="./">All
										Members</a></li>
								<li class="nav-item"><a class="nav-link" href="./profile">Profile</a></li>
								<li class="nav-item"><a class="nav-link" href="./leaderboard">leaderboard</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<!--================Header Menu Area =================-->
	<table style="width: 100%;border: none;">
		 	<tr>
				<th><font size="4">Top 10 average scores:</font></th>
			</tr>
			<#list content_top10 as top10>
				<tr>
					<td><input style="border: none;width:100%;padding-left:100px;" type="text" id="${top10.member_id}" name="name" value="${top10.name} : ${top10.average}" readonly></td>
				</tr>
			</#list>
			<tr>
				<th><font size="4">Highest scores:</font></th>
			</tr>
				<tr>
					<td><input style="border: none;width:100%;padding-left:100px;" type="text" id="${content_leaderHighestScore.name}" name="name" value="${content_leaderHighestScore.name} : ${content_leaderHighestScore.highest_point}" readonly></td>
				</tr>
			<tr>
				<th><font size="4">Lowest scores:</font></th>
			</tr>
			<tr>
					<td><input style="border: none;width:100%;padding-left:100px;" type="text" id="${content_leaderLowestScore.name}" name="name" value="${content_leaderLowestScore.name} : ${content_leaderLowestScore.lowest_point}" readonly></td>
			</tr>
	</table>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/stellar.js"></script>
	<script src="vendors/lightbox/simpleLightbox.min.js"></script>
	<script src="vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="vendors/isotope/imagesloaded.pkgd.min.js"></script>
	<script src="vendors/isotope/isotope-min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="vendors/jquery-ui/jquery-ui.js"></script>
	<script src="vendors/counter-up/jquery.waypoints.min.js"></script>
	<script src="vendors/counter-up/jquery.counterup.js"></script>
	<script type='text/javascript'>
	function getScoreDetail(member_id) {
    		console.log(member_id);
    			$.ajax({
				url : "./scoreDetail/"+member_id,
				type : 'GET',
				contentType : "application/json",
				success : function(result) {
				var obj = JSON.parse(result);
					alert("Highest Score: "+ obj.max_point+"\n"+
						  "Game Name: "+obj.game_name+"\n"+
						  "Competitor: "+obj.loser_name+"\n"+
						  "Date: "+  new Date( obj.create_at).toString()
					);
				},
				error : function(error) {
					console.log(error);
				}
			});
	}
	</script>
</body>
</html>