From: bugme-daemon@osdl.org
Subject: [Bug 3952] New: powernow-k7 driver will NOT compile in kernel or as
	module
Date: Sun, 26 Dec 2004 19:30:08 -0800
Message-ID: <200412270330.iBR3U8Nr020820@fire-1.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugme.osdl.org/show_bug.cgi?id=3952

           Summary: powernow-k7 driver will NOT compile in kernel or as
                    module
    Kernel Version: 2.6.10
            Status: NEW
          Severity: blocking
             Owner: cpufreq@www.linux.org.uk
         Submitter: akshunj@myrealbox.com


Distribution: Slackware 10
Hardware Environment: Averatec 3225HS laptop with AMD XP-Mobile 2000+ precessor
and VIA chipset
Software Environment: GCC 3.3
Problem Description: (error during "make bzImage" with driver in kernel OR
during "make modules" with driver as module)

CC      arch/i386/kernel/cpu/cpufreq/powernow-k7.o
arch/i386/kernel/cpu/cpufreq/powernow-k7.c: In function `powernow_manual_settings':
arch/i386/kernel/cpu/cpufreq/powernow-k7.c:467: error: `mobile_vid_table'
undeclared (first use in this function)
arch/i386/kernel/cpu/cpufreq/powernow-k7.c:467: error: (Each undeclared
identifier is reported only once
arch/i386/kernel/cpu/cpufreq/powernow-k7.c:467: error: for each function it
appears in.)
arch/i386/kernel/cpu/cpufreq/powernow-k7.c: At top level:
arch/i386/kernel/cpu/cpufreq/powernow-k7.c:831: error: initializer element is
not constant
arch/i386/kernel/cpu/cpufreq/powernow-k7.c:831: error: (near initialization for
`__param_arr_multiplier.num')
arch/i386/kernel/cpu/cpufreq/powernow-k7.c:833: error: initializer element is
not constant
arch/i386/kernel/cpu/cpufreq/powernow-k7.c:833: error: (near initialization for
`__param_arr_voltage.num')
make[3]: *** [arch/i386/kernel/cpu/cpufreq/powernow-k7.o] Error 1
make[2]: *** [arch/i386/kernel/cpu/cpufreq] Error 2
make[1]: *** [arch/i386/kernel/cpu] Error 2
make: *** [arch/i386/kernel] Error 2

Steps to reproduce: Compile 2.6.10 kernel with cpufreq driver powernow-k7 in
kernel or as module.

This driver is critical to MANY of the budget laptops running the AMD XP-Mobile.
 This driver works fine in the 2.6.10-rc3 kernel.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
