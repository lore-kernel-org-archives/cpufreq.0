From: Dave Jones <davej@redhat.com>
Subject: Re: powernow-k8: support acpi
Date: Fri, 2 Apr 2004 10:02:20 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040402090220.GF24789@redhat.com>
References: <99F2150714F93F448942F9A9F112634C1163C8D7@txexmtae.amd.com>
	<20040321185417.GA7969@dominikbrodowski.de>
	<20040326122931.GA321@elf.ucw.cz>
	<20040401235635.GA25744@redhat.com>
	<20040402083038.GA307@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040402083038.GA307@elf.ucw.cz>
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

On Fri, Apr 02, 2004 at 10:30:38AM +0200, Pavel Machek wrote:

 > > First off, apologies for sitting on this for so long.
 > > I just made a first-pass attempt at merging this. Most of
 > > (maybe all?) the simpler bits are in (whitespace changes, typos etc).
 > > I'll push that out to bkbits soon, so the powernow-k8 diff in the
 > > next -mm that Andrew builds should be slightly smaller at least.
 > 
 > Adding of data->, too? Could you mail me your latest powernow-k8.[ch]?

I'll look at that today. (Honest, as soon as I'm done with mail 8-)

 > >  > +#endif /* CONFIG_X86_POWERNOW_K8_ACPI */
 > > 
 > > This bit just looks *wrong* to me.  This looks like something
 > > that really should be sorted out in Kconfig.
 > 
 > No problem... Or perhaps just CONFIG_X86_POWERNOW_K8_ACPI should be
 > replaced with CONFIG_ACPI in the driver?

Hmm, possibly. Lets see Bruno's response first.

		Dave
