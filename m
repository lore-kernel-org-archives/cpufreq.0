From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: powerpc/cell/cpufreq: add spu aware cpufreq governor
Date: Tue, 15 Jul 2008 15:02:00 +0200
Message-ID: <200807151502.01540.arnd@arndb.de>
References: <200807071702.31240.arnd@arndb.de>
	<1215580739.8970.317.camel@pasglop>
	<20080709062958.GA24570@codemonkey.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080709062958.GA24570@codemonkey.org.uk>
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
To: linuxppc-dev@ozlabs.org
Cc: Dave Jones <davej@codemonkey.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, cpufreq@lists.linux.org.uk, Jeremy Kerr <jk@ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, cbe-oss-dev@ozlabs.org

On Wednesday 09 July 2008, Dave Jones wrote:
> =

> diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platforms=
/cell/Kconfig
> index 3959fcf..19f4b4d 100644
> --- a/arch/powerpc/platforms/cell/Kconfig
> +++ b/arch/powerpc/platforms/cell/Kconfig
> @@ -91,6 +91,7 @@ config CBE_THERM
> =A0config CBE_CPUFREQ
> =A0=A0=A0=A0=A0=A0=A0=A0tristate "CBE frequency scaling"
> =A0=A0=A0=A0=A0=A0=A0=A0depends on CBE_RAS && CPU_FREQ
> +=A0=A0=A0=A0=A0=A0=A0select CPU_FREQ_TABLE
> =A0=A0=A0=A0=A0=A0=A0=A0default m
> =A0=A0=A0=A0=A0=A0=A0=A0help
> =A0=A0=A0=A0=A0=A0=A0=A0 =A0This adds the cpufreq driver for Cell BE proc=
essors.

I found the problem now, there was an incorrect 'select CBE_CPUFREQ'
in the spudemand governor, but no 'depends on CPUFREQ', so it was
possible to build CBE_CPUFREQ without the base CPUFREQ support.

Fixed in the current version, will post later.

	Arnd <><
