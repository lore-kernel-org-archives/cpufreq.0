From: Dave Jones <davej@redhat.com>
Subject: Re: Geode NX PowerNow
Date: Mon, 24 May 2004 14:12:31 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1085404351.12719.3.camel@delerium.codemonkey.org.uk>
References: <20040524130226.GB7769@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040524130226.GB7769@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="windows-1252"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk

On Mon, 2004-05-24 at 14:02, Dominik Brodowski wrote:
> Dear Paul,
>=20
> A few minutes ago I heard of the new Geode NX processors AMD is shipping.
> Reportedly, they contain the "PowerNow!" technology. Is this powernow-k7 =
or
> powernow-k8? If it's powernow-k8, does check_supported_cpu() detect it? I=
f
> it's powernow-k7, do the CPUID checks in check_powernow() work?
>=20
> In addition, I think we should clarify some help texts in Kconfig [once t=
he
> issues mentioned above are resolved] to show the differences between
> gx-suspmod and powernow-k{7,8} for Geode NX.

Interesting. geode used to be a natsemi product iirc.
However the NX stuff looks to be unrelated to the old product.

"The NX 1500@6W processor leverages Mobile AMD Athlon=E2=84=A2 processor
technology"  Sounds like powernow-k7 should work with some
small modifications. I'll bet as long as BIOS has the right tables,
it'll just be a trivial modification to the cpuid detection routine.

	Dave
