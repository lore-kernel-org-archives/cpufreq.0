From: Michael Pophal <michael.pophal@siemens.com>
Subject: Re: powernow-k8: Power state transitions not supported
Date: Tue, 29 Mar 2005 14:02:41 +0200
Message-ID: <1112097761.3156.41.camel@localhost.localdomain>
References: <1112085824.3156.13.camel@localhost.localdomain>
	<200503291059.16320.pytasz@lodz.home.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200503291059.16320.pytasz@lodz.home.pl>
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
Content-Type: text/plain; charset="iso-8859-1"
To: pytasz@lodz.home.pl
Cc: cpufreq@lists.linux.org.uk

Hi Michal,
thanks for your prompt reply.
Yes, I have 'Cool'n Quiet' enable in BIOS.

>> Do You have cpuid in Your kernel?
What does this mean?

What is the difference between powernow-k8 module and powernowd?

Thanks for your help!

Regards Mike=20


On Tue, 2005-03-29 at 12:59, Micha=B3 Pytasz wrote:
> On Tuesday 29 of March 2005 08:43, Michael Pophal wrote:
> > Hi,
> > I tried the last 3 days to convince cpufreq to work with my new Sempe=
ron
> > 2600+ (Socket 754).
> > I also bought a new mainboard 'MSI K8T Neo-V'. It is a desktop (not
> > mobile) processor!
> > I compiled the kernel with the recommended settings. The result durin=
g
> > startup:
> > powernow-k8: Power state transitions not supported
> Do You have cpuid in Your kernel?
>=20
> > It seems to me, that this processor is not supported by cpufreq, isn'=
t
> > it?
>=20
> I guess it is, however I might be wrong ;)
>=20
> > I want to have a cheap processor, which is able to save power, becaus=
e
> > it is running the whole day. Do you have any recommendation which
> > processor I should use. I'm going to change the Semperon 2600+ to try
> > another combination (cpu + mainboard). Any hint is hightly apprecitat=
ed!
> >
> > Do you have a Semperon xx00+ (Socket 754) running on this 'Cool'n Qui=
et'
> > mode? Which one works?
>=20
> Do You have "Cool&Quiet" enabled in bios? (I have, I guess similar, mai=
nboard=20
> in my desktop, it's MSI K8T Neo2 - there is a bios option that enbles i=
t).=20
> When this option is disabled I get similar message ;)=20
> Well, I have another problem with it, desktop with powernow-k8 is not a=
s=20
> stable as it ought to be - it hangs hard sometimes (Athlon64 3200+ s939=
).=20
> Problem does not occur in a laptop, where I have Mobile Sempron 2800 s7=
54=20
> working. powernow-k8 is a module, I use powernowd.
>=20
> Micha=B3=20
>=20
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
