From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] cpufreq: fix latency comment in cpufreq.h [Was: Re:
	[PATCH] AMD Elan SC520 cpufreq driver]
Date: Sat, 9 Apr 2005 17:43:39 -0400
Message-ID: <20050409214339.GA15030@redhat.com>
References: <20050329213658.GA12868@levin.pad.mess.org>
	<20050329220432.GA4018@isilmar.linta.de>
	<20050403162700.GA21169@levin.pad.mess.org>
	<425081E0.6070205@tremplin-utc.net>
	<20050409202055.GA30626@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050409202055.GA30626@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk, Eric Piel <Eric.Piel@tremplin-utc.net>

On Sat, Apr 09, 2005 at 10:20:55PM +0200, Dominik Brodowski wrote:
 > On Mon, Apr 04, 2005 at 01:53:04AM +0200, Eric Piel wrote:
 > > Sean Young a =E9crit :
 > > >-	policy->cpuinfo.transition_latency =3D CPUFREQ_ETERNAL;
 > > >+	policy->cpuinfo.transition_latency =3D 1000; /* 1ms */
 > >=20
 > > transition_latency is expressed in nanoseconds, so it should be 1000=
000.
 > > I guess the confusion comes from cpufreq.h, where there are two comm=
ents=20
 > > about it, one saying it's nanosecond, another one (older) saying it'=
s=20
 > > microseconds. Dominik, maybe this typo should be fixed, do you want =
me=20
 > > to send a patch?
 >=20
 > Nice catch.
 >=20
 >=20
 > Fix up comment in cpufreq.h stating transition latency should be passe=
d
 > in microseconds -- it was decided long ago to switch to nanoseconds.
 >=20
 > Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

With Linus not merging anything right now due to the bitkeeper
fiasco, I'm just sitting on a bunch of stuff.
I'm not asking you (and others) not to send stuff, but be prepared
to bomb me again once Linus has figured out how things are going
to work.

Cheers,

		Dave
