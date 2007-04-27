From: olof@lixom.net (Olof Johansson)
Subject: Re: [PATCH v2] [2.6.22] pasemi: cpufreq driver
Date: Fri, 27 Apr 2007 13:09:33 -0500
Message-ID: <20070427180933.GB15582@lixom.net>
References: <20070425204633.GC19781@lixom.net>
	<20070426053700.GA23922@lixom.net>
	<1177583160.6814.37.camel@johannes.berg>
	<20070426203710.GB17302@lixom.net>
	<1177666803.7828.30.camel@johannes.berg>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
Content-Disposition: inline
In-Reply-To: <1177666803.7828.30.camel@johannes.berg>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linuxppc-dev@ozlabs.org, egor@pasemi.com, paulus@samba.org, arnd@arndb.de, cpufreq@lists.linux.org.uk

On Fri, Apr 27, 2007 at 11:40:03AM +0200, Johannes Berg wrote:

> > Hmm, I just tried adding debugging to the cpu_init code, and I'm not
> > seeing it called more than once (i.e. only for cpu 0). Mind you, I don't
> > have cpu hotplug support at this time.
> 
> Oh right, you need cpu hotplug support for the bug to show up. What
> happens then is you unplug and replug a CPU and the sysfs cpufreq stuff
> for the CPU you just replugged is gone.

Ok. Nothing for me to worry about right now then, but it's good to keep
in mind for when the time comes.


Thanks,

-Olof
