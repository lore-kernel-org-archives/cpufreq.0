From: paul.devriendt@amd.com
Subject: overrides
Date: Wed, 17 Mar 2004 12:01:49 -0600
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C1126A1BF@txexmtae.amd.com>
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
To: ducrot@poupinou.org, pavel@ucw.cz
Cc: linux@dominikbrodowski.de, cpufreq@www.linux.org.uk

> -----Original Message-----
> From: Bruno Ducrot [mailto:ducrot@poupinou.org] 
> Sent: Wednesday, March 17, 2004 10:04 AM
> To: Pavel Machek
> Cc: Dominik Brodowski; Cpufreq mailing list
> Subject: Re: powernow-k8, more updates
> 
> Why not just provide an override from userspace?

The question of overrides is a difficult question. The
theory is that BIOS provides a table of frequencies/
voltages that should be used for this system. This is
because different processors vary on the frequencies
that they support, and different processors have
different voltages for the same frequency. Also, the
platform may have additional restrictions, such as the
need to restrict operation at higher frequencies when
running on battery power.

Those of us receiving emails from customers with crashing
systems are painfully available that not every BIOS is
providing good data, and not every BIOS is even supplying
any data. I suppose no data is better than wrong data,
given that the bad data normally causes a lockup, typically
caused by the driver setting the system to a voltage that
is just too low.

So, there are various modified versions of the driver
floating around that override the BIOS data - either to
supply data where the BIOS does not, or to override the
BIOS data with values that do not crash the system.

The difficulty with all these override mechanisms is that
the correct values for system x may or may not be correct
for system y. And, I do not think anyone is willing (or is
even able) to own a master table to cover all possible
platforms and processors.

So, today, someone who is willing to modify the driver 
code is capable of implementing an override, and the
driver code is actually structured in a way that this is
actually very easy. If you choose to modify the source to 
a driver (at your own risk) to override something, then
great. Moving to a method where it is easier for a
non-programmer to supply override values is a hard problem,
as how do you know what values you might need to override?

Paul.
