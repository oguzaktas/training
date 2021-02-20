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
public class TestJoinMethod3 extends Thread {
    
    public void run() {
        System.out.println("Thread is running.");
    }
    
    public static void main(String[] args) {
        TestJoinMethod3 t1 = new TestJoinMethod3();
        TestJoinMethod3 t2 = new TestJoinMethod3();
        System.out.println("Name of t1: " + t1.getName());
        System.out.println("Name of t2: " + t2.getName());
        System.out.println("Id of t1: " + t1.getId());
        System.out.println("Id of t2: " + t2.getId());
        t1.start();
        t2.start();
        t1.setName("Thread 1 - oguz");
        System.out.println("New name of t1: " + t1.getName());
    }
    
}
