<?php
	/*if (!isset($_POST['label'])) {
        echo "label is not set";
        die;
    }*/

    $data = json_decode($HTTP_RAW_POST_DATA, true);

    // {"label":"staying","accelData":{"timestamps":null,"xs":null,"ys":null,"zs":null},"axesData":[]}

    $label = $data['label'];
    $f = fopen("track_data_$label.json.1", 'w');
    fwrite($f, $HTTP_RAW_POST_DATA);
    fclose($f);