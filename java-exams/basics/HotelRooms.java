package edu.matkosoric.basics;

/*
 * Code examples for Oracle Certified Associate (OCA) Exam
 * Java 8 SE, 2017.
 * Created by © Matko Soric.
 */

public class HotelRooms {

    // demonstration of System.arraycopy
    // old values are overwritten, not shifted.
    // position index is zero based.
    // destination array has to have enough existing slots to accommodate incoming values

    public static void main(String[] args) {

        int [] reservedRooms = {5,6,7,8};
        int [] alternativeRooms = {0, 0, 0, 0, 0, 0, 0};
        System.arraycopy(reservedRooms, 0, alternativeRooms,5,2);
        for (int k : alternativeRooms) System.out.print(k + " ");

        System.out.println("\n");

        // arraycopy can be used with identical source and destination array
        System.arraycopy(reservedRooms, 1, reservedRooms, 3, 1);
        for (int k : reservedRooms) System.out.print(k + " ");

        System.out.println("\n");

        // this will compile, but produce a runtime NullPointerException
        int [] outOfOrderRooms = null;
//        System.arraycopy(reservedRooms, 0, outOfOrderRooms,0,1);

        // this will compile, but produce a runtime ArrayIndexOutOfBoundsException
        // destination array has only one available slot, not three
        int [] hauntedRooms = {666};
        System.arraycopy(reservedRooms, 0, hauntedRooms,0,3);


    }
}
