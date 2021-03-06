<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" type="image/png" href="/img/UTG-icon.gif">
    <title>{{ config('app.name') }}</title>
    <!-- Nucleo Icons -->
    <link href="{{ asset('black/assets/css/nucleo-icons.css') }}" rel="stylesheet" />
    <!-- CSS Files -->
    <link href="{{ asset('black/assets/css/black-dashboard.css?v=1.0.0') }}" rel="stylesheet"/>
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
<script src="{{ asset('black/assets/js/black-dashboard.min.js?v=1.0.0') }}"></script>
{{--    <!-- Black Dashboard DEMO methods, don't include it in your project! -->--}}
{{--<script src="{{ asset('black/assets/demo/demo.js') }}"></script>--}}
    <script>
        $(document).ready(function() {
            $().ready(function() {
                $sidebar = $('.sidebar');
                $navbar = $('.navbar');
                $main_panel = $('.main-panel');

                $full_page = $('.full-page');

                $sidebar_responsive = $('body > .navbar-collapse');
                sidebar_mini_active = true;
                white_color = false;

                window_width = $(window).width();

                fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();
            });
        });
    </script>
    <script src="{{ asset('js/app.js') }}"></script>
</body>

</html>
