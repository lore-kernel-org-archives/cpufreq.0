From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: 2.6.2-rc2-bk1 oopses on boot (ACPI patch)
Date: Mon, 9 Feb 2004 17:10:10 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209161010.GA17457@dominikbrodowski.de>
References: <40171B5B.4020601@oracle.com>
	<Pine.LNX.4.58.0401271859140.10794@home.osdl.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0401271859140.10794@home.osdl.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>, cpufreq@www.linux.org.uk
Cc: Andrew Morton <akpm@osdl.org>, Dave Jones <davej@redhat.com>

On Tue, Jan 27, 2004 at 07:06:41PM -0800, Linus Torvalds wrote:
> 
> 
> On Wed, 28 Jan 2004, Alessandro Suardi wrote:
> >
> > Already reported, but I'll do so once again, since it looks like
> >   in a short while I won't be able to boot official kernels in my
> >   current config...
> >
> >	http://www.ussg.iu.edu/hypermail/linux/kernel/0312.3/0442.html
> 
> Can you make adjust_jiffies() print out its arguments (it's in 
> drivers/cpufreq/cpufreq.c).
> 
> It looks like cpufreq_scale() gets a divide-by-zero or an overflow on one 
> of
> 
> 	l_p_j_ref, l_p_j_ref_freq, ci->new
> 
> and just printing out those values would be interesting.
> 
> That said, the code is crap anyway. It does various divides without 
> actually testing for any sanity at all, and tries to "avoid overflow" by 
> totally bogus methods, instead of just using the 64-bit do_div64().

Does this look better?

	Dominik

Use do_div on 32-bit archs in cpufreq_scale, and native "/" on 64-bit archs.

 include/linux/cpufreq.h |   22 +++++++++++-----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2004-02-08 18:50:38.000000000 +0100
+++ linux/include/linux/cpufreq.h	2004-02-09 16:58:15.290592840 +0100
@@ -110,24 +110,24 @@
  * @div:   divisor
  * @mult:  multiplier
  *
- * Needed for loops_per_jiffy and similar calculations.  We do it 
- * this way to avoid math overflow on 32-bit machines.  This will
- * become architecture dependent once high-resolution-timer is
- * merged (or any other thing that introduces sc_math.h).
  *
  *    new = old * mult / div
  */
 static inline unsigned long cpufreq_scale(unsigned long old, u_int div, u_int mult)
 {
-	unsigned long val, carry;
+#if BITS_PER_LONG == 32
 
-	mult /= 100;
-	div  /= 100;
-        val   = (old / div) * mult;
-        carry = old % div;
-	carry = carry * mult / div;
+	u64 result = ((u64) old) * ((u64) mult);
+	do_div(result, div);
+	return (unsigned long) result;
 
-	return carry + val;
+#elif BITS_PER_LONG == 64
+
+	unsigned long result = old * ((u64) mult);
+	result /= div;
+	return result;
+
+#endif
 };
 
 /*********************************************************************
