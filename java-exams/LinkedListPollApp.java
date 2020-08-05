// Java code to demonstrate the practical 
// application of poll() in linked list 

import java.util.*;

public class LinkedListPollApp {

    public static void main(String[] args) {

        // Declaring a LinkedList 
        LinkedList list = new LinkedList();

        // adding queue entry of people 
        // in order 
        list.add("Astha");
        list.add("Shambhavi");
        list.add("Nikhil");
        list.add("Manjeet");

        // printing the list 
        System.out.println("The initial queue is : " + list);

        System.out.print("The order of exit is : ");

        while (!list.isEmpty()) {
            // using poll() to display the order of exit from queue 
            System.out.print(list.poll() + " <-- ");
        }
    }
}
