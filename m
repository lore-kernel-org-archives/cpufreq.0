From: Michael Reinelt <michael@reinelt.co.at>
Subject: Re: Core2Duo locked at 800MHz
Date: Tue, 27 Nov 2007 14:36:16 +0000
Message-ID: <474C2B60.5000501@reinelt.co.at>
References: <474A6C62.3070103@reinelt.co.at>	
	<20071126190929.GE15764@redhat.com>
	<474BB4F2.9040604@reinelt.co.at>
	<1196160448.23251.21.camel@queen.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1196160448.23251.21.camel@queen.suse.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: trenn@suse.de
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

Hi THomas,

> It is probably limited through _PPC again.
> Dave, Len: Can you please add the patch that _PPC changes are printed
> with cpufreq.debug, pls.
> I posted this a while ago on the cpufreq list:
> Subject: [PATCH] Print _PPC changes via cpufreq debug layer
> http://article.gmane.org/gmane.linux.kernel.cpufreq/5642

Looks like it is :-(

I applied your patch and did the debugging again, and found the following:

merlin.merlin.local:/home/michi # grep PPC Lifebook.syslog*
cpufreq-core: CPU 0: _PPC is 0 - frequency not limited
cpufreq-core: CPU 1: _PPC is 0 - frequency not limited
cpufreq-core: CPU 0: _PPC is 1 - frequency  limited
cpufreq-core: CPU 1: _PPC is 1 - frequency  limited
cpufreq-core: CPU 0: _PPC is 2 - frequency  limited
cpufreq-core: CPU 1: _PPC is 2 - frequency  limited
cpufreq-core: CPU 0: _PPC is 3 - frequency  limited
cpufreq-core: CPU 1: _PPC is 3 - frequency  limited
cpufreq-core: CPU 0: _PPC is 4 - frequency  limited
cpufreq-core: CPU 1: _PPC is 4 - frequency  limited
cpufreq-core: CPU 0: _PPC is 5 - frequency  limited

the first PPC message appears where acpi_cpufreq isn't even loaded. As I 
found these tables in the debug output:

freq-table: table entry 0: 2401000 kHz, 0 index
freq-table: table entry 1: 2400000 kHz, 1 index
freq-table: table entry 2: 2000000 kHz, 2 index
freq-table: table entry 3: 1600000 kHz, 3 index
freq-table: table entry 4: 1200000 kHz, 4 index
freq-table: table entry 5: 800000 kHz, 5 index

acpi-cpufreq:      *P0: 2401 MHz, 35000 mW, 10 uS
acpi-cpufreq:       P1: 2400 MHz, 35000 mW, 10 uS
acpi-cpufreq:       P2: 2000 MHz, 28000 mW, 10 uS
acpi-cpufreq:       P3: 1600 MHz, 22000 mW, 10 uS
acpi-cpufreq:       P4: 1200 MHz, 16000 mW, 10 uS
acpi-cpufreq:       P5: 800 MHz, 14000 mW, 10 uS

as the reported _PPC value shows up after the corresponding P state has 
been entered, I guess thats the reason for my problem: Looks like my 
notebook can enter a certain P-state, but can never leave it towards a 
higher frequency.

so...

- wtf is _PPC?

- does this look like a BIOS bug?

- i remember seeing some sort of "disable _PPC by a specific module 
parameter" patch somewhere... "ignore_ppc" or something... is this an 
"official" patch which is worth to give it a try? Somebody knows an 
official location for this patch?


I'm happily looking forward to get this issue solved!


thanks, Michael

-- 
Michael Reinelt <michael@reinelt.co.at>
http://home.pages.at/reinelt
GPG-Key 0xDF13BA50
ICQ #288386781
