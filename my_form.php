<?php 

include 'components/connect.php';

session_start();

if(isset($_SESSION['unique_id'])){
   $unique_id = $_SESSION['unique_id'];
}else{
   $unique_id = '';
   header('location:login');
};

$verification_status = "0";

$check_user = $conn->prepare("SELECT * FROM `user` WHERE unique_id = ? AND verification_status = ?");
$check_user->execute([$unique_id, $verification_status]);
$row = $check_user->fetch(PDO::FETCH_ASSOC);

if($check_user->rowCount() > 0){

   if($verification_status == "verified"){
      $_SESSION['unique_id'] = $row['unique_id'];
      $_SESSION['email'] = $row['email'];
      $_SESSION['otp'] = $row['otp'];
      header('location:index');
   }
   elseif($verification_status == "0"){
      $_SESSION['unique_id'] = $row['unique_id'];
      $_SESSION['email'] = $row['email'];
      $_SESSION['otp'] = $row['otp'];
      header('location:verify');
   }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>My Form | RegisterWifi.Online</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="my-listings">

   <h1 class="heading">my forms</h1>

   <div class="box-container">

   <?php 
   
      $select_my_form = $conn->prepare("SELECT orders_list.id, orders_list.unique_id, orders_list.tarikh, orders_list.nama, orders_list.email, orders_list.phoneno, orders_list.nokp, orders_list.alamatPemasangan, orders_list.alamatBill, products.s_name, products.price, products.image, orders_list.tarikhWaktu, orders_list.signa_c, orders_list.imgBill, orders_list.imgKpD, orders_list.imgKpB, orders_list.status, orders_list.catatan FROM orders_list INNER JOIN products ON orders_list.pid = products.id WHERE unique_id = ?");
      $select_my_form->execute([$unique_id]);
      if($select_my_form->rowCount() > 0){
         while($fetch_my_form = $select_my_form->fetch(PDO::FETCH_ASSOC)){

            $form_id = $fetch_my_form['id'];
   
   ?>

  
   <form accept="" method="POST" class="box">
      <input type="hidden" name="form_id" value="<?= $form_id;?>">
      <div class="thumb">
         <img src="uploaded_product/<?= $fetch_my_form['image'];?>">
      </div>
      <div class="price"><b>RM <?= $fetch_my_form['price'];?> /Bulanan</b></div>
      <p class="location"><i class="fas fa-map-marker-alt"></i><span><?= $fetch_my_form['alamatPemasangan'];?></span></p>
      <h3 class="name">Status Application: </br> <?= $fetch_my_form['status'];?></h3>
      <h3 class="name">Catatan: </br> <?php if($fetch_my_form['catatan'] == ''){echo 'Tiada Data';}else{echo $fetch_my_form['catatan'] ;} ;?></h3>
      <h3 class="name">Tarikh Pemasangan: </br> <?php if($fetch_my_form['tarikhWaktu'] != ''){echo date("d-m-Y H:i",strtotime($fetch_my_form['tarikhWaktu']));} else{echo'Tiada Data';};?></h3>

      <!-- <div class="flex-btn">
         <a href="update_property?get_id=<?= $form_id; ?>" class="btn">update</a>
      </div> -->
     
   </form>
   <?php
         }
      }else{
         echo '<p class="empty">no submit form! <a href="submit_form" style="margin-top:1.5rem;" class="btn">add new</a></p>';
      }
      ?>
   

   </div>

</section>








<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<?php include 'components/footer.php'; ?>

<!-- custom js file link  -->
<script src="js/script.js"></script>

<?php include 'components/message.php'; ?>

</body>
</html>