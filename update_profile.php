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

$select_user = $conn->prepare("SELECT * FROM `user` WHERE unique_id = ? LIMIT 1");
$select_user->execute([$unique_id]);
$fetch_user = $select_user->fetch(PDO::FETCH_ASSOC);

if(isset($_POST['submit'])){

   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING); 
   $number = $_POST['number'];
   $number = filter_var($number, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $name_bank = $_POST['name_bank'];
   $name_bank = filter_var($name_bank, FILTER_SANITIZE_STRING);
   $acc_num = $_POST['acc_num'];
   $acc_num = filter_var($acc_num, FILTER_SANITIZE_STRING);

   if(!empty($name)){
      $update_name = $conn->prepare("UPDATE `user` SET nama = ? WHERE unique_id = ?");
      $update_name->execute([$name, $unique_id]);
      $success_msg[] = 'name updated!';
   }

   if(!empty($name_bank)) {
      $update_bankname = $conn->prepare("UPDATE `user` SET name_bank = ? WHERE unique_id = ?");
      $update_bankname->execute([$name_bank, $unique_id]);
      $success_msg[] = 'name of bank updated!';
   }
   if(!empty($acc_num)) {
      $update_accnumber = $conn->prepare("UPDATE `user` SET acc_num = ? WHERE unique_id = ?");
      $update_accnumber->execute([$acc_num, $unique_id]);

      $success_msg[] = 'account number updated!';
      }
   if(!empty($email)){
      $verify_email = $conn->prepare("SELECT email FROM `user` WHERE email = ?");
      $verify_email->execute([$email]);
      if($verify_email->rowCount() > 0){
         $warning_msg[] = 'email already taken!';
      }else{
         $update_email = $conn->prepare("UPDATE `user` SET email = ? WHERE unique_id = ?");
         $update_email->execute([$email, $unique_id]);
         $success_msg[] = 'email updated!';
      }
   }

   if(!empty($number)){
      $verify_number = $conn->prepare("SELECT number FROM `user` WHERE number = ?");
      $verify_number->execute([$number]);
      if($verify_number->rowCount() > 0){
         $warning_msg[] = 'number already taken!';
      }else{
         $update_number = $conn->prepare("UPDATE `user` SET number = ? WHERE unique_id = ?");
         $update_number->execute([$number, $unique_id]);
         $success_msg[] = 'number updated!';
      }
   }

   $empty_pass = 'da39a3ee5e6b4b0d3255bfef95601890afd80709';
   $prev_pass = $fetch_user['password'];
   $old_pass = sha1($_POST['old_pass']);
   $old_pass = filter_var($old_pass, FILTER_SANITIZE_STRING);
   $new_pass = sha1($_POST['new_pass']);
   $new_pass = filter_var($new_pass, FILTER_SANITIZE_STRING);
   $c_pass = sha1($_POST['c_pass']);
   $c_pass = filter_var($c_pass, FILTER_SANITIZE_STRING);

   if($old_pass != $empty_pass){
      if($old_pass != $prev_pass){
         $warning_msg[] = 'old password not matched!';
      }elseif($new_pass != $c_pass){
         $warning_msg[] = 'confirm passowrd not matched!';
      }else{
         if($new_pass != $empty_pass){
            $update_pass = $conn->prepare("UPDATE `user` SET password = ? WHERE unique_id = ?");
            $update_pass->execute([$c_pass, $unique_id]);
            $success_msg[] = 'password updated successfully!';
         }else{
            $warning_msg[] = 'please enter new password!';
         }
      }
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Update Profile | RegisterWifi.Online</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="form-container">

   <form action="" method="post">
      <h3>update your account!</h3>
      <input type="tel" name="name" maxlength="50" placeholder="<?= $fetch_user['nama']; ?>" class="box">
      <input type="email" name="email" maxlength="50" placeholder="<?= $fetch_user['email']; ?>" class="box">
      <input type="number" name="number" min="0" max="9999999999" maxlength="11" placeholder="<?= $fetch_user['number']; ?>" class="box">
      <input type="password" name="old_pass" maxlength="20" placeholder="enter your old password" class="box">
      <input type="password" name="new_pass" maxlength="20" placeholder="enter your new password" class="box">
      <input type="password" name="c_pass" maxlength="20" placeholder="confirm your new password" class="box">

      <h3>update info bank!</h3>
      <input type="text" name="name_bank" maxlength="50" placeholder="<?php if($fetch_user['name_bank'] != ''){echo $fetch_user['name_bank'];}else {echo 'enter name of bank';}; ?>" class="box">
      <input type="number" name="acc_num" maxlength="50" placeholder="<?php if($fetch_user['acc_num'] != ''){echo $fetch_user['acc_num'];}else {echo 'enter account number';}; ?>" class="box">

      <input type="submit" value="update now" name="submit" class="btn">
   </form>

</section>






<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<?php include 'components/footer.php'; ?>

<!-- custom js file link  -->
<script src="js/script.js"></script>

<?php include 'components/message.php'; ?>
</body>
</html>