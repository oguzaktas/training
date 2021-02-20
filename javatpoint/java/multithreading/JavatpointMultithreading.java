/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javatpointmultithreading;

/**
 *
 * @author oguz
 */
public class JavatpointMultithreading extends Thread {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        JavatpointMultithreading th = new JavatpointMultithreading();
        th.start();
        Thread t1 = new Thread(th);
        t1.start();
    }
    
    public void run() {
        System.out.println("Thread is running.");
    }
    
}
