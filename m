From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq for older Toshibas with P3-M and ALi chipset?
Date: Sun, 2 Jan 2005 18:42:42 +0100
Message-ID: <20050102174242.GB15802@dominikbrodowski.de>
References: <41D8204F.3090108@bakke.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <41D8204F.3090108@bakke.com>
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
To: Dag Bakke <dag@bakke.com>
Cc: ptb@it.uc3m.es, cpufreq@www.linux.org.uk

Hi,

On Sun, Jan 02, 2005 at 05:24:47PM +0100, Dag Bakke wrote:
> I have for quite some time used Peter T Breuer's 'cpuswitch' [1] utility
> to change the processor frequency on my Toshiba Satellite Pro 6000 [3]. 
> This utility makes use of HCI/SCI to do its work, and must(?) be built 
> together with Jonathan Buzzard's toshiba-utils. [2]
> It gives me 8 different CPU frequencies to choose from. (Though the 
> frequency in /proc/cpuinfo is never updated.)
> 
> I'd like to make use of cpufreq with the 'ondemand' governor instead. 
> The laptop appears to work with the 'ACPI Processor P-States driver', 
> but this only gives me two frequencies to choose between. Is this to be 
> expected?

Yes, it is. Mobile Pentium 3 CPU only support two frequency scaling states.
The 8 states you're seeing using cpuswitch are throttling states -- i.e. the
CPU is stopped for short periods of time. However, during these periods the
voltag isn't scaled, so it only leads to a linear reduction of power
compared to a ~ ^3 reduction if voltage is reduced as well. Furthermore, the
state the CPU is in when stopped equals the state the CPU is put into when
there is no work to do -- all this leads to the fact that throttling is
useless in most cases.

> None of the cpufreq processor drivers appears to fit the bill for a 
> PIII-M on an ALi chipset, so I wonder if I am stuck with the cpuswitch 
> utility if I want the better granularity it offers over the ACPI driver?
> Is it at all possible to fit the functions 'cpuswitch' makes use of into 
> a cpufreq driver?

Except the acpi-cpufreq driver, there is none you can use with this system.

> BTW:
> I do notice that if I fiddle with the BIOS settings, I can make the 
> laptop boot at "half speed", coming up at 500 MHz instead of 1000. (As 
> displayed in /proc/cpuinfo.) And the P-states driver still works, so 
> presumably it is possible to combine 'native support' and P-states to 
> obtain 16 steps? :-)

No :-) Probably this "half speed" mode means the front side bus speed (which
is multiplied inside the CPU) is put to 50%. And unless you find out how
this is accessible during a runtime system, there's no chance to combine
these two.

> Thank you to Jonathan, Peter, Dominik, Len and all the others who 
> contribute to making laptops useable under Linux.
You're welcome.

	Dominik
