From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
Subject: Re: cpufreq and QEMU guests
Date: Mon, 16 Sep 2013 17:46:04 +0200
Message-ID: <20130916154603.GK5105@irqsave.net>
References: <20130916121545.GH5105@irqsave.net>
 <8668D877-8B37-48E3-97B8-CE36DB884E54@suse.de>
 <20130916150544.GJ5105@irqsave.net>
 <20130916153239.GD906@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130916153239.GD906@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Gleb Natapov <gleb@redhat.com>
Cc: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>, Alexander Graf <agraf@suse.de>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "rjw@sisk.pl" <rjw@sisk.pl>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>

Le Monday 16 Sep 2013 =E0 18:32:39 (+0300), Gleb Natapov a =E9crit :
> On Mon, Sep 16, 2013 at 05:05:45PM +0200, Beno=EEt Canet wrote:
> > Le Monday 16 Sep 2013 =E0 09:39:10 (-0500), Alexander Graf a =E9cri=
t :
> > >=20
> > >=20
> > > Am 16.09.2013 um 07:15 schrieb Beno=EEt Canet <benoit.canet@irqsa=
ve.net>:
> > >=20
> > > >=20
> > > > Hello,
> > > >=20
> > > > I know a cloud provider worried about the fact that the /proc/c=
puinfo of his
> > > > guests give a bogus frequency to his customer.
> > > >=20
> > > > QEMU and the guests kernel currently have no way to reflect the=
 host frequency
> > > > changes to the guests.
> > > >=20
> > > > The customer compute intensive application then read this infor=
mation and take
> > > > wrong decisions.
> > >=20
> > > Why do they care about the frequency? Is it for scheduling worklo=
ads? The only other case I can think of would be the TSC and that shoul=
d be fixed frequency these days.
> > >=20
> > > If it's scheduling, you could maybe expose the unavailable comput=
e time as steal time to the guest. Exposibg frequency in a virtual envi=
ronment feels backwards.
> >=20
> > The final customer have a compute intensive workload.
> > At startup the code retrieve the cpu cache topology, the cpu model,=
 and various
> > informations including the guest cpu frequency before starting the =
compute job.
> > The QEMU instance typicaly use -cpu host.
> >=20
> > The code inspects the cpu frequency has seen by the guests to choos=
e the number
> > of vms to instanciate to compute the given task.
> I am not sure I understand. They look at guest cpu frequency to estim=
ate
> guest's performance?

Yes they take guest cpu count, model and frequency to estimate the perf=
ormance
of the guest.
Next they cluster enough guests to be able to compute the job in a give=
n time by
using this estimate.

Best regards

Beno=EEt

>=20
> > They even destroy and recreate some vms that would be underperformi=
ng to
> > mitigate the high inter vm communication costs.
> >=20
> > Do you think the steal time trick would work for this ?
> >=20
>=20
> --
> 			Gleb.
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
