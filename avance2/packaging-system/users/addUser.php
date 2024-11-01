<!DOCTYPE html>
<html lang="en">

<?php
    require "userFun.php";

    $user_types = getUserTypes();
    $supervisors = getSupervisors();

    var_dump($user_types);

    if($_SERVER['REQUEST_METHOD']=='POST'){
        $username = $_POST['username'];
        $password = $_POST['password'];
        $name = $_POST['name'];
        $first_surname = $_POST['first_surname'];
        $second_surname = $_POST['second_surname'];
        $date = $_POST['date'];
        $neighborhood = $_POST['neighborhood'];
        $street = $_POST['street'];
        $postal_code = $_POST['postal_code'];
        $phone = $_POST['phone'];
        $email = $_POST['email'];
        $user_type = $_POST['user_type'];
        $supervisor = $_POST['supervisor'];

        $result = addUser($username, $password, $name, $first_surname,
            $second_surname, $date, $neighborhood, $street, $postal_code,
            $phone, $email, $user_type, $supervisor
        );

        if($result){
            echo '<p>Registered User<p>';
        }
    }

?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="/styles/!important.css">
    <link rel="stylesheet" href="/styles/!color-palette.css">
    <link rel="stylesheet" href="/styles/register.css">
</head>

<body>

    <div class="container">
        <main>
            <div class="py5" style="text-align: center;">
                <svg width="60" height="60" viewBox="0 0 16 16" fill="#5C73F2">
                    <path
                        d="M15.528 2.973a.75.75 0 0 1 .472.696v8.662a.75.75 0 0 1-.472.696l-7.25 2.9a.75.75 0 0 1-.557 0l-7.25-2.9A.75.75 0 0 1 0 12.331V3.669a.75.75 0 0 1 .471-.696L7.443.184l.01-.003.268-.108a.75.75 0 0 1 .558 0l.269.108.01.003zM10.404 2 4.25 4.461 1.846 3.5 1 3.839v.4l6.5 2.6v7.922l.5.2.5-.2V6.84l6.5-2.6v-.4l-.846-.339L8 5.961 5.596 5l6.154-2.461z" />
                </svg>
                <h1>Checkout form</h1>
            </div>
            <div class="row-div">
                <div class="">
                    <form action="addUser.php">
                        <h2>Profile</h2>
                        <div class="row-form">
                            <div class="row-md-6">
                                <label for="name">Name</label>
                                <div class="input-group">
                                    <input name="name" id="name" type="text" required>
                                </div>
                            </div>
                            <div class="row-md-6">
                                <label for="first_surname">First Surname</label>
                                <div class="input-group">
                                    <input name="first_surname" id="first_surname" type="text" required>
                                </div>
                            </div>
                            <div class="row-md-6">
                                <label for="second_surname">Second Surname</label>
                                <div class="input-group">
                                    <input name="second_surname" id="second_surname" type="text" required>
                                </div>
                            </div>
                            <div class="row-lg-12">
                                <label for="username">User</label>
                                <div class="input-group">
                                    <input name="username" id="username" type="text" required placeholder="@Username">
                                </div>
                            </div>
                            <div class="row-lg-12">
                                <label for="email">Email</label>
                                <div class="input-group">
                                    <input name="email" id="email" type="email" placeholder="you@example.com">
                                </div>
                            </div>
                            <div class="row-lg-12">
                                <label for="phone">Phone number</label>
                                <div class="input-group">
                                    <input name="phone" id="phone" type="text" required placeholder="xx-xxx-xxxx-xxx">
                                </div>
                            </div>
                            <div class="row-lg-12">
                                <label for="password">Password</label>
                                <div class="input-group">
                                    <input type="password" name="password" id="password" required placeholder="***">
                                </div>
                            </div>
                            <div class="row-md-6">
                                <label for="user_type">User type</label>
                                <select name="user_type" id="user_type" class="input-group" name="" id="options">
                                <?php while ($user_type = mysqli_fetch_assoc($user_types)):?>    
                                    <option value="<?php echo $user_type['code']; ?>"><?php echo $user_type['name']; ?></option>
                                <?php endwhile; ?>
                                </select>
                            </div>
                            <div class="row-md-6">
                                <label for="date">Date of Birth</label>
                                <div class="input-group">
                                    <input type="date" name="date" id="date" required>
                                </div>
                            </div>
                        </div>
                        <hr class="border-bottom" style="margin-top: 2rem; margin-bottom: 2rem;">
                        <h2>Address</h2>
                        <div class="row-form">
                            <div class="row-sm-3">
                                <label for="">Postal code</label>
                                <div class="input-group">
                                    <input name="postal-code" id="postal-code" type="text" placeholder="#">
                                </div>
                            </div>
                            <div class="row-md-9">
                                <label for="">Neighborhood</label>
                                <div class="input-group">
                                    <input name="neighborhood" id="neighborhood" type="text" placeholder="">
                                </div>
                            </div>
<!--street, supervisor-->
                            <div class="row-sm-3">
                                <label for="">Street</label>
                                <div class="input-group">
                                    <input name="street" id="street" type="text" placeholder="#">
                                </div>
                            </div>
                            <div class="row-md-6">
                                <label for="supervisor">Supervisor</label>
                                <?php while ($supervisor = mysqli_fetch_assoc($supervisors)):?>    
                                    <option value="<?php echo $supervisor['num']; ?>"><?php echo $supervisor['name']; ?></option>
                                <?php endwhile; ?>
                            </div>
                        </div>
                        <hr class="border-bottom" style="margin-top: 2rem; margin-bottom: 2rem;">
                        <button class="btn-primary" type="submit">Confirm Registration</button>
                    </form>
                </div>
            </div>
        </main>
        <footer class="text-center" style="margin-top: 3rem; padding-top: 3rem; margin-bottom: 3rem;">
            <p>© 2024-2025 Packakings</p>
        </footer>
    </div>
</body>

</html>