From: AthlonRob <AthlonRob@axpr.net>
Subject: Re: 2.4.21 Isn't working for me....
Date: 26 Aug 2003 12:41:50 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1061926909.14523.5.camel@localhost>
References: <1061872616.27076.47.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <1061872616.27076.47.camel@localhost>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

On Mon, 2003-08-25 at 21:36, AthlonRob wrote:
 
> I'm trying to get some cpu frequency control over my laptop's CPU with
> the 2.4.21 kernel.  I'd just jump to 2.6.0-test4, but have a few pieces
> of hardware that don't have drivers available for the test kernel yet.

I just found http://www.codemonkey.org.uk/projects/cpufreq/ in the
archives and gave the two patches listed there a shot.

-1 and -2.

Here are the results I got from that on my make bzImage....

gcc -D__KERNEL__ -I/home/rob/kernel/linux-2.4.21/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686  
-nostdinc -iwithprefix include -DKBUILD_BASENAME=cpufreq 
-DEXPORT_SYMTAB -c cpufreq.c
In file included from
/home/rob/kernel/linux-2.4.21/include/linux/irq.h:69,
                 from
/home/rob/kernel/linux-2.4.21/include/asm/hardirq.h:6,
                 from
/home/rob/kernel/linux-2.4.21/include/linux/interrupt.h:46,
                 from cpufreq.c:21:
/home/rob/kernel/linux-2.4.21/include/asm/hw_irq.h: In function
`x86_do_profile':
/home/rob/kernel/linux-2.4.21/include/asm/hw_irq.h:201: `current'
undeclared (first use in this function)
/home/rob/kernel/linux-2.4.21/include/asm/hw_irq.h:201: (Each undeclared
identifier is reported only once
/home/rob/kernel/linux-2.4.21/include/asm/hw_irq.h:201: for each
function it appears in.)
make[2]: *** [cpufreq.o] Error 1
make[2]: Leaving directory `/home/rob/kernel/linux-2.4.21/kernel'
make[1]: *** [first_rule] Error 2
make[1]: Leaving directory `/home/rob/kernel/linux-2.4.21/kernel'
make: *** [_dir_kernel] Error 2

I tried fudging around with the files and lines mentioned, but didn't
get anywhere except more broken...  :-)

Is my system borked?  :-)

I understand the -ac sources contain the cpufreq patch already... do
y'all know if I will be able to apply preemptive multitasking, low
latency scheduling, ntfs, and acpi patches I want to add in there?  They
aren't in the test ran above, FWIW.

Rob  :-)
