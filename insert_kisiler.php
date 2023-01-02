<?php
$response = array();

if (isset($_POST['first_name']) && isset($_POST['email'])) {
    $first_name = $_POST['first_name'];
    $email = $_POST['email'];
   
    //DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE değişkenleri alınır.
    require_once __DIR__ . '/db_config.php';
    
    // Bağlantı oluşturuluyor.
    $baglanti = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
    
    // Bağlanti kontrolü yapılır.
    if (!$baglanti) {
        die("Hatalı bağlantı : " . mysqli_connect_error());
    }
    
    $sqlsorgu = "INSERT INTO uyelikbilgileri (first_name,email) VALUES ('$first_name','$email')";

    if (mysqli_query($baglanti, $sqlsorgu)) {
        $response["success"] = 1;
        $response["message"] = "successfully ";
        echo json_encode($response);
    } else {
        $response["success"] = 0;
        $response["message"] = "No product found";
        echo json_encode($response);
    }
    //bağlantı koparılır.
    mysqli_close($baglanti);
} else {
    $response["success"] = 0;
    $response["message"] = "Required field(s) is missing";
    echo json_encode($response);
}
?>



