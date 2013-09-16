From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
Subject: Re: [Qemu-devel] cpufreq and QEMU guests
Date: Mon, 16 Sep 2013 20:42:58 +0200
Message-ID: <20130916184258.GO5105@irqsave.net>
References: <20130916121545.GH5105@irqsave.net>
 <8668D877-8B37-48E3-97B8-CE36DB884E54@suse.de>
 <20130916150544.GJ5105@irqsave.net>
 <20130916153239.GD906@redhat.com>
 <20130916154603.GK5105@irqsave.net>
 <20130916155840.GE906@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130916155840.GE906@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Gleb Natapov <gleb@redhat.com>
Cc: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, Alexander Graf <agraf@suse.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "rjw@sisk.pl" <rjw@sisk.pl>, "pbonzini@redhat.com" <pbonzini@redhat.com>

Le Monday 16 Sep 2013 =E0 18:58:40 (+0300), Gleb Natapov a =E9crit :
> On Mon, Sep 16, 2013 at 05:46:04PM +0200, Beno=EEt Canet wrote:
> > Le Monday 16 Sep 2013 =E0 18:32:39 (+0300), Gleb Natapov a =E9crit =
:
> > > On Mon, Sep 16, 2013 at 05:05:45PM +0200, Beno=EEt Canet wrote:
> > > > Le Monday 16 Sep 2013 =E0 09:39:10 (-0500), Alexander Graf a =E9=
crit :
> > > > >=20
> > > > >=20
> > > > > Am 16.09.2013 um 07:15 schrieb Beno=EEt Canet <benoit.canet@i=
rqsave.net>:
> > > > >=20
> > > > > >=20
> > > > > > Hello,
> > > > > >=20
> > > > > > I know a cloud provider worried about the fact that the /pr=
oc/cpuinfo of his
> > > > > > guests give a bogus frequency to his customer.
> > > > > >=20
> > > > > > QEMU and the guests kernel currently have no way to reflect=
 the host frequency
> > > > > > changes to the guests.
> > > > > >=20
> > > > > > The customer compute intensive application then read this i=
nformation and take
> > > > > > wrong decisions.
> > > > >=20
> > > > > Why do they care about the frequency? Is it for scheduling wo=
rkloads? The only other case I can think of would be the TSC and that s=
hould be fixed frequency these days.
> > > > >=20
> > > > > If it's scheduling, you could maybe expose the unavailable co=
mpute time as steal time to the guest. Exposibg frequency in a virtual =
environment feels backwards.
> > > >=20
> > > > The final customer have a compute intensive workload.
> > > > At startup the code retrieve the cpu cache topology, the cpu mo=
del, and various
> > > > informations including the guest cpu frequency before starting =
the compute job.
> > > > The QEMU instance typicaly use -cpu host.
> > > >=20
> > > > The code inspects the cpu frequency has seen by the guests to c=
hoose the number
> > > > of vms to instanciate to compute the given task.
> > > I am not sure I understand. They look at guest cpu frequency to e=
stimate
> > > guest's performance?
> >=20
> > Yes they take guest cpu count, model and frequency to estimate the =
performance
> > of the guest.
> > Next they cluster enough guests to be able to compute the job in a =
given time by
> > using this estimate.
> >=20
> They do it wrong. They should take guest cpu count, host cpu model an=
d
> frequency, pcpu/vcpu over commit (if any), guest/host memory overcomm=
it
> (if any) and estimate performance based on this. For pure computation=
al
> performance guest core performance should be close to host core
> performance if there is not cpu/memory overcommit. With a lot of IO
> things become more complicated.

I ommited to write some details of the use case.

The cloud is a Amazon compatible one this means there is no guest agent=
 in the
guest to help retrieve the host frequency and model.

Also the AWS APIs don't provide a way to communicate the host CPU infos=
 to the
program responsible of the vm orchestrations.

So the only interface to access the host cpu info is QEMU and it's star=
ted with
-cpu host to passthrough the cpu model to the guest.

What hurt the final customer badly is that the guest /proc/cpuinfo see =
the
regular max frequency of the host cpu but won't see the turbo frequency=
 or a
scaled down one.

Best regards

Beno=EEt

>=20
> --
> 			Gleb.
>=20
