From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: celeron *clutches at straws*
Date: Thu, 6 Jan 2005 17:13:12 +0100
Message-ID: <20050106161312.GC10011@dominikbrodowski.de>
References: <3bd91160501051619632315d0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3bd91160501051619632315d0@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew East <matthew.east@gmail.com>
Cc: cpufreq@www.linux.org.uk

On Thu, Jan 06, 2005 at 12:19:21AM +0000, Matthew East wrote:
> Hello all,
> 
> I am aware from searching google that cpufreq does not work on
> celerons. However at the same time I am just looking for clarification
> on something. here is my cpuinfo:
> 
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 15
> model           : 2
> model name      : Mobile Intel(R) Celeron(R) CPU 2.00GHz
> stepping        : 7
> cpu MHz         : 1993.155
> cache size      : 256 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 2
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca
> cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid
> bogomips        : 3932.16
> 
> Whereever I look on the internet a Family 15 Model 2 is reported as a
> Pentium 4!! I know that the chips are similar. So what is the truth?
> Is my chip cpufreq capable or not?

AFAIK no. Even though many parts of the CPU are similar so that they can be
represented with the same CPUID, Celerons only do have one multiplier so
SpeedStep is not supported on them.

> If not, is there anything else I can do to save battery power?

You can use throttling (/proc/acpi/processor/./throttling or the cpufreq -
p4-clockmod driver) to avoid the CPU heating so much the fan has to be
enabled / has to turn at a higher speed which causes an increase in energy
consumption. It doesn't save any real CPU power, though, as the CPU most
likely is put into a good idle power state already (check for C2 or higher
in /proc/acpo/processor/./power )

	Dominik
