From: Colin Marquardt <colin@marquardt-home.de>
Subject: Re: Need output of 'cat /proc/cpuinfo' from everyone
Date: Thu, 01 Apr 2004 00:25:17 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <msgidspam.87n05wk62a.fsf@schnee.marquardt-home.de>
References: <20040331073444.yemrooko0owwc088@carlthompson.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

Carl Thompson <cet@carlthompson.net> writes:

>      I am compiling information on the different models of CPUs, the
> cpufreq drivers they use and their power management support.  Everyone,
> please send me the following information for every machine you can get
> your hands on:
>
> 1. Output of 'cat /proc/cpuinfo'

$ cat /proc/cpuinfo
processor	: 0
vendor_id	: AuthenticAMD
cpu family	: 15
model		: 4
model name	: AMD Athlon(tm) 64 Processor 3200+
stepping	: 8
cpu MHz		: 797.991
cache size	: 1024 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 1
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 syscall mmxext lm 3dnowext 3dnow
bogomips	: 1579.41

> 2. Whether it has a desktop or mobile processor (if you know)

Desktop.

> 3. Full name of processor (if you know, ex: 'AMD Mobile Athlon
> 2200+')

Model name above is correct.

> 4. What cpufreq driver works best with the processor (if you know)

Using powernow-k8 from kernel 2.6.4 at the moment.

Cheers,
  Colin
