From: Mattia Dongili <dongili@supereva.it>
Subject: Re: Problem with ondemand on Athlon
Date: Wed, 5 Nov 2003 19:21:10 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031105182110.GA922@inferi.kami.home>
References: <200310310434.01311.thierry.lathuille2@libertysurf.fr>
	<20031104181227.GA4326@brodo.de>
Reply-To: dongili@supereva.it
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031104181227.GA4326@brodo.de>
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
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

On Tue, Nov 04, 2003 at 07:12:27PM +0100, Dominik Brodowski wrote:
> Unfortunately, I can't reproduce the problem locally on my p4.
> Can both of you try out the following, please:
> 
> pass "clock=pit" as a command line argument

this semms not to be a valid argument here
Linux inferi-2 2.6.0-test9-1 #3 Thu Oct 30 19:40:17 CET 2003 i686 GNU/Linux


> 
> The p4-clockmod driver [currently] needs to be built as a module then, 
> and you need to pass stock_freq as an argument then. AFAIK, no such
> requirement exists for powernow-k7.

having a P4 1.8GHz do I need stock_freq=1800000 ? (tried, it works)

let' start:

# modprobe p4_clockmod stock_freq=1800000

# echo *ondemand* > /sys/.../scaling_governor 
--> never returns

some infos from an ssh login:

Module                  Size  Used by
p4_clockmod             4488  3 
...

cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
ONDEMAND START: cpu 0, max 1800000, min 225000, cur 1800000
ONDEMAND LIMIT: cpu 0, max 1800000, min 225000, cur 1800000

# cat /proc/cpuinfo 
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Intel(R) Pentium(R) 4 CPU 1.80GHz
stepping        : 4
cpu MHz         : 1800.146
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm
bogomips        : 3547.13


after that echoing something else (tried with powersave) never
returns too...

what other info can I supply?

I tried playing with cpu-usage (compiling kernel) but
/sys/devices/system/cpu/cpu0/cpufreq/ondemand/current_freq always shows
1800000

bye
-- 
mattia
:wq!
