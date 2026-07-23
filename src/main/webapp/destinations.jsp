<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Explore Karnataka Destinations | BGS Tours And Travels</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Inter',sans-serif;
}

body{
background:#f8fafc;
color:#1a2c3e;
}

.navbar{
background:#fff;
padding:20px 5%;
display:flex;
justify-content:space-between;
align-items:center;
box-shadow:0 2px 10px rgba(0,0,0,.05);
position:sticky;
top:0;
z-index:100;
}

.logo{
font-size:24px;
font-weight:800;
text-decoration:none;
color:#1a2c3e;
}

.logo span{
color:#115eb6;
}

.nav-links{
display:flex;
gap:30px;
list-style:none;
}

.nav-links a{
text-decoration:none;
color:#1a2c3e;
font-weight:600;
transition:.3s;
}

.nav-links a:hover{
color:#115eb6;
}

.header-banner{
background:
linear-gradient(rgba(17,94,182,.75),
rgba(17,94,182,.75)),
url("https://images.pexels.com/photos/346885/pexels-photo-346885.jpeg")
center/cover;

padding:90px 20px;
text-align:center;
color:white;
}

.header-banner h1{
font-size:50px;
margin-bottom:15px;
}

.header-banner p{
font-size:18px;
}

.container{
max-width:1300px;
margin:60px auto;
padding:0 20px;
}

.destinations-grid{
display:grid;
grid-template-columns:repeat(auto-fill,minmax(350px,1fr));
gap:30px;
}

.dest-card{
background:white;
border-radius:20px;
overflow:hidden;
box-shadow:0 10px 25px rgba(0,0,0,.08);
transition:.3s;
}

.dest-card:hover{
transform:translateY(-8px);
}

.img-wrapper{
position:relative;
height:240px;
overflow:hidden;
}

.img-wrapper img{
width:100%;
height:100%;
object-fit:cover;
transition:.5s;
}

.dest-card:hover img{
transform:scale(1.08);
}

.price-badge{
position:absolute;
bottom:15px;
left:15px;
background:#115eb6;
color:white;
padding:8px 18px;
border-radius:30px;
font-weight:700;
}

.card-body{
padding:25px;
}

.dest-title{
font-size:22px;
font-weight:700;
margin-bottom:10px;
}

.dest-desc{
font-size:14px;
line-height:1.7;
color:#5a6e85;
margin-bottom:18px;
}

.features{
display:flex;
gap:20px;
font-size:13px;
padding-bottom:20px;
border-bottom:1px solid #eee;
margin-bottom:20px;
}

.features i{
color:#115eb6;
}

.btn-view{
display:block;
width:100%;
text-align:center;
padding:12px;
border:2px solid #115eb6;
border-radius:40px;
text-decoration:none;
color:#115eb6;
font-weight:600;
transition:.3s;
}

.btn-view:hover{
background:#115eb6;
color:white;
}

</style>

</head>

<body>

<nav class="navbar">

<a href="index.jsp" class="logo">
<span>BGS TOURS AND TRAVELS</span><br>
<small>Beyond Global Skies</small>
</a>

<ul class="nav-links">
<li><a href="index.jsp">Home</a></li>
<li><a href="destinations.jsp" style="color:#115eb6;">Destinations</a></li>
<li><a href="sign.jsp">Login</a></li>
</ul>

</nav>

<div class="header-banner">
<h1>Explore Karnataka</h1>
<p>Discover the finest tourist destinations across Karnataka.</p>
</div>

<div class="container">

<div class="destinations-grid">

<!-- Mysore -->

<div class="dest-card">

<div class="img-wrapper">
<img src="https://trekentrip.com/wp-content/uploads/2024/10/mysuru-palace.jpg">
<div class="price-badge">₹8,000 /pp</div>
</div>

<div class="card-body">

<h3 class="dest-title">Mysore Palace</h3>

<p class="dest-desc">
Explore the magnificent Mysore Palace,
Chamundi Hills and Brindavan Gardens while
experiencing the royal heritage of Karnataka.
</p>

<div class="features">
<span><i class="fas fa-clock"></i>4 Days</span>
<span><i class="fas fa-hotel"></i>4-Star Stay</span>
</div>

<a href="destination-details.jsp" class="btn-view">
View Itinerary
</a>

</div>

</div>

<!-- Mullayanagiri -->

<div class="dest-card">

<div class="img-wrapper">
<img src="https://tsprodimages.s3.ap-south-1.amazonaws.com/v/03788301/v/03788301/trips/ts_2025110512031800000019032831.webp">
<div class="price-badge">₹8,000 /pp</div>
</div>

<div class="card-body">

