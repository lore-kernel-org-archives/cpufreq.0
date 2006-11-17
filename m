From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: linux-2.6.19-rc6-g1b9bb3c1 build #128 failed
Date: Fri, 17 Nov 2006 11:55:51 -0800
Message-ID: <EB12A50964762B4D8111D55B764A8454E763D0@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Dave Jones <davej@redhat.com>, Toralf F???rster <toralf.foerster@gmx.de>, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Dave Jones
>Sent: Friday, November 17, 2006 11:45 AM
>To: Toralf F???rster; davej@codemonkey.org.uk;=20
>cpufreq@lists.linux.org.uk
>Subject: Re: linux-2.6.19-rc6-g1b9bb3c1 build #128 failed
>
>On Fri, Nov 17, 2006 at 08:37:59PM +0100, Mattia Dongili wrote:
>
> >=20
> > diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
> > index 2cc71b6..491779a 100644
> > --- a/drivers/cpufreq/Kconfig
> > +++ b/drivers/cpufreq/Kconfig
> > @@ -107,6 +107,7 @@ config CPU_FREQ_GOV_USERSPACE
> > =20
> >  config CPU_FREQ_GOV_ONDEMAND
> >  	tristate "'ondemand' cpufreq policy governor"
> > +	select CPU_FREQ_TABLE
> >  	help
> >  	  'ondemand' - This driver adds a dynamic cpufreq=20
>policy governor.
> >  	  The governor does a periodic polling and=20
>
>I suspect conservative needs a similar change?
>

No. This is ondmeand only requirement at this time as it is coming from
the recent powersave_bias changes that is only in ondemand.

Thanks,
Venki
