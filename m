From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - Use information from Longhaul
Date: Sun, 09 Jul 2006 21:47:04 +0200
Message-ID: <44B15D38.3030204@interia.pl>
References: <44B0D22D.2030805@interia.pl> <20060709190027.GB10044@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060709190027.GB10044@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

> On Sun, Jul 09, 2006 at 11:53:49AM +0200, Rafa=B3 Bilski wrote:
>  > First. I lost very important line in do_powersaver. Again. Sorry.
>=20
> So why is this diff longer than one line ? :-)
>=20
[...]
>=20
> 		Dave

Right.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

--- linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c.orig	2006-07=
-08 22:21:35.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-09 2=
1:44:47.000000000 +0200
@@ -162,6 +162,7 @@ static void do_powersaver(int cx_address
 	longhaul.bits.RevisionKey =3D longhaul.bits.RevisionID;
 	longhaul.bits.SoftBusRatio =3D clock_ratio_index & 0xf;
 	longhaul.bits.SoftBusRatio4 =3D (clock_ratio_index & 0x10) >> 4;
+	longhaul.bits.EnableSoftBusRatio =3D 1;
=20
 	/* Sync to timer tick */
 	safe_halt();


----------------------------------------------------------------------
PS. Fajny portal... >>> http://link.interia.pl/f196a
