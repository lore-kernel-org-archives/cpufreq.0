From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: [BUG] 2.6.0: ARM won't build without
	CONFIG_CPU_FREQ_GOV_USERSPACE=y
Date: Fri, 26 Dec 2003 10:25:17 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031226102517.B8980@flint.arm.linux.org.uk>
References: <E1AZojC-00049i-00@mrelay00.kundenservices.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <E1AZojC-00049i-00@mrelay00.kundenservices.net>;
	from linux@brodo.de on Fri, Dec 26, 2003 at 10:57:54AM +0100
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
Cc: cpufreq@www.linux.org.uk

On Fri, Dec 26, 2003 at 10:57:54AM +0100, linux@brodo.de wrote:
> IMO this should cause the default governor to be forced to "userspace",
> and the deprecated 2.4. API [including cpufreq_get()] to be activated as
> well.

Well, we can't deprecate "cpufreq_get()" because it is one of the
fundamental reasons for the CPUFREQ infrastructure was created.  It
should be moved out of this file to somewhere it can live permanently
rather in a file marked as "deprecated".

> However, Kconfig thinks different: the default setting for
> CPU_FREQ_DEFAULT_GOV (see drivers/cpufreq/Kconfig) is PERFORMANCE, and
> this seems to take precedence over the "select". IMHO this is a Kconfig
> bug -- can you notify the maintainer of this issue, please?

Will do.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
