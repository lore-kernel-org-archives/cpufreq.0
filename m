From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Cbe-oss-dev] powerpc/cell/cpufreq: add spu aware cpufreq governor
Date: Mon, 7 Jul 2008 23:02:53 +0200
Message-ID: <200807072302.54410.arnd@arndb.de>
References: <200807071702.31240.arnd@arndb.de>
	<20080707171732.GC26603@comsec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080707171732.GC26603@comsec.com>
Content-Disposition: inline
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
To: Eric Blossom <eb@comsec.com>
Cc: Dave Jones <davej@codemonkey.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, cpufreq@lists.linux.org.uk, linuxppc-dev@ozlabs.org, Jeremy Kerr <jk@ozlabs.org>, cbe-oss-dev@ozlabs.org

On Monday 07 July 2008, Eric Blossom wrote:
> I've got a basic question about this idea:
> =

> Does it throttle only idle spus or is there a single control for
> the entire PPE + SPE complex?

There is one setting per socket, i.e. 8 SPUs and 1 PPU. In IBM speak,
that is slow mode, which would be C states in Intel speak.

There is also throttling (IBM), which can be applied to each core
seperately, and is the rough equivalent of T states in Intel terminology,
but it's almost useless for power saving purposes, so we don't do it
except for emergency (thermal overload) throttling.

> I can think of many situations in our code where at certain times we
> may only be able to keep N out of M spes occupied (because of how
> we've expressed our task-specific parallelism), but we're counting on
> the ones we're using running at full speed so that we can maintain our
> real-time throughput. =A0(Our application does real-time signal
> processing of continuously streaming data)
> =

> Is there a way to disable the "throttling SPEs" feature short of
> configuring it out of the kernel?

By default, Linux always uses the "performance" governor, you have
to enable the spu aware governor manually to get the slow mode feature
in the first place.

Also, the idea of this code is to enter slow mode only if none of the
SPEs is constantly busy. As soon as you have a single thread hogging
one SPE, it will behave just like the performance governor, i.e.
do nothing.

	Arnd <><
