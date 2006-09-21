From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: writing a cpufreq driver
Date: Thu, 21 Sep 2006 14:38:22 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF153669@SAUSEXMB1.amd.com>
References: <20060921193141.GE17065@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <20060921193141.GE17065@redhat.com>
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
To: Dave Jones <davej@redhat.com>, nemesis@icequake.net
Cc: Cpufreq@lists.linux.org.uk

>  > 1.  The first time cpufreq changes speed, I get the whole=20
> "Losing some
>  > ticks... checking if CPU frequency changed." then=20
> eventually "Losing too
>  > many ticks!" and timer switches to PIT.  This does not=20
> happen when I use
>  > the /dev/toshiba driver to change speeds from userspace. =20
> Not sure what
>  > is going on here...  SMI handler latency is between 6 and 7 ms.
>=20
> Is loops_per_jiffy being correctly scaled on a speed transition?
> Hmm, powernow-k7.c seems to be the only driver that's calling=20
> recalibrate_cpu_khz()

Do drivers need to be doing that?  I would have thought the
time could would do it after receiving the notification.

If not, I'll patch.

-Mark Langsdorf
AMD, Inc.
