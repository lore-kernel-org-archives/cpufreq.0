From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: Help with Installation
Date: Mon, 5 Apr 2004 22:06:54 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040405220654.D17303@flint.arm.linux.org.uk>
References: <200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<200404031342.34522.ozeki@simnet.is>
	<20040403145045.GV19001@poupinou.org>
	<20040403171633.610cc960.frx@firenze.linux.it>
	<20040403172242.D5553@flint.arm.linux.org.uk>
	<20040404195730.6fac6745.frx@firenze.linux.it>
	<20040404211144.GA9552@dominikbrodowski.de>
	<20040405222015.4a560be1.frx@firenze.linux.it>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040405222015.4a560be1.frx@firenze.linux.it>;
	from frx@firenze.linux.it on Mon, Apr 05, 2004 at 10:20:15PM +0200
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
To: Francesco Poli <frx@firenze.linux.it>
Cc: cpufreq@www.linux.org.uk

On Mon, Apr 05, 2004 at 10:20:15PM +0200, Francesco Poli wrote:
> 1) downloads the latest 2.4.x kernel (maybe via rsync)
> 2) modifies it using latest cpufreq from
>    http://ftp.linux.org.uk/pub/linux/cpufreq/

This would be a manual step.

> Such a script should be run daily (via cron) on ftp.linux.org.uk

You're making the very big assumption that ftp.linux.org.uk _has_
the space to do this.  The fact is that disk space is short, and
the replacement server has been lost by the parcel carrier, and
the state of parcel carriers over here means that it's only
possible to recover a fraction of the value.  Yes, we know in
hind sight that it would've been better to have put it into a car
and driven it to the hosting facility, but hind sight is such a
wonderful thing.

So, _we_ _do_ _not_ _currently_ _have_ _the_ _resources_ _to_ _host_
_such_ _a_ _service_.  As I've said _three_ times in this thread so
far.

The fact is that right now there is only 10MB free for the anonymous
FTP archive.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
