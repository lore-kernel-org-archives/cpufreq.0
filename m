From: Ben Kevan <ben.kevan@gmail.com>
Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't enable	Enchanced
	SpeedStep
Date: Tue, 20 Jun 2006 13:32:01 -0700
Message-ID: <200606201332.01928.ben.kevan@gmail.com>
References: <200606191610.40597.ben.kevan@gmail.com>
	<20060620094357.GB3700@poupinou.org> <4498394B.3080909@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <4498394B.3080909@goop.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>, linux@brodo.de

On Tuesday 20 June 2006 11:07, Jeremy Fitzhardinge wrote:
> Bruno Ducrot wrote:
> > That's strange.  Even if there is no processor object declared onto ACPI
> > tables it should work with CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE set since
> > it's a bania.
>
> This message specifically means that the CPU isn't allowing EST to be
> enabled, even though the CPU has the capability.  I think the BIOS can
> lock this down, like VT on later processors.  Though I can't imagine
> why, unless the machine is being sold as a cheaper/slower system than
> the CPU they put in it...
>
> What does the SMM patch do?
>
>     J

I patched my kernel with Bruno's suggestion but that did not change anything. 
I guess from looking at it, I should get a Kernel Error Message 
with "notifying SMM bios failed" message. I will check the logs (It is on a 
seperate HDD for this same machine (need to keep my production machine up and 
clean). 

I have installed 2.6.17 and compiled with the cpufreq debug, and here is the 
portion of dmesg I am sure you are intrested in:

Netfilter messages via NETLINK v0.30.
ip_conntrack version 2.4 (8190 buckets, 65520 max) - 224 bytes per conntrack
ACPI: AC Adapter [ADP1] (on-line)
ACPI: Battery Slot [BAT1] (battery present)
ACPI: Battery Slot [BAT2] (battery absent)
ACPI: Power Button (FF) [PWRF]
ACPI: Power Button (CM) [PWRB]
ACPI: Lid Switch [LID]
toshiba_acpi: Toshiba Laptop ACPI Extras version 0.18
toshiba_acpi:     HCI method: \_SB_.VALD.GHCI
BIOS EDD facility v0.16 2004-Jun-25, 1 devices found
audit(1150830156.185:2): audit_backlog_limit=256 old=64 by auid=4294967295
audit(1150830156.769:3): audit_pid=2432 old=0 by auid=4294967295
IA-32 Microcode Update Driver: v1.14 <tigran@veritas.com>
cpufreq-core: trying to register driver centrino
cpufreq-core: adding CPU 0
speedstep-centrino: P1 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P2 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P3 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P4 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P5 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P6 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P7 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P8 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P9 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P10 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P11 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P12 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P13 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P14 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: P15 has larger frequency (65535) than P0 (600), skipping
speedstep-centrino: adding state 0 with frequency 600000 and control value 
0610
speedstep-centrino: adding state 1 with frequency 0 and control value ffff
speedstep-centrino: adding state 2 with frequency 0 and control value ffff
speedstep-centrino: adding state 3 with frequency 0 and control value ffff
speedstep-centrino: adding state 4 with frequency 0 and control value ffff
speedstep-centrino: adding state 5 with frequency 0 and control value ffff
speedstep-centrino: adding state 6 with frequency 0 and control value ffff
speedstep-centrino: adding state 7 with frequency 0 and control value ffff
speedstep-centrino: adding state 8 with frequency 0 and control value ffff
speedstep-centrino: adding state 9 with frequency 0 and control value ffff
speedstep-centrino: adding state 10 with frequency 0 and control value ffff
speedstep-centrino: adding state 11 with frequency 0 and control value ffff
speedstep-centrino: adding state 12 with frequency 0 and control value ffff
speedstep-centrino: adding state 13 with frequency 0 and control value ffff
speedstep-centrino: adding state 14 with frequency 0 and control value ffff
speedstep-centrino: adding state 15 with frequency 0 and control value ffff
speedstep-centrino: skipping state 1
speedstep-centrino: skipping state 2
speedstep-centrino: skipping state 3
speedstep-centrino: skipping state 4
speedstep-centrino: skipping state 5
speedstep-centrino: skipping state 6
speedstep-centrino: skipping state 7
speedstep-centrino: skipping state 8
speedstep-centrino: skipping state 9
speedstep-centrino: skipping state 10
speedstep-centrino: skipping state 11
speedstep-centrino: skipping state 12
speedstep-centrino: skipping state 13
speedstep-centrino: skipping state 14
speedstep-centrino: skipping state 15
speedstep-centrino: trying to enable Enhanced SpeedStep (111088)
speedstep-centrino: couldn't enable Enhanced SpeedStep
cpufreq-core: initialization failed
cpufreq-core: no CPU initialized for driver centrino
cpufreq-core: unregistering CPU 0
acpi-cpufreq: acpi_cpufreq_init
cpufreq-core: trying to register driver acpi-cpufreq
cpufreq-core: adding CPU 0
acpi-cpufreq: acpi_cpufreq_cpu_init
cpufreq-core: initialization failed
cpufreq-core: no CPU initialized for driver acpi-cpufreq
cpufreq-core: unregistering CPU 0
speedstep-lib: x86: 6, model: 9
speedstep-ich: Intel(R) SpeedStep(TM) capable processor not found
e1000: eth0: e1000_watchdog_task: NIC Link is Up 100 Mbps Full Duplex
NET: Registered protocol family 17

Bruno / J, 

What should I be looking for with the patched speedstep-centrino.c? Where 
would this message be? In my /var/log/messages or under another log file? 

Thanks for all your help?

Ben
