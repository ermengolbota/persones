<h1>HOLA</h1>
<p>
<?php
echo "soc php";
?>


</p>
</h2>Adeu</h2>
<?php
$servername = "db";
$username = "root";
$password = "1Password";
$dbname = "persones";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  echo "ERROR CONNECTION";
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT id, nom FROM noms";
$result = $conn->query($sql);
echo "OK";
if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "id: " . $row["id"]. " - Nom: " . $row["nom"]."<br>";
  }
} else {
  echo "0 results";
}
$conn->close();

?>