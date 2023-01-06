<?php

    $response = array();

    if (isset($_POST['first_name'])) {
        $first_name = $_POST['first_name'];
   
        //DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE değişkenleri alınır.
        require_once __DIR__ . '/db_config.php';
        
        // Bağlantı oluşturuluyor.
        $baglanti = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
        
        // Bağlanti kontrolü yapılır.
        if (!$baglanti) {
            die("Hatalı bağlantı : " . mysqli_connect_error());
        }
        
        $sqlsorgu = "SELECT * FROM uyelikbilgileri WHERE uyelikbilgileri.first_name like '%$first_name%'";
        $result = mysqli_query($baglanti, $sqlsorgu);
        
        if (mysqli_num_rows($result) > 0) {

            $response["uyelikbilgileri"] = array();
            
            while ($row = mysqli_fetch_assoc($result)) {
       
                $uyelikbilgileri = array();
                
                $uyelikbilgileri["id"] = $row["id"];
                $uyelikbilgileri["first_name"] = $row["first_name"];
                $uyelikbilgileri["email"] = $row["email"];

                array_push($response["uyelikbilgileri"], $uyelikbilgileri);
            }
            
            $response["success"] = 1;
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




