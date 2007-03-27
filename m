From: "nate" <cpufreq@linuxpowered.net>
Subject: RE: CPU throttling & power conservation expectations
Date: Tue, 27 Mar 2007 14:54:50 -0700 (PDT)
Message-ID: <23961.72.165.61.226.1175032490.squirrel@webmail.linuxpowered.net>
References: <4956.72.165.61.226.1175030840.squirrel@webmail.linuxpowered.net>
	<653FFBB4508B9042B5D43DC9E18836F52A9AAB@scsmsx415.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <653FFBB4508B9042B5D43DC9E18836F52A9AAB@scsmsx415.amr.corp.intel.com>
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
To: cpufreq@lists.linux.org.uk

Pallipadi, Venkatesh said:

> Does your processors support Enhanced Speedstep feature (does
> /proc/cpuinfo flags contain 'est')?

Looks like my DL320s do (Pentium D), but I don't see the flag
on the DL360G4ps (Xeon ~3Ghz). And upon checking I was able to
load the acpi-cpufreq module on the DL320 without any errors.


> If yes, also check whether your BIOS is enabling Enhanced speedstep
> correctly and whether there are any options in BIOS to enable.

The HP bios isn't big on options, I'll take a look but I don't
recall anything talking about speedstep in the bios, though they
may have their own terminology for it.

HP does have a 'dynamic power saving' option on the DL320 BIOS
(I think it is related to the voltage regulator):

http://h18013.www1.hp.com/products/servers/management/ilo/power-regulator.html

"HP Dynamic Power Savings Mode: Automatically varies processor
speed and power usage based on processor utilization. Allows
reducing overall power consumption with little or no impact
to performance. Does not require OS support."

Which I tried to enable, but the BIOS spit out an error upon
reboot saying that option wasn't supported in my specific
processor configuration despite their online docs seemingly saying
it is supported(running latest bios rev from 11/2006).

I'll run another test on the DL320 test systems with the acpi
module loaded and see if it shows a noticable power use reduction.

thanks a bunch!

nate