<h3 class="dest-title">
Mullayanagiri, Chikkamagaluru
</h3>

<p class="dest-desc">
Visit Karnataka's highest peak,
coffee plantations and enjoy breathtaking
sunrise trekking experiences.
</p>

<div class="features">
<span><i class="fas fa-clock"></i>4 Days</span>
<span><i class="fas fa-mountain"></i>Trekking</span>
</div>

<a href="destination-details.jsp"
class="btn-view">
View Itinerary
</a>

</div>

</div>

<!-- Hampi -->

<div class="dest-card">

<div class="img-wrapper">
<img src="https://www.shivavilaspalacehotel.com/blog/admin/assets/img/post/image_2025-03-24-08-23-39_67e1168be72ae.jpg">

<div class="price-badge">
₹5,000 /pp
</div>

</div>

<div class="card-body">

<h3 class="dest-title">
Hampi, Vijayanagara
</h3>

<p class="dest-desc">
Explore UNESCO World Heritage ruins,
ancient temples and monuments of the
Vijayanagara Empire.
</p>

<div class="features">
<span><i class="fas fa-clock"></i>3 Days</span>
<span><i class="fas fa-landmark"></i>Heritage</span>
</div>

<a href="destination-details.jsp"
class="btn-view">
View Itinerary
</a>

</div>

</div>

<!-- Kotilingeshwar Temple -->

<div class="dest-card">

    <div class="img-wrapper">
        <img src="https://hblimg.mmtcdn.com/content/hubble/img/ttd_images/mmt/activities/m_Kolar_Koti_lingeshwara_temple_1_l_480_640.jpg">
        <div class="price-badge">₹5,000 /pp</div>
    </div>

    <div class="card-body">

        <h3 class="dest-title">
            Kotilingeshwar Temple, Kolar
        </h3>

        <p class="dest-desc">
            Visit one of the world's largest Shiva Lingas and millions of
            smaller Shiva Lingas in this famous pilgrimage destination.
        </p>

        <div class="features">
            <span><i class="fas fa-clock"></i>2 Days</span>
            <span><i class="fas fa-place-of-worship"></i>Temple Tour</span>
        </div>

        <a href="destination-details.jsp" class="btn-view">
            View Itinerary
        </a>

    </div>

</div>

<!-- Sakleshpur -->

<div class="dest-card">

    <div class="img-wrapper">
        <img src="https://bookmetickets.com/static/falcon/img/stock/events/5bb2d94d04a28675b2b99da3/67051ed781aa2d7615163606/sakleshpur_package-2.webp">
        <div class="price-badge">₹8,000 /pp</div>
    </div>

    <div class="card-body">

        <h3 class="dest-title">
            Sakleshpur, Hassan
        </h3>

        <p class="dest-desc">
            Discover lush coffee plantations, Western Ghats scenery,
            Manjarabad Fort and beautiful waterfalls.
        </p>

        <div class="features">
            <span><i class="fas fa-clock"></i>4 Days</span>
            <span><i class="fas fa-mug-hot"></i>Coffee Estate</span>
        </div>

        <a href="destination-details.jsp" class="btn-view">
            View Itinerary
        </a>

    </div>

</div>

<!-- Jog Falls -->

<div class="dest-card">

    <div class="img-wrapper">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs3vIgIF0Vly2REBXaClR5wyik3jX651_W65YOTBYiBkzHtET2l0YfN2E&s=10">
        <div class="price-badge">₹8,000 /pp</div>
    </div>

    <div class="card-body">

        <h3 class="dest-title">
            Jog Falls, Shivamogga
        </h3>

        <p class="dest-desc">
            Witness one of India's highest waterfalls surrounded by lush
            forests, viewpoints and breathtaking natural beauty.
        </p>

        <div class="features">
            <span><i class="fas fa-clock"></i>3 Days</span>
            <span><i class="fas fa-water"></i>Waterfall</span>
        </div>

        <a href="destination-details.jsp" class="btn-view">
            View Itinerary
        </a>

    </div>

</div>

<!-- Chitradurga Fort -->

<div class="dest-card">

    <div class="img-wrapper">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc4jsTGWokIDCk4fFnjxRiptZ2A8FUYM5X8olG6Sb2lxdxfNn7FbDYZ8E&s=10">
        <div class="price-badge">₹8,000 /pp</div>
    </div>

    <div class="card-body">

        <h3 class="dest-title">
            Chitradurga Fort
        </h3>

        <p class="dest-desc">
            Explore the magnificent stone fort famous for its seven concentric
            walls, ancient temples and the legendary story of Onake Obavva.
        </p>

        <div class="features">
            <span><i class="fas fa-clock"></i>3 Days</span>
            <span><i class="fas fa-landmark"></i>Historic Fort</span>
        </div>

        <a href="destination-details.jsp" class="btn-view">
            View Itinerary
        </a>

    </div>

