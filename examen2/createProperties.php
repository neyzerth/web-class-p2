<?php
    include "includes/header.php";
    require "includes/config/connectdb.php";
    
    $db = connectdb();
    
    // Verificar si hay datos enviados por POST
    if($_SERVER['REQUEST_METHOD']=='POST'){

        $title = $_POST['title'];
        $price = $_POST['price'];
        $image = $_POST['image'];
        $description = $_POST['description'];
        $rooms = $_POST['rooms'];
        $wc = $_POST['wc'];
        $timestamp = $_POST['timestamp'];
        $id_seller = $_POST['seller_id'];

        $query = "INSERT INTO propierties (title, price, image, description, rooms, wc, timestamp, id_seller) VALUES "
                        ."('$title', $price, '$image', '$description', $rooms, $wc, '".date("Y-m-d")."', $id_seller)";

        try {
            $response = mysqli_query($db, $query);
            echo "<p>Property Created!<p>";

        } catch (Exception  $e) {
            echo "<p>Error: Property not created: {$e->getMessage()}<p>";
        }

        try {
            $query = "SELECT id, name FROM sellers;";
            
            $sellers = mysqli_query($db, $query);
            
            if (!$sellers) {
                throw new Exception("Error: " . mysqli_error($db));
            }
        
        } catch (Exception $e) {
            echo "<p>Error: {$e->getMessage()}</p>";
        }
    
    }

?>

<section>
    <h2>Propierties Form</h2>
    <div>
        <form action="createProperties.php" method="post">
            <fieldset>
                <legend>Fill All Form Fields to Create a New Propierty</legend>
                <div>
                    <label for="title">Title</label>
                    <input required type="text" id="title" name="title" placeholder="Title of the propierty" >
                </div>
                <div>
                    <label for="price">Price</label>
                    <input required type="number" id="price" name="price" step ="any" placeholder="$100000">
                </div>
                <div>
                    <label for="image">Image</label>
                    <input type="file" id="image" name="image" accept="image/*">
                </div>
                <div>
                    <label for="description">Description</label>
                    <textarea name="description" id="description" placeholder="Propierty Description">
                    </textarea>
                </div>
                <div>
                    <label for="rooms">Number of Rooms</label>
                    <input type="number" id="rooms" name="rooms">
                </div>
                <div>
                    <label for="wc">Number of WC</label>
                    <input type="number" id="wc" name="wc">
                </div>
                <div>
                    <label for="garage">Number of Garage</label>
                    <input type="number" id="garage" name="garage">
                </div>
                <div>
                    <label for="seller_id">Select the seller</label>
                    <select name="seller_id" id="seller_id">
                        <?php while ($seller = mysqli_fetch_assoc($sellers)) { ?>
                            <option value="<?php echo $seller['id']; ?>"><?php echo $seller['name']; ?></option>
                        <?php } ?>
                    </select>
                </div>
                <div>
                    <button type="submit">Create a New Propierty</button>
                </div>
            </fieldset>
        </form>
    </div>
</section>

<?php
    include "includes/footer.php";
?>