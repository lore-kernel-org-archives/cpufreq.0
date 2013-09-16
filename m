From: Gleb Natapov <gleb@redhat.com>
Subject: Re: cpufreq and QEMU guests
Date: Mon, 16 Sep 2013 18:32:39 +0300
Message-ID: <20130916153239.GD906@redhat.com>
References: <20130916121545.GH5105@irqsave.net>
 <8668D877-8B37-48E3-97B8-CE36DB884E54@suse.de>
 <20130916150544.GJ5105@irqsave.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130916150544.GJ5105@irqsave.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?Q?Beno=C3=AEt?= Canet <benoit.canet@irqsave.net>
Cc: Alexander Graf <agraf@suse.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "rjw@sisk.pl" <rjw@sisk.pl>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>

On Mon, Sep 16, 2013 at 05:05:45PM +0200, Beno=C3=AEt Canet wrote:
> Le Monday 16 Sep 2013 =C3=A0 09:39:10 (-0500), Alexander Graf a =C3=A9=
crit :
> >=20
> >=20
> > Am 16.09.2013 um 07:15 schrieb Beno=C3=AEt Canet <benoit.canet@irqs=
ave.net>:
> >=20
> > >=20
> > > Hello,
> > >=20
> > > I know a cloud provider worried about the fact that the /proc/cpu=
info of his
> > > guests give a bogus frequency to his customer.
> > >=20
> > > QEMU and the guests kernel currently have no way to reflect the h=
ost frequency
> > > changes to the guests.
> > >=20
> > > The customer compute intensive application then read this informa=
tion and take
> > > wrong decisions.
> >=20
> > Why do they care about the frequency? Is it for scheduling workload=
s? The only other case I can think of would be the TSC and that should =
be fixed frequency these days.
> >=20
> > If it's scheduling, you could maybe expose the unavailable compute =
time as steal time to the guest. Exposibg frequency in a virtual enviro=
nment feels backwards.
>=20
> The final customer have a compute intensive workload.
> At startup the code retrieve the cpu cache topology, the cpu model, a=
nd various
> informations including the guest cpu frequency before starting the co=
mpute job.
> The QEMU instance typicaly use -cpu host.
>=20
> The code inspects the cpu frequency has seen by the guests to choose =
the number
> of vms to instanciate to compute the given task.
I am not sure I understand. They look at guest cpu frequency to estimat=
e
guest's performance?

> They even destroy and recreate some vms that would be underperforming=
 to
> mitigate the high inter vm communication costs.
>=20
> Do you think the steal time trick would work for this ?
>=20

--
			Gleb.
