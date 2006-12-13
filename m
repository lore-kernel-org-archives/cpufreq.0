From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Don't use regs to obtain FSB frequency
Date: Wed, 13 Dec 2006 17:50:09 -0500
Message-ID: <20061213225009.GL2418@redhat.com>
References: <458080DA.3040504@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <458080DA.3040504@interia.pl>
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
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk

On Wed, Dec 13, 2006 at 11:38:18PM +0100, Rafa=C5=82 Bilski wrote:
 > Current code has a problem with FSB on "PowerSaver 1.0"=20
 > CPU. FSB is incorrecly guessed (again) for mini PC by Ebox.=20
 > There is 8x100MHz CPU with "Nehemiah" core. It is reported=20
 > as 8x133MHz. Apparently Longhaul MSR isn't reliable source=20
 > of information if it is RevisionID =3D=3D 0 for anything else=20
 > then max multiplier. We can't read 200MHz FSB from it nor=20
 > from EBLCR_POWER_ON too. This driver is working only with=20
 > multipliers. FSB frequency is only needed to calculate CPU=20
 > f for Cpufreq core. At boot kernel is calculating processor=20
 > frequency. We know the multiplier. In this way we have bus=20
 > frequency with kHz precision.

I'm puzzled.  This description talks exclusively about Nehemiah,
and yet it's making changes to code only run by the pre-Nehemiah cores.
This makes me especially nervous as those chips don't get a
great deal of testing any more, and we typically learn that we
broke them months after making changes.

Has this been tested on anything other than the system mentioned above?
It seems like huge potential for regressions here, due to the size
and impact of the changes.

		Dave

--=20
http://www.codemonkey.org.uk
