<?php 

include 'components/connect.php';

session_start();

if(isset($_SESSION['unique_id'])){
   $unique_id = $_SESSION['unique_id'];
}else{
   $unique_id = '';
   header('location:login');
};

$select_user = $conn->prepare("SELECT * FROM `user` WHERE unique_id = ?");
$select_user->execute([$unique_id]);
$fetch_user = $select_user->fetch(PDO::FETCH_ASSOC);

if(isset($_POST['submit'])){

    $name_bank = $_POST['name_bank'];
    $name_bank = filter_var($name_bank, FILTER_SANITIZE_STRING);
    $account_number = $_POST['account_number'];
    $account_number = filter_var($account_number, FILTER_SANITIZE_STRING);

        $verify_nb = $conn->prepare("UPDATE `user` set account_number = ?, name_bank = ? WHERE unique_id = ?");
        $verify_nb->execute([$account_number, $name_bank, $unique_id]);

        $success_msg[] = 'info bank updated!';

        };



?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Withdrawl | RegisterWifi.Online</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

   <style>
/* start: Table */
.table-wrapper {
  height: auto;
  overflow: auto;
  position: relative;
}
table {
  border-collapse: collapse;
  width: 100%;
  min-width: 400px;
}
thead {
  background-color: #222;
  color: #fff;
  position: sticky;
  top: 0;
}
td,
th {
  font-size: 1.5rem;
  padding: 8px 16px;
  text-align: left;
}
th {
  text-transform: uppercase;
}
td {
  font-weight: 600;
  background-color: #fff;
  border-bottom: 1px solid #ddd;
}

td .claim{
  padding: 0.5rem 1rem;
  background-color: #fff;
  color: #222;
  border: 2px solid #222;
  border-radius: 5px;
  cursor: pointer;
}

td .claim:hover{
  background-color: #222;
  color: #fff;
}

td .disabled {
  opacity: 0.5;
  user-select: none;
  pointer-events: none;
}

tr:hover td {
  background-color: #f9f9f9;
}

@media screen and (max-width: 576px) {
  table{
    min-width: 200px;
  }
}
/* end: Table */

   </style>

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="referral-program">

   <h1 class="heading">report transaction affiliate</h1>

   <div class="box-container">

      <div class="box">
      <?php
         $jumlah_keseluruhan = 0;
         $select_my_affiliate = $conn->prepare("SELECT user.unique_id, user.nama, user.referral_code, report_affiliate.referral_code, report_affiliate.komisen_masuk FROM user INNER JOIN report_affiliate ON user.referral_code = report_affiliate.referral_code WHERE user.unique_id = ?");
         $select_my_affiliate->execute([$unique_id]);
            while($total_komisen_masuk = $select_my_affiliate->fetch(PDO::FETCH_ASSOC)){
                $jumlah_keseluruhan += $total_komisen_masuk['komisen_masuk'];
            }
            
      ?>
     
      <h3>RM <?= $jumlah_keseluruhan;?></h3>
      <p>Jumlah Keseluruhan</p>
      </div>

      <div class="box">
      <?php
         $jumlah_pengeluaran = 0;
         $select_my_affiliate = $conn->prepare("SELECT user.unique_id, user.nama, user.referral_code, report_affiliate.referral_code, report_affiliate.komisen_masuk FROM user INNER JOIN report_affiliate ON user.referral_code = report_affiliate.referral_code WHERE report_affiliate.status = ? AND user.unique_id = ?");
         $select_my_affiliate->execute(['claim', $unique_id]);
            while($total_komisen_masuk = $select_my_affiliate->fetch(PDO::FETCH_ASSOC)){
                $jumlah_pengeluaran += $total_komisen_masuk['komisen_masuk'];
            }
            
      ?>
        
      <h3>RM <?= $jumlah_pengeluaran;?></h3>
      <p>Jumlah Pengeluaran</p>
   
      </div>

      <div class="box">

      <?php
         $jumlah_baki_semasa = 0;
         $select_my_affiliate = $conn->prepare("SELECT user.unique_id, user.nama, user.referral_code, report_affiliate.referral_code, report_affiliate.komisen_masuk FROM user INNER JOIN report_affiliate ON user.referral_code = report_affiliate.referral_code WHERE report_affiliate.status = ? AND user.unique_id = ?");
         $select_my_affiliate->execute(['pending', $unique_id]);
            while($total_komisen_masuk = $select_my_affiliate->fetch(PDO::FETCH_ASSOC)){
                $jumlah_baki_semasa += $total_komisen_masuk['komisen_masuk'];
            }
            
      ?>
      
      <h3>RM <?= $jumlah_baki_semasa ;?></h3>
      <p>Jumlah Baki Semasa</p>

      </div>
    


   </div>

</section>

<section class="form-container">

   <form action="" method="post">
      <h3>update info bank!</h3>
      <input type="text" name="name_bank" maxlength="50" placeholder="enter name of bank" value="<?= $fetch_user['name_bank']; ?>" class="box" required>
      <input type="number" name="account_number" maxlength="50" placeholder="enter account number" value="<?= $fetch_user['account_number']; ?>" class="box" required>

      <input type="submit" value="submit" name="submit" class="btn">

   </form>
</section>

<section class="referral-program">

   <h1 class="heading">report transaction withdrawal</h1>

    <table id="myTable" class="table table-striped">
    <thead>
      <tr>
        <th>#</th>
        <th>Tarikh</th>
        <th>Komisen (RM)</th>
        <th>Status</th>
        <th>Action</th>

      </tr>
    </thead>
    <tbody>

    <?php
         $select_referral = $conn->prepare("SELECT * FROM `user` WHERE unique_id = ? LIMIT 1");
         $select_referral->execute([$unique_id]);
         $fetch_referral = $select_referral->fetch(PDO::FETCH_ASSOC);
          $myreferral = $fetch_referral['referral_code'];
         
    ?>


    <?php 

$no = 1;
$select_all = $conn->prepare("SELECT user.unique_id, user.nama, user.referral_code, report_affiliate.id, report_affiliate.referral_code, report_affiliate.komisen_masuk, report_affiliate.tarikh, report_affiliate.status FROM user INNER JOIN report_affiliate ON user.referral_code = report_affiliate.referral_code WHERE report_affiliate.referral_code = ?");
$select_all->execute([$myreferral]);
if($select_all->rowCount() > 0){
    while($fetch_referral = $select_all->fetch(PDO::FETCH_ASSOC)){

?>
<tr>
  <td><?=$no;?></td>
  <td><?= date("d/m/y",strtotime($fetch_referral['tarikh']));?></td>
  <td><?=$fetch_referral['komisen_masuk'];?></td>
  <td><?=$fetch_referral['status'];?></td>
  <td>
      <form action="" method="POST">
        <input type="hidden" name="id" value="<?= $fetch_referral['id'];?>" />
        <input type="hidden" name="status" value="<?= $fetch_referral['status'];?>" />
        <input type="submit"  value="Claim" class="claim <?php if($fetch_referral['status'] =='claim' or $fetch_referral['status'] =='paid'){echo 'disabled';} ;?>" style="width:100%; background:#222; color:#fff;" name="claim">
      </form>
  </td>

  <?php 
        $no++;
          }
        }
      else{
        ?>
        <tr>
              <td colspan="5" style="text-align: center;">No Record Found</td>
        </tr>
        <?php
      } 
    
   ?>
</tr>
    </tbody>

    </table>


</section>








<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<?php include 'components/footer.php'; ?>

<!-- custom js file link  -->
<script src="js/script.js"></script>

<?php include 'components/message.php'; ?>
</body>
</html>