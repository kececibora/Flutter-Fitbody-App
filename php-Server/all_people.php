<?php
// array for JSON response
$response = array();

//DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE değişkenleri alınır.
require_once __DIR__ . '/db_config.php';

// Bağlantı oluşturuluyor.
$baglanti = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
    
// Bağlanti kontrolü yapılır.
if (!$baglanti) {
    die("Hatalı bağlantı : " . mysqli_connect_error());
}

$sqlsorgu = "SELECT * FROM uyelikbilgileri";
$result = mysqli_query($baglanti, $sqlsorgu);

// result kontrolü yap
if (mysqli_num_rows($result) > 0) {
    
    $response["uyelikbilgileri"] = array();
    
    while ($row = mysqli_fetch_assoc($result)) {
        // temp user array
        $uyelikbilgileri = array();
        
        $uyelikbilgileri["id"] = $row["id"];
        $uyelikbilgileri["first_name"] = $row["first_name"];
        $uyelikbilgileri["email"] = $row["email"];
        
        // push single product into final response array
        array_push($response["uyelikbilgileri"], $uyelikbilgileri);
    }
    // success
    $response["success"] = 1;

    // echoing JSON response
    echo json_encode($response);
    
} else {
    // no products found
    $response["success"] = 0;
    $response["message"] = "No data found";

    // echo no users JSON
    echo json_encode($response);
}
//bağlantı koparılır.
mysqli_close($baglanti);
?>
