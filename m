From: Eric Piel <Eric.Piel@lifl.fr>
Subject: Re: [PATCH 1/2] Move PMBASE reading away and do it only once
 at	initialization time
Date: Wed, 30 Nov 2005 12:02:59 +0100
Message-ID: <438D86E3.9070502@lifl.fr>
References: <11333087112659-git-send-email-malattia@linux.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <11333087112659-git-send-email-malattia@linux.it>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mattia Dongili <malattia@linux.it>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Eric Piel <eric.piel@tremplin-utc.net>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

IMHO, this looks very fine :-)


11/30/2005 12:58 AM, Mattia Dongili wrote/a =C3=A9crit:
> Signed-off-by: Mattia Dongili <malattia@linux.it>
>=20
> ---
>=20
>  arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |   45 ++++++++++++++++++--=
------
>  1 files changed, 32 insertions(+), 13 deletions(-)
>=20
> applies-to: 41c86716d1584bad6ddf55c9132ef8b820bc1b15
> 31c370b9ba20188340635fd7cebc150c4b71b097
> diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c b/arch/i386/ker=
nel/cpu/cpufreq/speedstep-ich.c
> index 5b7d18a..17b7864 100644
> --- a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
> +++ b/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
:
> @@ -400,6 +415,10 @@ static int __init speedstep_init(void)
>  		return -EINVAL;
>  	}
> =20
> +	if (speedstep_find_register()) {
> +		return -ENODEV;
> +	}
> +
Please, keep it simple and do put { and } when there is only one line.


>  	return cpufreq_register_driver(&speedstep_driver);
>  }
> =20
