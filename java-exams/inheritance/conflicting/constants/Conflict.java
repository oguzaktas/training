package edu.matkosoric.inheritance.conflicting.constants;

import static java.lang.Short.*;
import static java.lang.Float.*;

// COMPILER ERROR - ISPRAVITI
//import static edu.matkosoric.inheritance.conflicting.constants.alternative.value.*;
import static java.lang.Double.*;
/*
 * Code examples for Oracle Certified Associate (OCA) Exam
 * Java 8 SE, 2017.
 * Created by © Matko Soric.
 */

public class Conflict {

    // conflicting variables will produce a compile time error, not run time error

    public static void main(String[] args) {

        // the variable named SIZE is present in both Short and Float class,
        // making it unusable in a short form
//        System.out.println(SIZE);             // does not compile, ambiguous reference

        // this works fine
        System.out.println(Short.SIZE);
        System.out.println(Float.SIZE);

        // here is a conflict between Double and created class AlternativeValue
//        System.out.println(MIN_VALUE);      // does not compile, ambiguous reference

    }

}
