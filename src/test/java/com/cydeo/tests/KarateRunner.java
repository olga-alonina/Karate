package com.cydeo.tests;

import com.intuit.karate.junit5.Karate;

public class KarateRunner {
    @Karate.Test
    public Karate runSpartanTag() {
        return new Karate().relativeTo(getClass());
       // return Karate.run("get_spartans").tags("spartan").relativeTo(getClass());
    }

}
