<!DOCTYPE html >
<html>
<head>
    <link rel="stylesheet" href="demos.css" type="text/css" media="screen" />
    <script src="../libraries/RGraph.common.core.js" ></script>
    <script src="../libraries/RGraph.line.js" ></script>
    <!--[if lt IE 9]><script src="../excanvas/excanvas.js"></script><![endif]-->
    
    
</head>
<body>

   <center>
  <h1><font color="blue">ICUAS-JMMC</font></h1>
<img src="charts.png" width="200" height="50"><br><br><br>

    <canvas id="cvs" width="600" height="250">[No canvas support]</canvas>
    </center>
    <script>
        data = RGraph.array_pad([], 500);

        function DrawGraph ()
        {
            RGraph.Clear(document.getElementById("cvs"));
            RGraph.ObjectRegistry.Clear();

            var line = new RGraph.Line('cvs', data);
            line.Set('chart.colors', ['green']);
            line.Set('chart.linewidth', 1);
            line.Set('chart.filled', true);
            line.Set('chart.fillstyle', 'rgba(128,255,128,0.5)');
            line.Set('chart.ymax', 60);
            line.Set('chart.numxticks', 5);
            line.Set('chart.labels', ['Now','25s','50s','75s','100s','125s']);
            line.Draw();

            r    = RGraph.random(45,55);
            data = [r].concat(data);
            data.pop();

            
            setTimeout(DrawGraph, 250);
        }
        
        window.onload = function ()
        {
            DrawGraph();
        }
    </script>

  

</body>
</html>
