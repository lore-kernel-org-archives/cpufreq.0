From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] If a CPU gets onlined set the governor to the one that
	is run on other CPUs
Date: Mon, 27 Nov 2006 10:47:51 +0100
Message-ID: <1164620871.4656.110.camel@queen.suse.de>
References: <1164296237.3721.395.camel@queen.suse.de>
	<20061126222120.GB26600@redhat.com>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20061126222120.GB26600@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, Stefan Seyfried <seife@suse.de>

On Sun, 2006-11-26 at 17:21 -0500, Dave Jones wrote:
> On Thu, Nov 23, 2006 at 04:37:17PM +0100, Thomas Renninger wrote:
>  > Hi,
>  > 
>  > I wonder whether there is any real use to allow userspace to
>  > run different governors on different CPUs?
>  > This complicates things (in kernel and userspace) and
>  > if not really needed I'd link up all
>  > sys/../cpu*/cpufreq/scaling_governor files?
> 
> I've thought about this a few times, and I agree that it's fairly pointless,
> especially with ht/multicore CPUs.  Given it doesn't really bring anything
> but added complexity for userspace, I'm inclined to agree that this
> is the direction we should take unless someone has a compelling argument?

Rethinking about all this.., including some arguments from Seife.., I am
not that sure whether it was that bad to provide that capability.

Thinking about x86 may get 16/32/64 CPU sockets the next years, it may
be convenient for very specific guys to run some nodes at highest
performance to even avoid some 2% performance regression on database
nodes while others are run with ondemand.

Having some S390 like configuration for future, where you can configure
each CPU/Node as you like, may come out to be useful (Even I don't see
any use of that atm, even not that much in future, it may be at least
relevant for marketing purposes? I am thinking about a complex per CPU
configuration utility...). Independent cpufreq policy will never make
sense on a laptop, but possibly on huge high-end machines?

I just wonder how to ease up things?

On longterm IMO some kind of non-CPU specific cpufreq directory would be
needed if this feature should still be provided:
/sys/devices/cpu/cpufreq
There could be a default-governor file. All newly added CPUs will use
this one.

Switching between battery/AC governor would not need listening on some
"suspend or CPU offline event" then.

Hal already workarounds that atm (at least the suspend case, not sure if
this is already upstream. It does not handle the "someone just offlined
a CPU" case AFAIK, but probably also will soon).
Above would be sufficient to still provide full flexibility
(unfortunately still the whole complexity in kernel) and avoid ugly
workarounds in userspace like: If CPU online event received via udev
(which does not exist yet?), get the current governor that should run
there from Hal cpufreq module and reset it.

On the other hand, if you are really sure this is never ever needed on
any architecture, it's probably better to rip out that feature totally,
I am not that sure any more...

Thanks,

    Thomas
