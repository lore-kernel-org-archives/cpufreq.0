From: Thomas Renninger <trenn@suse.de>
Subject: Re: 2G P4M won't go above 1.2 - cpuinfo_max_freq too low
Date: Thu, 04 Dec 2003 16:35:07 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3FCF542B.9040703@suse.de>
References: <200311261702.56907.simon@highlyillogical.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060308080609010805070606"
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <200311261702.56907.simon@highlyillogical.org>
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
--------------060308080609010805070606
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Simon wrote:

>Enabling the old interface in the kernel and doing a `echo -n 
>0%0%100%performance > /proc/cpufreq` doesn't change things either.
>
>Here is my /proc/cpuinfo
>model name      : Mobile Intel(R) Pentium(R) 4 - M CPU 2.00GHz
>cpu MHz         : 1198.976
>
>Any ideas how to get hold of my extra mhz?
>  
>
I have the same problem, cpuinfo shows the wrong value!!!
I get 1200MHz even I set it up to 1800MHz.
(posted prog calculates the right value, (procspeed))

My values:

cat scaling_setspeed
1800000

procspeed
1795.069753 MHz processor.

cat /proc/cpuinfo
cpu MHz : 1196.427

# HERE I SET NEW SPEED!
echo 1200000 >scaling_setspeed

procspeed
1196.468220 MHz processor.

# THIS IS TOTALLY WRONG!
cat /proc/cpuinfo
cpu MHz : 797.618

cat scaling_setspeed
1200000

It seems as if cpuinfo shows the wrong value by the factor 1.5.
(min_freq: 1200, max_freq: 1800)

kernel: 2.6.0test-11-1

I post a small prog you can mesure your real speed.
It's called procspeed(think it was part of Carl Thomson's cpufreqd).

I searched for cpuinfo in the archive, but could not find anything.
I expect that problem related to freq scaling ...

Does anyone know about this?

Maybe this helps, complete cpuinfo:

cat /proc/cpuinfo
processor : 0
vendor_id : GenuineIntel
cpu family : 15
model : 2
model name : Intel(R) Pentium(R) 4 Mobile CPU 1.80GHz
stepping : 4
cpu MHz : 1196.427
cache size : 512 KB
fdiv_bug : no
hlt_bug : no
f00f_bug : no
coma_bug : no
fpu : yes
fpu_exception : yes
cpuid level : 2
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat 
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips : 2334.72


Thanks.

Thomas

--------------060308080609010805070606
Content-Type: text/plain;
 name="procspeed.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="procspeed.c"


#include <stdio.h>
#include <sys/time.h>

__inline__ unsigned long long int rdtsc()
{
	unsigned long long int x;
	__asm__ volatile (".byte 0x0f, 0x31" : "=A" (x));
	return x;
}

main ()
{
	struct timezone tz;
        struct timeval tvstart, tvstop;
        unsigned long long int cycles[2]; /* gotta be 64 bit */
	unsigned int microseconds; /* total time taken */
	
	bzero(&tz, sizeof(tz));

	/* get this function in cached memory */
	gettimeofday(&tvstart, &tz);
	cycles[0] = rdtsc();
	gettimeofday(&tvstart, &tz);

	/* we don't trust that this is any specific length of time */
	sleep(1);
	
	cycles[1] = rdtsc();
	gettimeofday(&tvstop, &tz);
	microseconds = ((tvstop.tv_sec-tvstart.tv_sec)*1000000) +
		(tvstop.tv_usec-tvstart.tv_usec);

	printf("%f MHz processor.\n",
		(float)(cycles[1]-cycles[0])/microseconds);
}


--------------060308080609010805070606
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------060308080609010805070606--


