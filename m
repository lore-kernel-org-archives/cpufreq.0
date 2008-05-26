From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] Remove p4_clockmode driver
Date: Mon, 26 May 2008 13:05:07 +0100
Message-ID: <20080526120507.GA23310@srcf.ucam.org>
References: <20080511161934.GI15445@codemonkey.org.uk>
	<20080522040118.GA28737@anvil.corenet.prv>
	<1211541678.29901.78.camel@queen.suse.de>
	<20080523084737.ZZRA012@mailhub.coreip.homeip.net>
	<1211555977.29901.110.camel@queen.suse.de>
	<20080523113206.ZZRA012@mailhub.coreip.homeip.net>
	<1211559367.29901.140.camel@queen.suse.de>
	<20080523133809.ZZRA012@mailhub.coreip.homeip.net>
	<20080524110309.GB13173@isilmar.linta.de>
	<1211729971.3422.52.camel@linux-2bdv.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1211729971.3422.52.camel@linux-2bdv.site>
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
To: Thomas Renninger <trenn@suse.de>
Cc: Dave Jones <davej@codemonkey.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, mzahor@dtech.sk, Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq <cpufreq@lists.linux.org.uk>

On Sun, May 25, 2008 at 05:39:31PM +0200, Thomas Renninger wrote:

> Could you explain this in two easy sentences again, why this should not
> use the throttling interface?

Because it involves rewriting code for purely aesthetic benefit. I agree 
that, in an ideal world, p4-clockmod would integrate into the throttling 
system. But unless someone wants to rewrite it, that doesn't look 
likely...

> (former /proc/acpi/processor/*/throttling, now somewhere located in
> sysfs. Also used for passive cooling if no cpufreq is available).
> Throttling is what this driver is doing and with which it will interfere
> and slow down the machine to be closed to unresponsive if both
> (throttling and cpufreq interface) are using it?

The ACPI throttling interface will only be used if the minimum cpufreq 
state has already been reached. Users really shouldn't play with the 
throttling interface themselves, given its lack of useful functionality.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
