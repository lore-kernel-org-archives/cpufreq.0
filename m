From: =?ISO-8859-1?Q?Adam_Engstr=F6m?= <ae@lysator.liu.se>
Subject: Re: [PATCH] Set min and max frequencies
Date: Sun, 20 Jul 2008 11:00:52 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807201042440.31266@mustang.lysator.liu.se>
References: <Pine.LNX.4.64.0807181817530.16435@mustang.lysator.liu.se>
	<20080720075431.GA22597@isilmar.linta.de>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-326989314-1928335356-1216544452=:31266"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080720075431.GA22597@isilmar.linta.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---326989314-1928335356-1216544452=:31266
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hello,

On Sun, 20 Jul 2008, Dominik Brodowski wrote:

> Hi,
>=20
> On Fri, Jul 18, 2008 at 06:38:48PM +0200, Adam Engstr=F6m wrote:
> > This patch fixes a bug with that the scaling min and max frequencies ar=
e=20
> > not set when they are not entirely correctly specified. For example=20
> > setting max frequency to 500000 when that frequency is 500040 according=
 to=20
> > the frequency table.
>=20
> but what if the CPU supports many many different frequencies (like
> gx-suspmod) and the user wants to set the max to 5000000 instead of 50100=
0 ?
> or instead of 500500 ?

So all supported frequencies are not listed in the table in such a case?=20
So the the table is not a series of values but a series of intervals? How=
=20
should it be interpreted?

> > +=09if (policy->max < data->min)
> > +=09=09policy->max =3D data->min;
>=20
> if the new maximum value is smaller than the current minimum value, we se=
t
> the new maximum value to the old minimum value? Why?
> let's assume the old policy was=09=09300000 kHz to 500000 kHz
> and the new policy should be=09=09100000 kHz to 200000 kHz
>=20
> why is this overwritten to be=09=09100000 kHz to 300000 kHz ?
=20
This seems indeed incorrect. The problem I am trying to solve is if the=20
old policy is 500040 kHz to X kHz and this should be changed to 500040 kHz=
=20
to 500000 kHz then this would be stopped and the max frequency would still=
=20
be X kHz. The value 500000 is written due to a message written during=20
startup of supported frequencies. Then I would like this incorrect=20
frequency value to be adjusted to the nearest supported frequency.

> > +=09if (policy->min > data->max)
> > +=09=09policy->min =3D data->max;
>=20
> similar issue. NACK.
>=20
> >=20
> > And here is a second patch that makes sure that all values are accepted=
=2E
> >=20
> > Index: freq_table.c
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > RCS file: /usr/local/cvsroot/cpufreq/freq_table.c,v
> > retrieving revision 1.1
> > retrieving revision 1.5
> > diff -u -r1.1 -r1.5
> > --- freq_table.c=0916 Jul 2008 22:01:23 -0000=091.1
> > +++ freq_table.c=0918 Jul 2008 10:24:31 -0000=091.5
> > @@ -120,6 +120,26 @@
> >  =09if (!cpu_online(policy->cpu))
> >  =09=09return -EINVAL;
> > =20
> > +=09/* Make sure to catch corner cases such as specifying a target
> > +=09   max and min that both are below the physical min
> > +=09   frequency. */
> > +=09unsigned int max =3D 0;
> > +=09unsigned int min =3D ~0;
> > +=09for (i=3D0; (table[i].frequency !=3D CPUFREQ_TABLE_END); i++) {
> > +=09=09unsigned int freq =3D table[i].frequency;
> > +=09=09if (freq =3D=3D CPUFREQ_ENTRY_INVALID)
> > +=09=09=09continue;
> > +
> > +=09=09if (freq < min)
> > +=09=09=09min =3D freq;
> > +=09=09if (freq > max)
> > +=09=09=09max =3D freq;
> > +=09}
> > +=09if (policy->min < min)
> > +=09=09policy->min =3D min;
> > +=09if (policy->max > max)
> > +=09=09policy->max =3D max;
> > +
>=20
> NACK. If we're to do such things, we should to it generically in cpufreq.=
c
> (in the input routines) instead of just for freq-table-dependant drivers.
> Also cpuinfo->{min,max}_freq exist and could be used for this purpose.
> Furthermore:
>=20
> # cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq
> 2001000
> # cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
> 800000
> # echo 3000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq=20
> # cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
> 2001000
>=20
> (same results if you use cpufrequtils' cpufreq-info and cpufreq-set, of
> course)
>=20
> So this seems to me to be a non-issue.

Alright be reading this value and use that when scaling down, my problem=20
would disappear. Thank you!

Best regards,
Adam Engstr=F6m

>=20
> Best,
> =09Dominik
>=20
---326989314-1928335356-1216544452=:31266
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

---326989314-1928335356-1216544452=:31266--

