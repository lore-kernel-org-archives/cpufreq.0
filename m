From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c, 1.5,
Date: Mon, 30 Aug 2004 17:01:07 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040830150107.GA7953@dominikbrodowski.de>
References: <20040829124936.GA16770@dominikbrodowski.de>
	<20040830121923.GR29560@poupinou.org>
	<20040830131725.GA8355@dominikbrodowski.de>
	<20040830144940.GS29560@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040830144940.GS29560@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Mon, Aug 30, 2004 at 04:49:40PM +0200, Bruno Ducrot wrote:
> Hi,
> 
> On Mon, Aug 30, 2004 at 03:17:25PM +0200, Dominik Brodowski wrote:
> > i386 can adapt to "hidden" changes of CPU frequencies quite well now, as the
> > TSC code tries to detect "changes behind its back"... so these flags were
> > not added out of concern for the x86 architecture, but because they seemed
> > necessary for certain systems. Possibly I'm completely wrong, though...
> > 
> 
> Well, for a strange reason, I was thinking all those stuff were made for
> speedstep-ich and the (non)-merged speedstep-piix4, and maybe the
> ownership stuff from ACPI..  I was mistaken I guess.

The detection of changes behind cpufreq's back yes -- but for the
speedstep-ich case, it was supposed to work around critical situations, not
to cause panics... If you see a valid point for the PANIC flag for these
drivers, please explain it to me, though.

Thanks,

	Dominik
