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
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
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
	
	<table style="width: 100%">
		<tr>
			<th>Name:</th>
			<th>Phone:</th>
			<th></th>
		</tr>
		<form class="row login_form" id="formoid">
			<#list content as member>
			<tr>
				<td><input style="border: none;width:100%; padding-left:0px; padding-right:0px;"  type="text" id="name_${member.member_id}" name="name" value="${member.name}"></td>
				<td><input style="border: none" type="text" id="phone_${member.member_id}" name="phone" value="${member.phone}"></td>
				<td><input type="button" value="Edit" onClick="submitMe(${member.member_id})"></input></td>
			</tr>
			</#list>
		</form>
	</table>
	<div class="col-md-12 form-group">
		<!-- 	<button type="submit" value="submit" class="btn white_bg_btn submit_btn">Sign Up</button> -->
		<a href="./signup" class="btn">Sign Up </a>
	</div>

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
		/* attach a submit handler to the form */
		function submitMe(id) {
			$.ajax({
				url : "./edit/"+id,
				type : 'POST',
				//	dataType : "json",
				contentType : "application/json",
				data : JSON.stringify({
					"name" : $('#name_'+id).val(),
					"phone" : $('#phone_'+id).val(),
				}),
				success : function(result) {
					alert("Edited successfully.");
					window.location = './index';
				},
				error : function(error) {
					alert("Failed,Try again.");
					window.location = './signup';
				}
			});
    	};
		
		$("#formoid").submit(function(event) {
			console.log("123");
			// Stop form from submitting normally
			console.log("123");
			event.preventDefault();
			var $form = $(this);
			console.log(id);
			$.ajax({
				url : "./edit/"+id,
				type : 'POST',
				contentType : "application/json",
				data : JSON.stringify({
					"name" : $('#name').val(),
					"phone" : $('#phone').val(),
				}),
				success : function(result) {
					window.location = './index';
				},
				error : function(error) {
					window.location = './signup';
				}
			});
		});
	</script>
</body>
</html>