<!DOCTYPE html>
<html>
    <head>
        <title>jquery.bootstrap-growl Demo</title>
        <link rel="stylesheet" type="text/css"
              href="/bootstrap/css/bootstrap.css">
    </head>
    <body>

        <script src="/js/jquery.min.js"></script>
        <script src="/bootstrap/js/bootstrap.min.js"></script>
        <script src="/js/jquery.bootstrap-growl.js"></script>

        <script type="text/javascript">

            $(function() {
                $.bootstrapGrowl("This is a test.");
                
                setTimeout(function() {
                    $.bootstrapGrowl("This is another test.", { type: 'success' });
                }, 1000);
                
                setTimeout(function() {
                    $.bootstrapGrowl("Danger, Danger!", {
                        type: 'danger',
                        align: 'center',
                        width: 'auto',
                        allow_dismiss: false
                    });
                }, 2000);
                
                setTimeout(function() {
                    $.bootstrapGrowl("Danger, Danger!", {
                        type: 'info',
                        align: 'left',
                        stackup_spacing: 30
                    });
                }, 3000);
            });

        </script>

    </body>
</html>
