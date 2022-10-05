<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">

    <title>Login</title>

    <style>
        .customBgColor{
            background-color:  #79ddd8;
            color: white
        }
    </style>
</head>

<body>
    <section class="head">
        <div  class="d-flex text-center justify-content-center py-4 px-4 customBgColor" style="font-family: 'Oswald', sans-serif; font-size: xx-large;">
            Movie Collection System
        </div>
    </section>
    <section class="vh-100">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center mt-5 h-100"> 
                <div class="col-xl-4 offset-xl-1">
                    <form action="ControllerServlet" method="post">
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <label class="form-label" class="bold">Email address</label>
                            <input type="email" name="email" class="form-control form-control-lg" placeholder="Enter a valid email address" />
                        </div>

                        <div class="form-outline mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" required class="form-control form-control-lg" placeholder="Enter password" />
                        </div>

                        <div class="form-outline mb-3">
                            <label class="form-label">Age</label>
                            <input type="text" name="age" required class="form-control form-control-lg" placeholder="Enter password" />
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" required class="form-control form-control-lg" placeholder="Enter password" />
                        </div>


                        <div class="text-center text-lg-start mt-4 pt-2">
                            <button type="submit" name="action" value="signup" class="btn btn-lg customBgColor"
                                style="padding-left: 2.5rem; padding-right: 2.5rem; ">Signup</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <div
            class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
            <!-- Copyright -->
            <div class="text-white mb-3 mb-md-0">
                Copyright hamsof © 2022. All rights reserved.
            </div>
            <!-- Copyright -->
        </div>
    </section>
</body>

</html>