From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
Subject: Re: cpufreq and QEMU guests
Date: Mon, 16 Sep 2013 17:05:45 +0200
Message-ID: <20130916150544.GJ5105@irqsave.net>
References: <20130916121545.GH5105@irqsave.net>
 <8668D877-8B37-48E3-97B8-CE36DB884E54@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8668D877-8B37-48E3-97B8-CE36DB884E54@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alexander Graf <agraf@suse.de>
Cc: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "rjw@sisk.pl" <rjw@sisk.pl>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "gleb@redhat.com" <gleb@redhat.com>

Le Monday 16 Sep 2013 =E0 09:39:10 (-0500), Alexander Graf a =E9crit :
>=20
>=20
> Am 16.09.2013 um 07:15 schrieb Beno=EEt Canet <benoit.canet@irqsave.n=
et>:
>=20
> >=20
> > Hello,
> >=20
> > I know a cloud provider worried about the fact that the /proc/cpuin=
fo of his
> > guests give a bogus frequency to his customer.
> >=20
> > QEMU and the guests kernel currently have no way to reflect the hos=
t frequency
> > changes to the guests.
> >=20
> > The customer compute intensive application then read this informati=
on and take
> > wrong decisions.
>=20
> Why do they care about the frequency? Is it for scheduling workloads?=
 The only other case I can think of would be the TSC and that should be=
 fixed frequency these days.
>=20
> If it's scheduling, you could maybe expose the unavailable compute ti=
me as steal time to the guest. Exposibg frequency in a virtual environm=
ent feels backwards.

The final customer have a compute intensive workload.
At startup the code retrieve the cpu cache topology, the cpu model, and=
 various
informations including the guest cpu frequency before starting the comp=
ute job.
The QEMU instance typicaly use -cpu host.

The code inspects the cpu frequency has seen by the guests to choose th=
e number
of vms to instanciate to compute the given task.
They even destroy and recreate some vms that would be underperforming t=
o
mitigate the high inter vm communication costs.

Do you think the steal time trick would work for this ?

Best regards

Beno=EEt


>=20
> Alex
>=20
> >=20
> > I looked at the various Linux cpufreq drivers and they all seems to=
 be table
> > based. Is it true ?
> >=20
> > For example the acpi cpufreq driver have 16 differents pstates at h=
and to lookup
> > in the pstate table and get the frequency.
> >=20
> > Given that guests can migrate from one hardware to a slightly diffe=
rent hardware
> > the table may become wrong after live migration.
> >=20
> > What would be the best hardware to emulate in order to pass an arbi=
trary
> > frequency to the guest ?
> >=20
> > Would a pvfreq paravirtualized QEMU hardware and a guest driver imp=
lementing
> > only the callbacks needed to read the frequency be a good idea ?
> >=20
> > Best regards
> >=20
> > Beno=EEt
> >=20
> > ps:
> > I CC this mail to the other QEMU arch maintainers because the probl=
em must be
> > the same everywhere where KVM run.
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
