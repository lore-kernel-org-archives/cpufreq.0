From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c, 1.5,
Date: Mon, 30 Aug 2004 15:29:54 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040830152954.A22480@flint.arm.linux.org.uk>
References: <20040829124936.GA16770@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040829124936.GA16770@dominikbrodowski.de>;
	from linux@dominikbrodowski.de on Sun, Aug 29, 2004 at 02:49:36PM
	+0200
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
To: cpufreq@www.linux.org.uk

On Sun, Aug 29, 2004 at 02:49:36PM +0200, Dominik Brodowski wrote:
> With regard to PANIC_RESUME_OUTOFSYNC:
> 
> > It's up to the kernel to reset the clock rate itself.  This is nothing
> > new - cpufreq has always done this, so why are we adding this new
> > restriction?
> 
> cpufreq still does this. However not during sysdev-resume state [because
> notifiers can sleep], but later. This means the problematic discrepancy (see
> above) is there, just for a short period of time. If you think it isn't an
> issue, Bruno's patch to remove both flags is perfectly valid, otherwise
> these flags do make some sense.

Typically, the boot loader will have a fixed clock speed and RAM timing
setting.  This means that whenever we resume, we will resume not at the
speed the kernel last set, but what we normally boot at.  If we normally
boot at 206.4MHz, we will resume at 206.4MHz no matter what.

So, with PANIC_RESUME_OUTOFSYNC that seems to mean that we will _always_
panic on resume if cpufreq has been used.  Which kind'a makes cpufreq
completely useless on these platforms.

Obviously given this information, this flag needs to be removed from ARM.
If ARM is the only user, then the flag and associated code needs to be
completely removed.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
