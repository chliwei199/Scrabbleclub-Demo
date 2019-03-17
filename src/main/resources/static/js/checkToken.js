	function checkToken() {
			var token = Cookies.get('token');
			if (token != null) {
				// Send the data using post
				var url = "http://demopage/jwt/api/user";
				$.ajax({
					type : 'GET',
					url : url,
					headers : {
						'Authorization' : 'Bearer ' + Cookies.get('token'),
					},
					success : function(data) {
						window.location.href = "./account";
					}
				});
			} else {
				alert("login First");
				window.location = './login';
			}

		}