
<!DOCTYPE html >
<html>
<head>
    <link rel="stylesheet" href="demos.css" type="text/css" media="screen" />
    <script src="../libraries/RGraph.common.core.js" ></script>
    <script src="../libraries/RGraph.common.dynamic.js" ></script>
    <script src="../libraries/RGraph.common.tooltips.js" ></script>
    <script src="../libraries/RGraph.common.effects.js" ></script>
    <script src="../libraries/RGraph.common.key.js" ></script>
    <script src="../libraries/RGraph.line.js" ></script>
    <script src="../libraries/jquery.min.js" ></script>
    <!--[if lt IE 9]><script src="../excanvas/excanvas.js"></script><![endif]-->
    
   
</head>
<body>
<center>
  <h1><font color="blue">ICUAS-JMMC</font></h1>
<img src="charts.png" width="200" height="50"><br><br><br>
    
    <canvas id="cvs" width="700" height="250">[No canvas support]</canvas>
  
  </center>  
    <script>
        window.onload = function ()
        {
            var gutterLeft = 150;
            var gutterRight = 40;
            var gutterTop   = 25;

            var line1 = new RGraph.Line('cvs', [1,3,5,2,5,6,8,4,4,5,3,6]);
            line1.Set('ymax', 10);
            line1.Set('hmargin', 5);
            line1.Set('gutter.right', gutterRight);
            line1.Set('gutter.left', gutterLeft);
            line1.Set('gutter.top', gutterTop);
            line1.Set('labels', ['8','10','12','14','16','18','20','22','0','2','4','6']);
            line1.Set('tooltips', ['rJan','rFeb','rMar','rApr','rMay','rJun','rJul','rAug','rSep','rOct','rNov','rDec']);
            line1.Set('colors', ['red', 'green', 'blue']);
            line1.Set('key', ['TEMP', 'PRESSURE', 'RESP-RATE']);
            line1.Set('key.position', 'gutter');
            line1.Set('key.position.gutter.boxed', false);
            line1.Set('key.position.x', 275);
            line1.Set('noaxes', true);
            line1.Set('ylabels', false);
            line1.Draw();
    
            var line2 = new RGraph.Line('cvs', [54,53,56,58,57,53,49,52,53,56,61,58]);
            line2.Set('ymax', 100);
            line2.Set('background.grid', false);
            line2.Set('colors', ['green']);
            line2.Set('hmargin', 5);
            line2.Set('gutter.right', gutterRight);
            line2.Set('gutter.left', gutterLeft);
            line2.Set('gutter.top', gutterTop);
            line2.Set('tooltips', ['gJan','gFeb','gMar','gApr','gMay','gJun','gJul','gAug','gSep','gOct','gNov','gDec']);
            line2.Set('ylabels', false);
            line2.Set('noaxes', true);
            line2.Draw();
    
            var line3 = new RGraph.Line('cvs', [31,35,32,36,34,32,33,35,28,17,18,18]);
            line3.Set('ymax', 50);
            line3.Set('background.grid', false);
            line3.Set('ylabels', false);
            line3.Set('noaxes', true);
            line3.Set('colors', ['blue']);
            line3.Set('hmargin', 5);
            line3.Set('gutter.right', gutterRight);
            line3.Set('gutter.left', gutterLeft);
            line3.Set('gutter.top', gutterTop);
            line3.Set('tooltips', ['bJan','bFeb','bMar','bApr','bMay','bJun','bJul','bAug','bSep','bOct','bNov','bDec']);
    
    
    
            /**
            * This draws the extra axes. It's run whenever the line3 object is drawn
            */
            myFunc = function ()
            {
                RGraph.DrawAxes(line1, {
                                        'chart.x': line1.canvas.width - gutterRight,
                                        'chart.color': 'red',
                                        'chart.text.color': 'red',
                                        'chart.max': 100,
                                        'chart.min': 0,
                                        'chart.title': 'TEMP'
                                       });
                RGraph.DrawAxes(line2, {
                                        'chart.x': 100,
                                        'chart.y': 25,
                                        'chart.color': 'green',
                                        'chart.text.color': 'green',
                                        'chart.max': 200 ,
					'chart.title': 'PRESSURE'
                                       });
                RGraph.DrawAxes(line3, {
                                        'chart.x': 50,
                                        'chart.y': 25,
                                        'chart.color': 'blue',
                                        'chart.text.color': 'blue',
                                        'chart.max': 120 ,
					'chart.title': 'RESP-RATE'
                                       });
            };
            RGraph.AddCustomEventListener(line3, 'ondraw', myFunc);
    
    
    
            line3.Draw();
        }
    </script>

   

</body>
</html>
