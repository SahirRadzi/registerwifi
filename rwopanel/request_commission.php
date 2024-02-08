<?php

include '../components/connect.php';

session_start();

$unique_id = $_SESSION['unique_id'];

if(!isset($unique_id)){
   header('location:admin_login.php');
}

if(isset($_POST['update_status'])){

   $id = $_POST['id'];
   $status = $_POST['status'];
   $update_status = $conn->prepare("UPDATE `report_affiliate` SET status = ? WHERE id = ?");
   $update_status->execute([$status, $id]);
   $message[] = 'request commission status updated!';

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Request Commission | RWO Panel</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />

   <!-- custom css file link  -->
   <link rel="stylesheet" href="../css/admin_placed.css">

   <style>
    .view-btn{
        background-color: var(--solidBlack) !important;
    }
    .view-btn:hover{
        background-color: var(--black) !important;
    }
    .delete-btn, .view-btn, .box-queue, .box-queue-number{
        font-weight: normal !important;
    }

    p{
        font-weight: normal !important;
    } 
    
    span {
        font-weight: normal !important;
    }

    a.btn{
      font-weight: normal !important;
    }

    input .disabled {
       opacity: 0.5;
       user-select: none;
       pointer-events: none;
    }
   
    
   </style>

</head>
<body>

<?php include '../components/admin_header.php' ?>

<!-- total proceed section starts  -->

<section class="placed-orders">

      <?php
         $jumlah_komisen = 0;
         $select_commission = $conn->prepare("SELECT * FROM `report_affiliate` WHERE status =? ");
         $select_commission->execute(['claim']);
            $jumlah_komisen = $select_commission->rowCount();
      ?>

   <h1 class="heading">request commission | <?= $jumlah_komisen ;?></h1>
         <form action="" method="POST" class="search-form">
            <input type="text" name="search_box" placeholder="search uid / ic " maxlength="100" required>
            <button type="submit" class="fas fa-search" name="search_btn"></button>
         </form>

   
         <?php

if(isset($_POST['search_box']) OR isset($_POST['search_btn'])){
   $search_box = $_POST['search_box'];
   $search_box = filter_var($search_box, FILTER_SANITIZE_STRING);
   $select_listings = $conn->prepare("SELECT report_affiliate.id, report_affiliate.unique_id, report_affiliate.olid, report_affiliate.referral_code, report_affiliate.komisen_masuk, report_affiliate.status, user.nama, user.referral_code, user.account_number, user.name_bank  FROM report_affiliate INNER JOIN user ON report_affiliate.referral_code = user.referral_code WHERE status = 'claim' AND unique_id LIKE '%{$search_box}%' OR nokp LIKE '%{$search_box}%'");
   $select_listings->execute();
}else

$select_listings = $conn->prepare("SELECT report_affiliate.id, report_affiliate.unique_id, report_affiliate.olid, report_affiliate.referral_code, report_affiliate.komisen_masuk, report_affiliate.status, user.nama, user.referral_code, user.account_number, user.name_bank  FROM report_affiliate INNER JOIN user ON report_affiliate.referral_code = user.referral_code WHERE status = 'claim'");
$select_listings->execute();
if($select_listings->rowCount() > 0){
   while($fetch_orders = $select_listings->fetch(PDO::FETCH_ASSOC)){
      ?>
<div class="box-container">
   <div class="box">

   <div class="box-queue-number">unifi</div>
      

      <p><b>#<span><?= $fetch_orders['olid'];?></p>
      <p> Referral Code : <span><?= $fetch_orders['referral_code'] ;?></span></p>
      <p> Commission : <span> RM <?= $fetch_orders['komisen_masuk'] ;?></span></p>
      <p> Name of Bank : <span> RM <?= $fetch_orders['name_bank'] ;?></span></p>
      <p> Account Holder : <span><?= $fetch_orders['nama'] ;?></span></p>
      <p> Account Number : <span><?= $fetch_orders['account_number'] ;?></span></p>
      <form action="" method="POST">
      <p> Status: <span><?= $fetch_orders['status']; ?></span></p>
         
      <input type="hidden" name="id" value="<?= $fetch_orders['id']; ?>">
         <select name="status" class="drop-down">
            <option value="" selected disabled><?= $fetch_orders['status']; ?></option>
            <option value="paid">paid</option>
         </select>
         <div class="flex-btn">
            <input type="submit" value="update status" class="btn" name="update_status">
         </div>
      </form>
   </div>

   <?php
         }
      }elseif(isset($_POST['search_box']) OR isset($_POST['search_btn'])){
         echo '<p class="empty">no results found!</p>';
   }else{
      echo '<p class="empty">no proceed list yet!</p>';
   }
   ?>
   </div>

</section>

<!-- total proceed section ends -->









<!-- custom js file link  -->
<script src="../js/admin_script.js"></script>

</body>
</html>