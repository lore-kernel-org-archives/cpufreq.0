From: olof@lixom.net (Olof Johansson)
Subject: Re: [PATCH v2] [2.6.22] pasemi: cpufreq driver
Date: Thu, 26 Apr 2007 15:37:10 -0500
Message-ID: <20070426203710.GB17302@lixom.net>
References: <20070425204633.GC19781@lixom.net>
	<20070426053700.GA23922@lixom.net>
	<1177583160.6814.37.camel@johannes.berg>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1177583160.6814.37.camel@johannes.berg>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linuxppc-dev@ozlabs.org, egor@pasemi.com, paulus@samba.org, arnd@arndb.de, cpufreq@lists.linux.org.uk

On Thu, Apr 26, 2007 at 12:26:00PM +0200, Johannes Berg wrote:
> On Thu, 2007-04-26 at 00:37 -0500, Olof Johansson wrote:
> > 
> > +       policy->cur = pas_freqs[cur_astate].frequency;
> > +       policy->cpus = cpu_possible_map; 
> 
> That doesn't seem right.
> 
> Either, all your processors scale along each other in which case you
> should use cpu_online_map here, or they scale each on their own in which
> case you just set a single bit here.

You can set the requested speed per-processor, but the actual speed
will be the max of them. Because of this, it's less surprising to set
it on both at the same time since then you'll at least know what you're
running at.

So yes, I'll change it to online_map instead of possible_map.

> The generic code works like this:
> CPU 0 is brought online and cpufreq initialised for it
> CPU 1 is brought online and cpufreq initialised for it. if cpus includes
> more than a single bit, cpufreq is linked to the first other CPU in
> policy->cpus and then cpufreq for CPU1 is deinitialised again.
>
> We have the same bug on powermac but for some reason the patch to fix it
> that I posted a long time ago (look for "powermac: fix G5-cpufreq for
> cpu on/offline") wasn't applied yet. Look at it though, it includes a
> comment on what needs to be done.

Hmm, I just tried adding debugging to the cpu_init code, and I'm not
seeing it called more than once (i.e. only for cpu 0). Mind you, I don't
have cpu hotplug support at this time.






-Olof
