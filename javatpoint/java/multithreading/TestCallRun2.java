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
public class TestCallRun2 extends Thread {
    public void run() {
        for (int i = 1; i < 5; i++) {
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                System.out.println(e);
            }
            System.out.println(i);
        }
    }
    
    public static void main(String[] args) {
        TestCallRun2 t1 = new TestCallRun2();
        t1.run(); // does not start a separate call stack
        TestCallRun2 t2 = new TestCallRun2();
        t2.run();
    }
}
