From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: [RFC][PATCH] cpufreq: arm Kconfig fixes
Date: Fri, 3 Sep 2004 21:56:58 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040903215658.F15620@flint.arm.linux.org.uk>
References: <20040903204320.GC19921@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040903204320.GC19921@dominikbrodowski.de>;
	from linux@dominikbrodowski.de on Fri, Sep 03, 2004 at 10:43:20PM
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

On Fri, Sep 03, 2004 at 10:43:20PM +0200, Dominik Brodowski wrote:
> arm cpufreq Kconfig enhancements:
> - don't force the deprecated 24_API on SA11x0 any more, as it will be removed
>   ~2005-01-01 and different interfaces have been available for a long time
> - don't mark CPU_FREQ as being EXPERIMENTAL any longer
> - re-order it in the same way other arches are ordered

Looks fine, please merge, thanks.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
