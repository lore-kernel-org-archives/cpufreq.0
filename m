From: Johan Braennlund <johan.brannlund@telia.com>
Subject: Re: dumb question from curious newbee.
Date: Fri, 20 Jun 2003 20:29:47 +0200 (CEST)
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <Pine.LNX.4.53.0306202016090.6046@h192n1fls22o1048.telia.com>
References: <1056093725.15596.2.camel@localhost> <20030620174437.GB1889@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030620174437.GB1889@brodo.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Fri, 20 Jun 2003, Dominik Brodowski wrote:

> No, there's no frequency scaling for AMD Duron. But maybe throttling (power
> consumption is reduced linear to processing power) is available - try out
> ACPI [http://acpi.sf.net for more information]

That's something I've wondered about for a while - precisely what
determines whether throttling is available? Is that another one of these
"should only depend on the processor, unless you have a stupid BIOS"
things? For instance, ACPI tells me that throttling is not available on my
Athlon XP 1800:

$ cat /proc/acpi/processor/CPU0/info
processor id:            0
acpi id:                 1
bus mastering control:   yes
power management:        yes
throttling control:      no
performance management:  no
limit interface:         no


$ cat /proc/cpuinfo
processor       : 0
vendor_id       : AuthenticAMD
cpu family      : 6
model           : 8
model name      : mobile AMD Athlon(tm) XP 1800+
stepping        : 0
cpu MHz         : 1500.590
cache size      : 256 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
cmov pat pse36 mmx fxsr sse syscall mp mmxext 3dnowext 3dnow
bogomips        : 2957.31

- Johan
