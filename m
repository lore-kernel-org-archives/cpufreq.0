From: =?ISO-8859-2?B?VvZsZ3lpIFpvbHThbg==?= <simplex@freemail.hu>
Subject: Re: Cpufreq and AMD mobile Athlon 4
Date: Tue, 2 Sep 2003 22:03:56 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902220356.329829c1.simplex@freemail.hu>
References: <1062500550.5141.3.camel@riogrande>
	<20030902125908.GB1225@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20030902125908.GB1225@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

Hi,

> On Tue, Sep 02, 2003 at 12:02:30PM +0100, Matt Wright wrote:
>  > powernow: Has 14 PST tables. (Only dumping ones relevant to this CPU).
>  > 
>  > Nothing else, it doesn't seem to dump and PST tables (as other examples
>  > I've seen show the driver reporting extra info about the CPU).

I've got the same problem with my notebook. This is a 

Fujitsu-Siemens Amilo A7600.

# cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 8
model name      : mobile AMD Athlon (tm) 2000+    
stepping        : 1
cpu MHz         : 1656.764
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 mmx fxsr sse syscall mmxext 3dnowext 3dnow
bogomips        : 3296.46

# uname -r
2.4.21
# modprobe powernow-k7
powernow: AMD K7 CPU detected.
powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: Found PSB header at c00f0640
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 14 PST tables. (Only dumping ones relevant to this CPU).
Nothing else.
But what to do?

Zoltan
