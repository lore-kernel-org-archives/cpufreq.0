From: Youichi Aso <aso@granite.phys.s.u-tokyo.ac.jp>
Subject: A patch to support centrino 1GHz
Date: Mon, 27 Oct 2003 11:18:04 +0900
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F9C805C.4040507@granite.phys.s.u-tokyo.ac.jp>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030001020606090502070404"
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: cpufreq@www.linux.org.uk

This is a multi-part message in MIME format.
--------------030001020606090502070404
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I recently bought a new laptop(Panasonic CF-T2) with Pentium M 1GHz.
I installed RedHat9.0 and upgraded the kernel to 2.4.22 with the latest 
CPUFreq patches for 2.4.
Then I found that speedstep-centrino.o failed to be loaded with the 
following error message,

speedstep-centrino: no support for CPU model "Intel(R) Pentium(R) M 
processor 1000MHz": send /proc/cpuinfo to Jeremy Fitzhardinge 
<jeremy@goop.org>

So I added Pentium M 1GHz model entry in speedstep-centrino.c (See the 
patch attached).
This works fine with my laptop.
I looked up the frequency-voltage table for the processor in the revised 
version of Pentium M data sheet, 252612-002.pdf, from Intel.

#If this information has been reported already, please disregard this.

Youichi Aso.

--------------030001020606090502070404
Content-Type: text/plain;
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

*** speedstep-centrino.c	2003-10-27 10:57:21.000000000 +0900
--- speedstep-centrino.c.new	2003-10-27 10:57:21.000000000 +0900
***************
*** 73,78 ****
--- 73,88 ----
  	{ .frequency = CPUFREQ_TABLE_END }
  };
  
+ /* Ultra Low Voltage Intel Pentium M processor 1000MHz */
+ static struct cpufreq_frequency_table op_1000[] =
+   {
+     OP(600,  844),
+     OP(800,  972),
+     OP(900, 988),
+     OP(1000, 1004),
+     { .frequency = CPUFREQ_TABLE_END }
+   };
+ 
  /* Low Voltage Intel Pentium M processor 1.10GHz */
  static struct cpufreq_frequency_table op_1100[] =
  {
***************
*** 165,170 ****
--- 175,181 ----
  static const struct cpu_model models[] = 
  {
         _CPU( 900, " 900"),
+        CPU(1000),
  	CPU(1100),
  	CPU(1200),
  	CPU(1300),

--------------030001020606090502070404
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------030001020606090502070404--


