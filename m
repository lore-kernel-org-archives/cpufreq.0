From: Gleb Natapov <gleb@redhat.com>
Subject: Re: [Qemu-devel] cpufreq and QEMU guests
Date: Tue, 17 Sep 2013 11:58:38 +0300
Message-ID: <20130917085837.GV17294@redhat.com>
References: <20130916121545.GH5105@irqsave.net>
 <8668D877-8B37-48E3-97B8-CE36DB884E54@suse.de>
 <20130916150544.GJ5105@irqsave.net>
 <20130916153239.GD906@redhat.com>
 <20130916154603.GK5105@irqsave.net>
 <20130916155840.GE906@redhat.com>
 <20130916184258.GO5105@irqsave.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130916184258.GO5105@irqsave.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?Q?Beno=C3=AEt?= Canet <benoit.canet@irqsave.net>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Alexander Graf <agraf@suse.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "rjw@sisk.pl" <rjw@sisk.pl>, "pbonzini@redhat.com" <pbonzini@redhat.com>

On Mon, Sep 16, 2013 at 08:42:58PM +0200, Beno=C3=AEt Canet wrote:
> Le Monday 16 Sep 2013 =C3=A0 18:58:40 (+0300), Gleb Natapov a =C3=A9c=
rit :
> > On Mon, Sep 16, 2013 at 05:46:04PM +0200, Beno=C3=AEt Canet wrote:
> > > Le Monday 16 Sep 2013 =C3=A0 18:32:39 (+0300), Gleb Natapov a =C3=
=A9crit :
> > > > On Mon, Sep 16, 2013 at 05:05:45PM +0200, Beno=C3=AEt Canet wro=
te:
> > > > > Le Monday 16 Sep 2013 =C3=A0 09:39:10 (-0500), Alexander Graf=
 a =C3=A9crit :
> > > > > >=20
> > > > > >=20
> > > > > > Am 16.09.2013 um 07:15 schrieb Beno=C3=AEt Canet <benoit.ca=
net@irqsave.net>:
> > > > > >=20
> > > > > > >=20
> > > > > > > Hello,
> > > > > > >=20
> > > > > > > I know a cloud provider worried about the fact that the /=
proc/cpuinfo of his
> > > > > > > guests give a bogus frequency to his customer.
> > > > > > >=20
> > > > > > > QEMU and the guests kernel currently have no way to refle=
ct the host frequency
> > > > > > > changes to the guests.
> > > > > > >=20
> > > > > > > The customer compute intensive application then read this=
 information and take
> > > > > > > wrong decisions.
> > > > > >=20
> > > > > > Why do they care about the frequency? Is it for scheduling =
workloads? The only other case I can think of would be the TSC and that=
 should be fixed frequency these days.
> > > > > >=20
> > > > > > If it's scheduling, you could maybe expose the unavailable =
compute time as steal time to the guest. Exposibg frequency in a virtua=
l environment feels backwards.
> > > > >=20
> > > > > The final customer have a compute intensive workload.
> > > > > At startup the code retrieve the cpu cache topology, the cpu =
model, and various
> > > > > informations including the guest cpu frequency before startin=
g the compute job.
> > > > > The QEMU instance typicaly use -cpu host.
> > > > >=20
> > > > > The code inspects the cpu frequency has seen by the guests to=
 choose the number
> > > > > of vms to instanciate to compute the given task.
> > > > I am not sure I understand. They look at guest cpu frequency to=
 estimate
> > > > guest's performance?
> > >=20
> > > Yes they take guest cpu count, model and frequency to estimate th=
e performance
> > > of the guest.
> > > Next they cluster enough guests to be able to compute the job in =
a given time by
> > > using this estimate.
> > >=20
> > They do it wrong. They should take guest cpu count, host cpu model =
and
> > frequency, pcpu/vcpu over commit (if any), guest/host memory overco=
mmit
> > (if any) and estimate performance based on this. For pure computati=
onal
> > performance guest core performance should be close to host core
> > performance if there is not cpu/memory overcommit. With a lot of IO
> > things become more complicated.
>=20
> I ommited to write some details of the use case.
>=20
> The cloud is a Amazon compatible one this means there is no guest age=
nt in the
> guest to help retrieve the host frequency and model.
>
> Also the AWS APIs don't provide a way to communicate the host CPU inf=
os to the
> program responsible of the vm orchestrations.
>=20
> So the only interface to access the host cpu info is QEMU and it's st=
arted with
> -cpu host to passthrough the cpu model to the guest.
>=20
Why are they sure they are started with "-cpu host"? Do they know if
host is overcommitted or guest's vcpu usage is restricted by any other
means?

> What hurt the final customer badly is that the guest /proc/cpuinfo se=
e the
> regular max frequency of the host cpu but won't see the turbo frequen=
cy or a
> scaled down one.
>=20
What he sees is host tsc frequency of the cpu a guest was booted on
[1] which should be adequate to estimate performance if guest is not
migrated. The frequency host cpu is running on at any given moment is
out of guest control and depend on host frequency governor and load.

[1] the value comes from host, for not constant tsc hosts this is max
    possible frequency

--
			Gleb.
