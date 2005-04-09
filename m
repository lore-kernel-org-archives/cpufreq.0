From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH] cpufreq: fix latency comment in cpufreq.h [Was: Re: [PATCH]
	AMD Elan SC520 cpufreq driver]
Date: Sat, 9 Apr 2005 22:20:55 +0200
Message-ID: <20050409202055.GA30626@dominikbrodowski.de>
References: <20050329213658.GA12868@levin.pad.mess.org>
	<20050329220432.GA4018@isilmar.linta.de>
	<20050403162700.GA21169@levin.pad.mess.org>
	<425081E0.6070205@tremplin-utc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <425081E0.6070205@tremplin-utc.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: davej@redhat.com, Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: cpufreq@lists.linux.org.uk

On Mon, Apr 04, 2005 at 01:53:04AM +0200, Eric Piel wrote:
> Sean Young a =E9crit :
> >-	policy->cpuinfo.transition_latency =3D CPUFREQ_ETERNAL;
> >+	policy->cpuinfo.transition_latency =3D 1000; /* 1ms */
>=20
> transition_latency is expressed in nanoseconds, so it should be 1000000.
> I guess the confusion comes from cpufreq.h, where there are two comments =

> about it, one saying it's nanosecond, another one (older) saying it's=20
> microseconds. Dominik, maybe this typo should be fixed, do you want me=20
> to send a patch?

Nice catch.


Fix up comment in cpufreq.h stating transition latency should be passed
in microseconds -- it was decided long ago to switch to nanoseconds.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

Index: 2.6.12-rc2/include/linux/cpufreq.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- 2.6.12-rc2.orig/include/linux/cpufreq.h	2005-03-02 18:23:48.000000000 +=
0100
+++ 2.6.12-rc2/include/linux/cpufreq.h	2005-04-09 22:19:04.000000000 +0200
@@ -49,7 +49,7 @@
 /* Frequency values here are CPU kHz so that hardware which doesn't run=20
  * with some frequencies can complain without having to guess what per=20
  * cent / per mille means.=20
- * Maximum transition latency is in microseconds - if it's unknown,
+ * Maximum transition latency is in nanoseconds - if it's unknown,
  * CPUFREQ_ETERNAL shall be used.
  */
