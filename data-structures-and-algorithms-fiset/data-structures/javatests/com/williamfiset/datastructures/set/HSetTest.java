package javatests.com.williamfiset.datastructures.set;

import static java.lang.Math.*;
import static org.junit.Assert.*;

import com.williamfiset.datastructures.set.HSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import org.junit.*;

// You can set the hash value of this object to be whatever you want
// This makes it great for testing special cases.
class ConstObj {
  int hash, data;

  public ConstObj(int hash, int data) {
    this.hash = hash;
    this.data = data;
  }

  @Override
  public int hashCode() {
    return hash;
  }

  @Override
  public boolean equals(Object o) {
    return data == ((ConstObj) o).data;
  }
}

public class HSetTest {

  static Random r = new Random();

  static final int LOOPS = 100;
  static final int TEST_SZ = 1000;
  static final int MAX_RAND_NUM = 50000;

  HSet<Integer> hs;

  @Before
  public void setup() {
    hs = new HSet<>();
  }

  @Test
  public void testAddRemove() {
    hs.add(5);
    assertEquals(hs.size(), 1);
    hs.remove(5);
    assertEquals(hs.size(), 0);
    hs.add(0);
    assertEquals(hs.size(), 1);
    hs.remove(0);
    assertEquals(hs.size(), 0);
    hs.add(-5);
    assertEquals(hs.size(), 1);
    hs.remove(-5);
    assertEquals(hs.size(), 0);
  }

  @Test
  public void randomizedSetTest() {
    HashSet<Integer> s = new HashSet<>();
    for (int loop = 0; loop < LOOPS; loop++) {

      s.clear();
      hs.clear();

      List<Integer> nums = genRandList(TEST_SZ);
      for (int i = 0; i < TEST_SZ; i++) {

        int num = nums.get(i);
        // assertEquals( hs.add(num), s.add(num) );
        hs.add(num);
        s.add(num);

        // Make sure this is a bijection
        for (Integer n : s) hs.contains(n);
        for (Integer n : hs) s.contains(n);

        assertEquals(s.size(), hs.size());
      }
    }
  }

  @Test
  public void randomizedSetTest2() {

    HashSet<ConstObj> s = new HashSet<>();

    for (int loop = 0; loop < LOOPS; loop++) {

      int sz = (int) (Math.random() * TEST_SZ) + 1;
      HSet<ConstObj> hs = new HSet<>(sz);

      s.clear();

      List<Integer> nums = genRandList(TEST_SZ);
      for (int i = 0; i < TEST_SZ; i++) {

        int num = nums.get(i);
        ConstObj obj = new ConstObj(java.util.Objects.hash(num), num);
        // assertEquals( hs.add(num), s.add(num) );
        hs.add(obj);
        s.add(obj);

        // Make sure this is a bijection
        for (ConstObj n : s) hs.contains(n);
        for (ConstObj n : hs) s.contains(n);

        assertEquals(s.size(), hs.size());
      }
    }
  }

  @Test
  public void t() {

    ConstObj ch1 = new ConstObj(29827, 1);
    ConstObj ch2 = new ConstObj(29807, 3);

    HSet<ConstObj> s = new HSet<ConstObj>();

    s.add(ch1);
    assertEquals(1, s.size());
    s.remove(ch1);
    assertEquals(0, s.size());
    s.add(ch2);
    assertEquals(1, s.size());
    s.remove(ch2);
    assertEquals(0, s.size());
  }

  // Generate a list of random numbers
  static List<Integer> genRandList(int sz) {
    List<Integer> lst = new ArrayList<>(sz);
    for (int i = 0; i < sz; i++) lst.add((int) (Math.random() * MAX_RAND_NUM));
    Collections.shuffle(lst);
    return lst;
  }

  // Generate a list of unique random numbers
  static List<Integer> genUniqueRandList(int sz) {
    List<Integer> lst = new ArrayList<>(sz);
    for (int i = 0; i < sz; i++) lst.add(i);
    Collections.shuffle(lst);
    return lst;
  }
}
