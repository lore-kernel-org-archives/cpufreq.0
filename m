From: Dave Jones <davej@redhat.com>
Subject: Re: powernow-k8: support acpi
Date: Fri, 2 Apr 2004 00:56:35 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040401235635.GA25744@redhat.com>
References: <99F2150714F93F448942F9A9F112634C1163C8D7@txexmtae.amd.com>
	<20040321185417.GA7969@dominikbrodowski.de>
	<20040326122931.GA321@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040326122931.GA321@elf.ucw.cz>
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
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>
Cc: Andrew Morton <akpm@osdl.org>, Bruno Ducrot <ducrot@poupinou.org>, mark.langsdorf@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>, paul.devriendt@amd.com, Dominik Brodowski <linux@dominikbrodowski.de>

On Fri, Mar 26, 2004 at 01:29:32PM +0100, Pavel Machek wrote:
 > This is new version of powernow-k8 driver. It adds SMP support, and
 > support for getting tables through ACPI. (ACPI support is really
 > important, because many machines have broken "legacy" tables). Please
 > apply,

First off, apologies for sitting on this for so long.
I just made a first-pass attempt at merging this. Most of
(maybe all?) the simpler bits are in (whitespace changes, typos etc).
I'll push that out to bkbits soon, so the powernow-k8 diff in the
next -mm that Andrew builds should be slightly smaller at least.

The ACPI stuff I'm pondering.
Bruno, how does this stuff look to you? Your acpi perflib stuff is
already in the pending pool (see the diff in the current -mm tree at
http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.5-rc3/2.6.5-rc3-mm4/broken-out/bk-cpufreq.patch)
Would this driver be better off using that ?

 > @@ -31,55 +33,47 @@
 >  #include <asm/io.h>
 >  #include <asm/delay.h>
 >  
 > +#ifdef CONFIG_ACPI
 > +#define CONFIG_X86_POWERNOW_K8_ACPI
 > +#endif
 > +#ifdef CONFIG_X86_POWERNOW_K8_ACPI
 > +
 > +#include <linux/acpi.h>
 > +#include <acpi/processor.h>
 > +
 > +#endif /* CONFIG_X86_POWERNOW_K8_ACPI */

This bit just looks *wrong* to me.  This looks like something
that really should be sorted out in Kconfig.

The rest of the ACPI changes, I'd really like to get Bruno Ducrot's opinion
on.

		Dave
