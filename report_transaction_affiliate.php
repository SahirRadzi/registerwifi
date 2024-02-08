<?php  

include 'components/connect.php';

session_start();

if(isset($_SESSION['unique_id'])){
   $unique_id = $_SESSION['unique_id'];
}else{
   $unique_id = '';
   header('location:login');
};

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Report Transaction Affiliate | RegisterWifi.Online</title>

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
tr:hover td {
  background-color: #f9f9f9;
}

@media screen and (max-width: 576px) {
  table{
    min-width: 50%;
  }
  td,
  th{
    font-size: 1.2rem;
  }
}
/* end: Table */

   </style>

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="dashboard">

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
        $jumlah_baki_semasa = 0;
        $select_my_affiliate = $conn->prepare("SELECT user.unique_id, user.nama, user.referral_code, report_affiliate.referral_code, report_affiliate.komisen_masuk FROM user INNER JOIN report_affiliate ON user.referral_code = report_affiliate.referral_code WHERE report_affiliate.status = ? AND user.unique_id = ?");
        $select_my_affiliate->execute(['pending', $unique_id]);
            while($total_komisen_masuk = $select_my_affiliate->fetch(PDO::FETCH_ASSOC)){
                $jumlah_baki_semasa += $total_komisen_masuk['komisen_masuk'];
            }
      
      ?>

      <h3>RM <?= $jumlah_baki_semasa ;?></h3>
      <p>Jumlah Baki Semasa Terkini</p>

      </div>

      <div class="box">
      <?php
         $jumlah_pengeluaran = 0;
         $select_my_affiliate = $conn->prepare("SELECT user.unique_id, user.nama, user.referral_code, report_affiliate.referral_code, report_affiliate.komisen_masuk FROM user INNER JOIN report_affiliate ON user.referral_code = report_affiliate.referral_code WHERE report_affiliate.status = ? AND user.unique_id = ?");
         $select_my_affiliate->execute(['claim',$unique_id]);
            while($total_komisen_masuk = $select_my_affiliate->fetch(PDO::FETCH_ASSOC)){
                $jumlah_pengeluaran += $total_komisen_masuk['komisen_masuk'];
            }
            
      ?>
        
      <h3>RM <?= $jumlah_pengeluaran;?></h3>
      <p>Jumlah Permohonan Pengeluaran Terkini</p>
   
      </div>

      <div class="box">

      <?php
         $jumlah_terima = 0;
         $select_my_affiliate = $conn->prepare("SELECT user.unique_id, user.nama, user.referral_code, report_affiliate.referral_code, report_affiliate.komisen_masuk FROM user INNER JOIN report_affiliate ON user.referral_code = report_affiliate.referral_code WHERE report_affiliate.status = ? AND user.unique_id = ?");
         $select_my_affiliate->execute(['paid', $unique_id]);
            while($total_terima = $select_my_affiliate->fetch(PDO::FETCH_ASSOC)){
                $jumlah_terima += $total_terima['komisen_masuk'];
            }
            
      ?>
      
      <h3>RM <?= $jumlah_terima ;?></h3>
      <p>Jumlah Terima Komisen Terkini</p>

      </div>
    


   </div>

</section>

<section class="referral-program">

<h1 class="heading">report transaction</h1>

<table id="myTable" class="table table-striped">
    <thead>
      <tr>
        <th>#</th>
        <th>Tarikh</th>
        <th>Order</th>
        <th>Komisen</th>
        <th>Status</th>
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
      $select_all = $conn->prepare("SELECT user.unique_id, user.nama, user.referral_code, report_affiliate.olid, report_affiliate.referral_code, report_affiliate.komisen_masuk, report_affiliate.tarikh, report_affiliate.status FROM user INNER JOIN report_affiliate ON user.referral_code = report_affiliate.referral_code WHERE report_affiliate.referral_code = ?");
      $select_all->execute([$myreferral]);
      if($select_all->rowCount() > 0){
          while($fetch_referral = $select_all->fetch(PDO::FETCH_ASSOC)){

      ?>
      <tr>
        <td><?=$no;?></td>
        <td><?= date("d/m/y",strtotime($fetch_referral['tarikh']));?></td>
        <td><?=$fetch_referral['olid'];?></td>
        <td> RM <?=$fetch_referral['komisen_masuk'];?></td>
        <td><?=$fetch_referral['status'];?></td>

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