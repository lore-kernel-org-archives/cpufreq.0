From: Bryce as root <root@www.linux.org.uk>
Subject: When exactly should I worry?
Date: Fri, 3 Sep 2004 16:00:29 +0100 (BST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C3FYD-0005fc-EX@www.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: cpufreq@www.linux.org.uk
Cc: Russell King <rmk@www.linux.org.uk>



Linux ZenIV.linux.org.uk 2.6.7-1.494.2.2smp #1 SMP Tue Aug 3 09:59:49 EDT 2004 i686 i686 i386 GNU/Linux


My system logs are filled with 
"Losing some ticks... checking if CPU frequency changed."

prior to this (~15 days), there was none of this in the logs

Kernel messages that might be of relevance. (in no real order)
Using tsc for high-res timesource
CPU0: Thermal monitoring enabled
CPU1: Thermal monitoring enabled
ENABLING IO-APIC IRQs
init IO_APIC IRQs
 IO-APIC (apicid-pin) 2-0, 2-16, 2-17, 2-18, 2-19, 2-20, 2-21, 2-22, 2-23 not co
nnected.
..TIMER: vector=0x31 pin1=2 pin2=-1
Using local APIC timer interrupts.
calibrating APIC timer ...
..... CPU clock speed is 3014.0031 MHz.
..... host bus clock speed is 200.0935 MHz.
checking TSC synchronization across 2 CPUs: passed.
Brought up 2 CPUs

There are no kernel messages ahout HPET or PIT.
lmsensors seem to indicate the CPU is stable at 41degC
(IF I can trust lmsensors)

Now then...
how much should /I/ panic or what else should I have included?

Phil
=--=
