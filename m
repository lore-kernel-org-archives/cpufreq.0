From: Thomas Renninger <trenn@suse.de>
Subject: Re: Pentium D 915 support
Date: Thu, 03 Aug 2006 13:44:53 +0200
Message-ID: <1154605493.4302.494.camel@queen.suse.de>
References: <1154265136.21063.10.camel@skylla.slagter.name>
	<44CCD154.3080606@linux.intel.com>
	<1154275129.21063.31.camel@skylla.slagter.name>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1154275129.21063.31.camel@skylla.slagter.name>
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
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq@lists.linux.org.uk

On Sun, 2006-07-30 at 17:58 +0200, Erik Slagter wrote:
> On zo, 2006-07-30 at 19:33 +0400, Alexey Starikovskiy wrote:
> modprobe acpi-cpufreq does work but output of cpufreq-info shows:
> 
> > cpufrequtils 0.4: cpufreq-info (C) Dominik Brodowski 2004
> > Report errors and bugs to linux@brodo.de, please.
> > analyzing CPU 0:
> >   driver: acpi-cpufreq
> >   CPUs which need to switch frequency at the same time: 0
> >   hardware limits: 2.40 GHz - 2.80 GHz
> >   available frequency steps: 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.40 GHz  available cpufreq governors: conservative, ondemand, powersave, userspace, performance
> >   current policy: frequency should be within 2.40 GHz and 2.80 GHz.
> >                   The governor "performance" may decide which speed to use
> >                   within this range.
> >   current CPU frequency is 2.80 GHz.
> > analyzing CPU 1:
> >   driver: acpi-cpufreq
> >   CPUs which need to switch frequency at the same time: 1
> >   hardware limits: 2.40 GHz - 2.80 GHz
> >   available frequency steps: 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.40 GHz  available cpufreq governors: conservative, ondemand, powersave, userspace, performance
> >   current policy: frequency should be within 2.40 GHz and 2.80 GHz.
> >                   The governor "performance" may decide which speed to use
> >                   within this range.
> >   current CPU frequency is 2.80 GHz.
> 
> Please note the amount of repeated same frequency.
> 
I already saw something similar.
This is BIOS information, they probably want to take care that no
performance is lost and define 9 high and one low step.

> Also, it strikes me that /proc/acpi/../power only shows C1, is this normal?
> 
On a Pentium D, I'd say yes.

> Last but not least: the loading or unloading of the module doesn't have
> any effect on the actual power consumption, even with powersave governor
> and both cores at 2.4 Ghz (both at 140 W).
Strange. 2.4 GHz is still a lot?

Have you already searched for a new BIOS, if not better do that first.

     Thomas
