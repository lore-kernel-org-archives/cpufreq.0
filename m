From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [Bug 8243] Problem with Throttling and CPU power state
Date: Mon, 27 Aug 2007 22:27:11 +0200
Message-ID: <46D3339F.3090203@interia.pl>
References: <20070827194633.5278D108078@picon.linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070827194633.5278D108078@picon.linux-foundation.org>
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
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: akolisek@linuxx.hyperlinx.cz
Cc: cpufreq@www.linux.org.uk

> This bug is present in kernel 2.6.22(.1,2,3,4,5) too :(
I don't get it. Where is the bug?
> Why my CPU is not in C1 state, when works on 100%? And where is C0 state?
C0 means that CPU is working so it isn't listed.
I think that You have misunderstood this file. It isn't printing current=20
CPU state. It is listing all available sleep states in order from=20
low latency and higher power consumption to high latency and lower power=20
consumption. Star means state that will be used when CPU become idle.=20
"Latency" means time needed to enter sleep state and time needed to wakeup =

when something will happen (interrupt or BM DMA for example). So it is=20
perfectly OK to use C4 when there it isn't much to do and C2 when CPU is=20
spending less time sleeping.
Kernel compilation isn't causing 100% CPU usage. Processor is sleeping=20
during I/O wait. Well, unless You are using -j2 or higher.
> state T4 is activated, but only a few seconds and then it goes back to T0=
. Is
> this ok?
Yes. BIOS option "use throttling to rescue CPU when it is overheating"=20
interfering.

Regards
Rafa=B3

----------------------------------------------------------------------
Jak najszybciej dostac sie na wymarzona plaze?
Znajdz trase ekspresowa

>>>http://link.interia.pl/f1b0c
