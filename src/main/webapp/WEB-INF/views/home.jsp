<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<title>Precious Flower - Homepage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/jquery-sakura.js"></script>
<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/favicon.png">

<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/templatemo.css">
<link rel="stylesheet" href="./resources/css/custom.css">
<link rel="stylesheet" href="./resources/css/jquery-sakura.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet" href="./resources/css/fontawesome.min.css">
<script type="text/javascript">
$(function(){
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
});

var $js = jQuery.noConflict();

$js(window).load(function () {
    $js('body').sakura();
});
</script>
<style type="text/css">
*{
    margin: 0px;
    padding: 0px;
}
.bgimage{
    background: linear-gradient(rgba(0, 0, 0, 0.55), rgba(0, 0, 0, 0.55)),url("/resources/images/bimg.jpg");
    background-size: 100%;
    width: 100%;
    height: 1000px;
}
.text{
    width: 100%;
    text-transform: uppercase;
    text-align: center;
    color: white;
    padding-top: 300px;
}
.text h3{
    font-size: 15px;
}
#homediv {
	background-image: linear-gradient(to top, #dfe9f3 0%, white 100%);
}
</style>
</head>

<body>
 	<!-- Start Image -->
	<div class="bgimage">
	
	<header>
	<jsp:include page="hheader.jsp"/>
	</header>
 	
	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
	
		<div class="homebanner">
			<div class="text">
				<h1>We Are All Precious Flower</h1>
				<h3>?????? ?????????, ???????????? ?????? ????????? ????????? ?????? ???????????? ???????????????.</h3>
			</div>
		</div>
	</div>
	<!-- End Image -->
	
	<!-- Start Categories of The Month -->
	<section class="container py-5">
		<div class="row text-center pt-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1">Categories of The Month</h1>
				<p>????????? ??????????????? ??????????????????.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-4 p-5 mt-3">
				<a href="#"><img src="./resources/images/BO045.PNG"
					class="rounded-circle img-fluid border" style="width:500px;"></a>
				<h5 class="text-center mt-3 mb-3">?????????</h5>
				<p class="text-center">
					<a class="btn btn-success" href="./f_product?codestr=BO">Go Shop</a>
				</p>
			</div>
			<div class="col-12 col-md-4 p-5 mt-3">
				<a href="#"><img src="./resources/images/BA001.PNG"
					class="rounded-circle img-fluid border" style="width:500px;"></a>
				<h2 class="h5 text-center mt-3 mb-3">????????????</h2>
				<p class="text-center">
					<a class="btn btn-success" href="./f_product?codestr=BA">Go Shop</a>
				</p>
			</div>
			<div class="col-12 col-md-4 p-5 mt-3">
				<a href="#"><img src="./resources/images/PL003.PNG"
					class="rounded-circle img-fluid border" style="width:500px;"></a>
				<h2 class="h5 text-center mt-3 mb-3">??????</h2>
				<p class="text-center">
					<a class="btn btn-success" href="./f_product?codestr=PL">Go Shop</a>
				</p>
			</div>
		</div>
	</section>
	<!-- End Categories of The Month -->
	
	<!-- Start Featured Product -->
	<section class="bg-light">
		<div class="container py-5">
			<div class="row text-center py-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">Popular Product</h1>
					<p>????????? ?????? ????????? ??????????????????.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-12 col-md-4 mb-4">
					<div class="card h-100">
						<a href="/f_contents?p_code=BO001"> <img
							src="./resources/images/BO001.png" class="card-img-top" style="width:450px;">
						</a>
						<div class="card-body">
							<ul class="list-unstyled d-flex justify-content-between">
								<li><i class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-muted fa fa-star"></i></li>
								<li class="text-muted text-right">39,000???</li>
							</ul>
							<a href="/f_contents?p_code=BO001"
								class="h2 text-decoration-none text-dark">????????????</a>
							<p class="card-text">????????? ????????? '??????'?????????. ????????? ???????????? ????????? ?????? ?????? ????????????. ?????? ??????????????? ?????? ???????????? ???????????? ???????????? ???????????????.</p>
							<p class="text-muted">Reviews (4)</p>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-4 mb-4">
					<div class="card h-100">
						<a href="/f_contents?p_code=BA003"> <img
							src="./resources/images/BA003.PNG" class="card-img-top" style="width:450px;">
						</a>
						<div class="card-body">
							<ul class="list-unstyled d-flex justify-content-between">
								<li><i class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i></li>
								<li class="text-muted text-right">77,000???</li>
							</ul>
							<a href="/f_contents?p_code=BA003"
								class="h2 text-decoration-none text-dark">????????????</a>
							<p class="card-text">????????? ???????????? ????????? ??????????????? ?????? ???????????? ??????????????? ???????????????.</p>
							<p class="text-muted">Reviews (6)</p>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-4 mb-4">
					<div class="card h-100">
						<a href="/f_contents?p_code=PL008"> <img
							src="./resources/images/PL008.PNG" class="card-img-top" style="width:450px;">
						</a>
						<div class="card-body">
							<ul class="list-unstyled d-flex justify-content-between">
								<li><i class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i> <i
									class="text-warning fa fa-star"></i></li>
								<li class="text-muted text-right">165,000???</li>
							</ul>
							<a href="/f_contents?p_code=PL008"
								class="h2 text-decoration-none text-dark">????????? ??????????????? B</a>
							<p class="card-text">??????????????? ???????????? ????????? ????????? ??????????????? ??????, ?????? ??? ???????????? ??? ???????????? ?????? ?????????????????????.</p>
							<p class="text-muted">Reviews (10)</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Featured Product -->
	
	<footer>
	<jsp:include page="footer.jsp"/>
	</footer>

	<!-- Start Script -->
	<script src="./resources/js/jquery-1.11.0.min.js"></script>
	<script src="./resources/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="./resources/js/bootstrap.bundle.min.js"></script>
	<script src="./resources/js/templatemo.js"></script>
	<script src="./resources/js/custom.js"></script>
	<!-- End Script -->
</body>

</html>