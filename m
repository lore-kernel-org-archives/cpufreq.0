From: Pavel Machek <pavel@suse.cz>
Subject: Re: [ACPI] [PATCHES] ACPI Processor update [idle, throttling,
	thermal, cpufreq]
Date: Wed, 10 Sep 2003 02:00:41 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030910000041.GC217@elf.ucw.cz>
References: <20030904222434.GC6350@brodo.de>
	<20030908132939.GD3944@openzaurus.ucw.cz>
	<20030909172135.GA4106@brodo.de> <20030909231303.GH211@elf.ucw.cz>
	<20030909232916.GA9561@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030909232916.GA9561@brodo.de>
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
To: linux@brodo.de
Cc: acpi-devel@lists.sourceforge.net, andrew.grover@intel.com, cpufreq@www.linux.org.uk

Hi!

> > > > http://www.brodo.de/cpufreq_tmp/acpi-2.6.0-test4-processor_thermal_throttling
> > > > > 	Move throttling into its own submodule, and register it with the new
> > > > > 	passive cooling module. Also, the now-useless "limit" interface is
> > > > > 	removed.
> > > > > 
> > > > 
> > > > Actually I liked to be able to echo 0:7 > limit and conserve battery/
> > > > make sure machine does not overheat  with it...
> > > 
> > > echo 7 > throttling should do the same thing. 
> > 
> > Will not first change in thermal system unthrottle it for me, behind
> > my back?
> 
> Well yes, it might, if the temperature had been higher than the passive
> cooling trip point. If you want me to, I'll change the behaviour so that the
> /proc/acpi/.../throttling input is consistent (minimum limit) until the user 
> choses a different throttling level.

Yes I guess that would make sense.

								Pavel
-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
