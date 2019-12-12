<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="/img/UTG-icon.gif">
    <title>{{ config('app.name') }}</title>
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <!-- Nucleo Icons -->
    <link href="{{ asset('black/assets/css/nucleo-icons.css') }}" rel="stylesheet" />
    <!-- CSS Files -->
    <link href="{{ asset('black/assets/css/black-dashboard.css?v=1.0.0') }}" rel="stylesheet" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="{{ asset('black/assets/demo/demo.css') }}" rel="stylesheet" />
    <link href="{{ asset('css/app.css') }}" rel="stylesheet" />
</head>

<body class="">

    <div id="app">
        <div class="wrapper">
            <router-view></router-view>
        </div>
    </div>

<!--   Core JS Files   -->
<script src="{{ asset('black/assets/js/core/jquery.min.js') }}"></script>
<script src="{{ asset('black/assets/js/core/popper.min.js') }}"></script>
<script src="{{ asset('black/assets/js/core/bootstrap.min.js') }}"></script>
<script src="{{ asset('black/assets/js/plugins/perfect-scrollbar.jquery.min.js') }}"></script>
<!--  Google Maps Plugin    -->
<!-- Chart JS -->
<script src="{{ asset('black/assets/js/plugins/chartjs.min.js') }}"></script>
<!--  Notifications Plugin    -->
<script src="{{ asset('black/assets/js/plugins/bootstrap-notify.js') }}"></script>
<!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
<script src="{{ asset('black/assets/js/black-dashboard.min.js?v=1.0.0') }}"></script><!-- Black Dashboard DEMO methods, don't include it in your project! -->
<script src="{{ asset('js/app.js') }}"></script>
</body>

</html>
