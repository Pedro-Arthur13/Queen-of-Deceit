if (keyboard_check_pressed(ord("E"))) {
    if (image_index < image_number - 1) {
        image_index += 1;
    } else {
        instance_destroy();
        global.indialog = false;
    }
}
