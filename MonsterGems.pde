/*
 * Simple stochastic sampling (some would say monte carlo) estimation of the
 * May 20, 2016 "The Riddler" on FiveThirtyEight.com.
 * 
 * Written in Processing.
 *
 * I think this method will underestimate the expected value as it misses the
 * "tail" of increasing common gem counts. An analytic solution is preferred.
 * 
 * Typical output (1 billion trials):
 * Average common gems per gem set completion: 3.649862241
 */

import java.util.Random;


private Random random = new Random();
 
// Return number of Common gems.
private int trial()
{
  int c = 0;
  int u = 0;
  int r = 0;
 
  while (c == 0 || u == 0 || r == 0) {
    int g = random.nextInt(6);
   
    if (g < 3)
      c++;
    else if (g < 5)
      u++;
    else
      r++;
  }
 
  return c;
}
 
public void setup()
{
  final long TRIALS = 100L * 1000L * 1000L;
  long sum = 0;
  
  for (long i = 0; i < TRIALS; i++) {
    sum += trial();
  }
 
  println( "Average common gems per gem set completion: " + (double)sum / TRIALS );
}
