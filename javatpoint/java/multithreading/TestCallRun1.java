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
public class TestCallRun1 extends Thread {
    public void run() {
        System.out.println("Thread is running.");
    }
    
    public static void main(String[] args) {
        TestCallRun1 t1 = new TestCallRun1();
        t1.run(); // does not start a separate call stack
    }
}
