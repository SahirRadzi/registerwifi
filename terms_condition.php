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
   <title>Terma & Syarat | RegisterWifi.Online</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

   <style>
.container {
  max-width: 991px;
  margin: 0 auto;
  padding: 50px 10px;
}
::-webkit-scrollbar {
  width: 6px;
  height: 6px;
}
::-webkit-scrollbar-track {
  background-color: #fff;
}
::-webkit-scrollbar-thumb {
  background-color: #ccc;
}
::-webkit-scrollbar-thumb:hover {
  background-color: #bbb;
}
/* end: Global */

/* start: Table */
.table-wrapper {
  height: 200px;
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
  font-size: 1.6rem;
  padding: 8px 16px;
  text-align: left;
}
th {
    width: 50%;
  text-transform: capitalize;
}
td {
  font-weight: 600;
  background-color: #fff;
  border-bottom: 1px solid #ddd;
}
tr:hover td {
  background-color: #f9f9f9;
}
/* end: Table */
   </style>

</head>
<body>
   
<?php include 'components/user_header.php'; ?>

<section class="property-form">

   <form action="" method="POST" enctype="multipart/form-data">
      <h3>Terma & Syarat-Syarat</h3>
      <h3>Referral Program</h3>
      <div class="box">
        <p>Sertai program ini, kongsikan pautan referral url anda. Setiap pelanggan baru yang daftar dan melanggan <span class="bold">Pakej Internet Unifi </span>
        di sistem ini, kami akan bayar anda komisen. Program ini terbuka kepada semua pengguna, yang berdaftar disini. Tanpa perlu modal anda masih boleh menikmati 
        pendapatan sampingan setiap bulan. Mudah sahajakan.</p>

        <p><span class="bold">Bagaimana ?</span></p>

        <p><b>LANGKAH 1</b></br>
        Klik menu -><b>my form</b> -><b>dashboard</b> -><b>referral program</b>.
        </p>

        <p><b>LANGKAH 2</b></br>
        Salin pautan referral url anda di -><b>referral setting</b>.
        </p>

        <p><b>LANGKAH 3</b></br>
        Setiap pelanggan baru yang daftar dan melanggan pautan anda, kami akan berikan komisen berdasarkan kadar berikut :
        </p>

    <div class="container">
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>Pakej Unifi Terkini</th>
              <th>Komisen (RM)</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Unifi Home 100Mbps</td>
              <td>RM 100</td>

            </tr>
            <tr>
              <td>Unifi Home 300Mbps</td>
              <td>RM 100</td>

            </tr>
            <tr>
              <td>Unifi Home 500Mbps</td>
              <td>RM 100</td>
            </tr>

            <tr>
              <td>Unifi + Netflix 100Mbps</td>
              <td>RM 100</td>
            </tr>

            <tr>
              <td>Unifi + Netflix 300Mbps</td>
              <td>RM 100</td>
            </tr>

            <tr>
              <td>Unifi + Netflix 500Mbps</td>
              <td>RM 100</td>
            </tr>
        
          </tbody>
        </table>
      </div>
    </div>


    <p><span class="bold">Pembayaran ?</span></p>

    <p>Pembayaran setiap 2 minggu terus ke akaun bank anda selepas permohonan pengeluaran <b>withdrawal</b> dibuat.</p>

    <br>
    <p><span class="bold">PENAFIAN :</span></p>

    <p>Semua kempen dan promosi mestilah dilakukan secara telus, tidak mengelirukan pelanggan, dan tidak melanggar mana-mana peraturan atau undang-undang yang ada. 
        Sebarang aktiviti promosi referral program secara tidak beretika atau melanggar peraturan akan mengakibatkan akaun referral anda ditamatkan serta merta tanpa sebarang notis. 
        Pihak kami juga berhak menolak permohonan pengeluaran komisen sekira perlu dengan alasan yang difikirkan wajar.</p>



      
      </div>
      <a href="referral_program" class="btn">back</a>
   </form>

</section>






<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<?php include 'components/footer.php'; ?>

<!-- custom js file link  -->
<script src="js/script.js"></script>

<?php include 'components/message.php'; ?>

</body>
</html>