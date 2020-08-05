package edu.matkosoric.basics;

/*
 * Code examples for Oracle Certified Associate (OCA) Exam
 * Java 8 SE, 2017.
 * Created by © Matko Soric.
 */

public class ComparingPrimitives {

    // primitive integer types and decimals can be compared with == operator.
    // if decimal value corresponds with integer, result is true

    public static void main(String[] args) {

        double year1 = 2017.0;

        int year2 = 2017;
        System.out.println(year1 == year2);

        short year3 = 2017;
        System.out.println(year3 == year1);
        System.out.println(year3 == year2);

        Short year4 = 2017;
        System.out.println(year4 == year1);
        System.out.println(year4 == year2);
        System.out.println(year4 == year3);

    }
}