</div>

<!-- Coorg -->

<div class="dest-card">

    <div class="img-wrapper">
        <img src="https://www.holidify.com/images/cmsuploads/compressed/Coorg_20190618150131.jpg">
        <div class="price-badge">₹9,000 /pp</div>
    </div>

    <div class="card-body">

        <h3 class="dest-title">
            Coorg (Madikeri)
        </h3>

        <p class="dest-desc">
            Enjoy the beauty of coffee plantations, Abbey Falls,
            Raja's Seat, Dubare Elephant Camp and the pleasant
            hill station climate.
        </p>

        <div class="features">
            <span><i class="fas fa-clock"></i>4 Days</span>
            <span><i class="fas fa-tree"></i>Nature Tour</span>
        </div>

        <a href="destination-details.jsp" class="btn-view">
            View Itinerary
        </a>

    </div>

</div>

<!-- Murudeshwar -->

<div class="dest-card">

    <div class="img-wrapper">
        <img src="https://upload.wikimedia.org/wikipedia/commons/7/73/Murudeshwara_Temple_and_Raja_Gopura.jpg">
        <div class="price-badge">₹8,500 /pp</div>
    </div>

    <div class="card-body">

        <h3 class="dest-title">
            Murudeshwar
        </h3>

        <p class="dest-desc">
            Visit the world's second tallest Shiva statue,
            Murudeshwar Temple, beautiful beaches and enjoy
            breathtaking Arabian Sea views.
        </p>

        <div class="features">
            <span><i class="fas fa-clock"></i>3 Days</span>
            <span><i class="fas fa-umbrella-beach"></i>Beach Tour</span>
        </div>

        <a href="destination-details.jsp" class="btn-view">
            View Itinerary
        </a>

    </div>

</div>

<!-- Gokarna -->

<div class="dest-card">

    <div class="img-wrapper">
        <img src="https://www.holidify.com/images/cmsuploads/compressed/attr_1568.jpg" alt="Gokarna">
        <div class="price-badge">₹9,500 /pp</div>
    </div>

    <div class="card-body">

        <h3 class="dest-title">
            Gokarna
        </h3>

        <p class="dest-desc">
            Relax on the beautiful beaches of Gokarna, visit the famous
            Mahabaleshwar Temple, enjoy beach trekking and spectacular
            Arabian Sea sunsets.
        </p>

        <div class="features">
            <span><i class="fas fa-clock"></i>4 Days</span>
            <span><i class="fas fa-umbrella-beach"></i>Beach Holiday</span>
        </div>

        <a href="destination-details.jsp" class="btn-view">
            View Itinerary
        </a>

    </div>

</div>

<!-- Belur & Halebidu -->

<div class="dest-card">

    <div class="img-wrapper">
        <img src="https://www.holidify.com/images/cmsuploads/compressed/BelurTemple_20180307125254.jpg" alt="Belur">
        <div class="price-badge">₹6,000 /pp</div>
    </div>

    <div class="card-body">

        <h3 class="dest-title">
            Belur & Halebidu
        </h3>

        <p class="dest-desc">
            Discover the magnificent Hoysala temples famous for their
            intricate stone carvings, sculptures and remarkable
            architectural beauty.
        </p>

        <div class="features">
            <span><i class="fas fa-clock"></i>2 Days</span>
            <span><i class="fas fa-landmark"></i>Temple Heritage</span>
        </div>

        <a href="destination-details.jsp" class="btn-view">
            View Itinerary
        </a>

    </div>

</div>

<!-- Bandipur National Park -->

<div class="dest-card">

    <div class="img-wrapper">
        <img src="https://www.holidify.com/images/cmsuploads/compressed/BandipurNationalPark_20180307131150.jpg" alt="Bandipur">
        <div class="price-badge">₹10,000 /pp</div>
    </div>

    <div class="card-body">

        <h3 class="dest-title">
            Bandipur National Park
        </h3>

        <p class="dest-desc">
            Experience thrilling wildlife safaris through one of India's
            finest national parks, home to elephants, deer, peacocks,
            leopards and majestic tigers.
        </p>

        <div class="features">
            <span><i class="fas fa-clock"></i>3 Days</span>
            <span><i class="fas fa-paw"></i>Wildlife Safari</span>
        </div>

        <a href="destination-details.jsp" class="btn-view">
            View Itinerary
        </a>

    </div>

</div>

</div>
</div>

</body>
</html>