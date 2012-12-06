From: David C Niemi <dniemi@verisign.com>
Subject: Re: [PATCH RFC 0/1] cpufreq/x86: Add P-state driver for sandy bridge.
Date: Thu, 06 Dec 2012 17:23:14 -0500
Message-ID: <50C11AD2.4000802@verisign.com>
References: <1354734091-29870-1-git-send-email-dirk.brandewie@gmail.com> <50BFAE5A.1010809@verisign.com> <50BFB627.5080106@linux.intel.com> <50BFBF34.3090608@verisign.com> <50BFC28C.9060004@linux.intel.com> <50C0B34D.5020406@verisign.com> <50C0C761.8000501@linux.intel.com> <50C0D64E.8050005@verisign.com> <50C0E30B.2040301@gmail.com> <50C0E6C3.4010407@verisign.com> <50C10F93.3060706@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <50C10F93.3060706@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: Arjan van de Ven <arjan@linux.intel.com>, cpufreq@vger.kernel.org, rjw@sisk.pl, deneen.t.dock@intel.com

On 12/06/12 16:35, Dirk Brandewie wrote:
...
> Yep there are a bunch of ways to skin the cat when it comes to trading peak
> performance for saving power.  The driver code is setup allow for having
> multiple sets of tuning parameters that could be selected by the
> user/system admin/integrator.
>
> The current driver is tuned to have the same or better peak performance
> than the ondemand governor while having better power efficiency.
An untuned ondemand governor performs very poorly, as it is constantly trying to switch frequency down when it is busy.  Did you try it witn sampling_down_factor set to, say, 100?  This would tend to make it consume more power but perform substantially better, and would be a more reasonable comparison than with sampling_down_factor set to 1 (default).

> The performance and power efficiency gains depends on the type of workload.
>
> The thorny question in my mind if people agree that having a per architecture p state driver is a valid approach is how should the per architecture drivers
> be integrated into a system that allows distributions to build generic kernels
> with reasonable default behaviour.
There is nothing wrong with having a bunch of different architecture-specific drivers, there is no way around that.  But they need some kind of abstraction layer over the top or distribution creators will bypass it, even if it is clearly superior.  If the existing layers are unusable, then we need a new abstraction layer; the most important feature is that a single configuration file needs to be able to do some basic reasonable settings across a wide variety of hardware types, or at a bare minimum come up in a sensible default mode.  Again, that could be a new config file or an existing one, but some existing ones (e.g. /etc/sysconfig/cpuspeed) are totally focused on the wrong things and I can fully understand wanting to ditch them and do something new.

The cpupower utility from kernel-tools is a much better framework and could probably be extended to control the pstate driver/governor so maybe that is a good way to look; it also tweaks scheduler settings.  It's already used on Fedora 16 and later but not RHEL 6.x.  You might want to talk to whoever is maintaining it.

> Providing an interface to retrieve the current requested (operating)frequency
> is trivial. Giving the user a warm fuzzy that things are changing what this
> type of utility is good for IMHO not an unreasonable desire.
Agreed, but an average frequency over the last second (or 100 msec) is probably more interesting than the requested frequency, if they are both easy to find out.

> The real question is does it need to be reported via the cpufreq subsystem and
> if not where should this driver and others like it report the frequency.
I'm not sure there really is anywhere you CAN report it other than responding to inquiries about it via /sys.

> So if it is not practical to get an average, reporting the frequency stamped on the part
>> is better than nothing.  It is boring, but less boring than reporting "0".
>
> What would you use this number for in userspace?  I guess I might not
> understand exactly what you are asking for here.
>
> --Dirk
Mostly applets that show current CPU speed, possibly other performance monitoring tools like i7z.

DCN
