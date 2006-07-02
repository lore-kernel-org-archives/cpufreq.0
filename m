From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Use hardware support
Date: Sun, 2 Jul 2006 17:02:48 -0400
Message-ID: <20060702210248.GD14292@redhat.com>
References: <44A831D8.7040902@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44A831D8.7040902@interia.pl>
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

On Sun, Jul 02, 2006 at 10:51:36PM +0200, Rafa=C5=82 Bilski wrote:
 >=20
 > Changes in longhaul.h:
 > - clock tables merged - differences are little, "longhaul"
 > will do errata for detected CPU,
 > - eblcr tables merged - reason above,
 > - format of voltage tables changed,
 > - added mobile vrm.
 >=20
 > Changes in longhaul.c:
 > - most important - now C3 state is causing transition,
 > - code resopnsible for clearing "bus master" bit removed,
 > - protect bcr2 transition in the same way as longhaul,
 > - check if Longhaul MSR is present, don't assume that this
 > stepping have this MSR, and other don't,
 > - voltage scaling added. By default disabled because is=20
 > untested. Looks like processors on Epia mainboards don't
 > support voltage scaling,
 > - some FSB scaling compatibility,
 > - some minor changes.

Please split this up into easy-to-review single-change-per-diff
patchset.  This way if it becomes easier to review, and also
if there are any objectionable parts, I can drop those whilst
still applying the non-contentious parts.

Thanks,

		Dave

--=20
http://www.codemonkey.org.uk
