// Java code to demonstrate the working 
// of pollLast() in linked list

package linkedlistpolllast;

import java.util.*; 
public class LinkedListPollLast { 
  
public static void main(String[] args) 
    { 
  
        // Declaring a LinkedList 
        LinkedList list = new LinkedList(); 
  
        // adding  elements 
        list.add("Geeks"); 
        list.add(4); 
        list.add("Geeks"); 
        list.add(8); 
  
        // printing the list 
        System.out.println("The initial Linked List is : " + list); 
  
        // using pollLast() to retrieve and remove the tail 
        // removes and displays 8 
        System.out.println("Tail element of the list is : " + list.pollLast()); 
  
        // printing the resultant list 
        System.out.println("Linked List after removal using pollLast() : " + list); 
    } 
} 