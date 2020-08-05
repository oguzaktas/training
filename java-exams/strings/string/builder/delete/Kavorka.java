package edu.matkosoric.strings.string.builder.delete;

/*
 * Code examples for Oracle Certified Associate (OCA) Exam
 * Java 8 SE, 2017.
 * Created by © Matko Soric.
 */

public class Kavorka {

    public static void main(String[] args) {

        // delete method for the StringBuilder class works even if an ending index is larger than the object's length

        StringBuilder kavorka = new StringBuilder("Kavorka - The Lure of the Animal");

        System.out.println(kavorka.delete(10, 19));
        System.out.println(kavorka.delete(7, 3000));        // weird but valid


        // similar effect might be accomplished with the setLength() method
        StringBuilder help = new StringBuilder("Yes, yes I will help you. Listen very carefully. I want you to " +
                "buy ten cloves of garlic, three quarts of vinegar, six ounces…");
        help.setLength(25);
        System.out.println(help);

        // similar action on a String-type object
        String religion = "Latvian-Orthodox";
        religion = religion.substring(religion.indexOf("-")+1, religion.length());
        System.out.println(religion);

    }
}
