From: Nirmal Govind <nirmalg@psu.edu>
Subject: Re: sysfs cpufreq missing in 2.6.0
Date: Tue, 23 Dec 2003 13:01:47 -0500
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <3FE8830B.80201@psu.edu>
References: <3FE86F70.8060908@psu.edu>	<20031223164953.GN951@inferi.kami.home>
	<3FE874D5.4020107@psu.edu>
	<1072202064.6531.13.camel@dell.linux.box>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1072202064.6531.13.camel@dell.linux.box>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: AthlonRob <AthlonRob@axpr.net>
Cc: cpufreq@www.linux.org.uk

> cat /proc/cpuinfo ....
> 
> 

Yes, I tried that but that still shows the original frequency. So 
here's what my scaling_setspeed looks like:

root@variance:/# more 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
800000

And here's my /proc/cpuinfo:

root@variance:/usr/src/linux-2.6.0# more /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 9
model name      : Intel(R) Pentium(R) M processor 1400MHz
stepping        : 5
cpu MHz         : 1400.280
cache size      : 1024 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 apic sep mtrr pge 
mca cmov pat
clflush dts acpi mmx fxsr sse sse2 tm pbe tm2 est
bogomips        : 1493.28

I don't see an 800 here.. I'm pretty sure the frequency has been 
scaled down since my fan doesn't come on that often now.. or could 
it be that the machine is fooled into thinking that the freq. is 800 
(and hence the reduced fan activity) but it's still actually at 
1400? That would be scary and might result in failures I guess...

Thanks,
nirmal
