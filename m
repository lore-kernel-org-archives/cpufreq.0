From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: SMP CPUfreq support in Linux kernel mainline??
Date: Mon, 31 Jan 2005 21:42:10 +0100
Message-ID: <20050131204210.GA9676@dominikbrodowski.de>
References: <E1CvhY8-0007pa-AJ@parcelfarce.linux.theplanet.co.uk>
	<20050131202725.GM1145@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050131202725.GM1145@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Mon, Jan 31, 2005 at 09:27:25PM +0100, Bruno Ducrot wrote:
> On Mon, Jan 31, 2005 at 11:49:09AM -0800, Erich Boleyn wrote:
> > I am having a problem getting SMP CPUfreq support to function correctly
> > on recent Linux kernels, and wanted to know if what I am seeing is a
> > known bug or infrastructure problem.
It's neither nor, AFAICS.

> > It appears that the cpu TSC (timestamp counter) is getting out of sync
> > between the two processors,

As Bruno has pointed out using his test tool, direct access to TSC will lead
to inconsistent results.

> > yet the Linux kernel isn't trying to correct
> > for this.  (on Opterons, the TSC runs at core frequency)

However, the TSC timing code inside the Linux kernel tries to adapt for it.
Check time_cpufreq_notifier() in arch/x86_64/kernel for details. However,
something seems to fail. And it'd be really great if you could try to debug
(and possibly even fix) it. A few ideas which come to my mind: do you have
CONFIG_PREEMPT enabled? If so, could you try with it disabled, please? do
you have a different timing source available and/or enabled (pmtmr [does it
even exist for x86_64?], hpet)? Does sleep do nasty tricks with MSRs
(unlikely), or does some syscall interface fail?

Thanks for your help,
	Dominik

PS: list e-mail adress corrected to lists.linux.org.uk
