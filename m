From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: [PATCH] transition latency of speedstep-ich
Date: Sun, 06 Mar 2005 18:06:41 +0100
Message-ID: <422B38A1.9050706@tremplin-utc.net>
References: <42069B4D.6090505@tremplin-utc.net>
	<20050209191515.GA21319@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050402010200070909050701"
In-Reply-To: <20050209191515.GA21319@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@zenii.linux.org.uk

This is a multi-part message in MIME format.
--------------050402010200070909050701
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Dominik Brodowski a =C3=A9crit :
> On Sun, Feb 06, 2005 at 11:33:49PM +0100, Eric Piel wrote:
:
>>This patch proposes to consider a CPUFREQ_ETERNAL latency as the maximu=
m=20
>>possible latency of the governor (10 ms). I think this should be=20
>>conservative enough to be safe with any driver.
> =20
> No. CPUFREQ_ETERNAL is there to assert no dynamic frequency governor ru=
ns
> with this driver. If a driver is safe to run on dynamic frequency gover=
nors
> like ondemand, fix the latency value instead.
>=20
OK, so here is a patch for vanilla 2.6.11 to set the transition latency=20
of speedstep-ich (the only driver which I can test in addtion to=20
p4-clockmod). Actually it was quite hard to find, the intel manual=20
(29834006.pdf) doesn't assert this latency clearly. From what I=20
understood the frequency transition could take up to about 40=C2=B5s (p.4=
4)=20
while the voltage transition could take up to 100=C2=B5s (p.22 and p.58).=
 So=20
I put 100=C2=B5s as the transition latency of this driver.

I've tried it on my computer, it works, and the ondemand governor can=20
now support my hardware!

Hope you like it,
Eric

--
Set the transition latency of speedstep-ich to 100=C2=B5s as described in=
=20
intel's manual.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
--

--------------050402010200070909050701
Content-Type: text/x-patch;
	name="speedstep-ich-transition-latency-2.6.11.patch"
Content-Disposition: inline;
	filename="speedstep-ich-transition-latency-2.6.11.patch"
Content-Transfer-Encoding: quoted-printable

--- linux-2.6.11/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c.orig	2005-0=
2-07 23:52:55.000000000 +0100
+++ linux-2.6.11/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2005-03-06 =
17:51:04.000000000 +0100
@@ -335,7 +335,8 @@
=20
 	/* cpuinfo and default policy values */
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency =3D CPUFREQ_ETERNAL;
+ 	/* Max 100=C2=B5s, according to intel's 29834006.pdf p.22 */
+	policy->cpuinfo.transition_latency =3D 100000;
 	policy->cur =3D speed;
=20
 	result =3D cpufreq_frequency_table_cpuinfo(policy, speedstep_freqs);

--------------050402010200070909050701
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------050402010200070909050701--

