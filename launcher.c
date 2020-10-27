/**
 * @Author: Hyunjoon Lim
 * @Title: Launcher to start (1) apache web-server and (2) applications automatically
 * @Prequisites: PHP web-application, Python applications (ex. PIR, Face, Camera, ...)
 * @Description:
 * - How to compile: $ gcc -o launcher launcher.c
 * - How to run:     $ launcher
 */ 

#include <stdio.h>  // printf()
#include <stdlib.h> // system()

int main(void){
    int result;
  
    // Start golden-time
    printf ("Starting golden-time Launcher...\n");
    printf ("Press CTRL+C if you want to stop.\n");
    printf ("\n");
    printf ("\n");
    printf ("\n");
    printf ("\n");

    // Step 1: Run Apache web-server for web application
    // * $ sudo systemctl restart apache2
    printf("(1/3)[webapp] Starting Apache web-server...\n");
    result = system("sudo systemctl daemon-reload");
    result = system("sudo systemctl restart apache2");
    if (result == -1){
        printf("[ERROR] apache2: A web-server process could not be created. return value is %d.\n",result); exit(0);
    }
    else if (result == 127){
        printf("[ERROR] apache2: A web-server process could not be executed. return value is %d\n",result); exit(0);
    }
    else
        printf("[SUCCESS] Apache web-server is successfully started.\n");

    // Step 2: Run Camera module
    printf("(2/3) [camera] Starting Camera program.....\n");
    // hog is 1. ssd is 2
    int camera_menu = 1; 

    if (camera_menu == 1)
       result = system("cd /var/www/html/golden-time/camera/opencv-face-recognition-hog/ ; ./02-run.sh &");
    if (camera_menu ==2) 
       result = system("cd /var/www/html/golden-time/camera/opencv-face-recognition-ssd/ ; ./03-run-camera.sh &");


    if(result == -1){
	printf("[ERROR] camera : A camera process could not be created. return value is %d.\n",result);exit(0);
    
    }
    
    if(result == 127){
	printf("[ERROR] camera : A camera process could not be created. return value is %d.\n",result);exit(0);
    }

    else
	printf("[SUCCESS] camera process is successfully started.\n");
    // Step 3: Run the PIR Motion Sensor
    // * with background: exec /var/www/html/golden-time/sensor/detector &> /dev/null &
    // * with foreground: /var/www/html/goldrn-time/sensor/detector.py 
    printf("(3/3)[sensor] Starting PIR sensor program...\n");
    result = system("/var/www/html/golden-time/sensor/detector.py");
    if (result == -1){
        printf("[ERROR] pir sensor: A PIR sensor process could not be created. return value is %d.\n",result); exit(0);
    }
    else if (result == 127){
        printf("[ERROR] pir sensor: A PIR sensor process could not be executed. return value is %d.\n",result); exit(0);
    }
    else
        printf("[SUCCESS] A PIR sensor process is successfully started.\n");
           


    // display help message to users.
    printf("Please visit http://localhost/ to use web-application.\n");
            
    return 0;
}
