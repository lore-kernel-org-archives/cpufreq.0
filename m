From: Alexander Graf <agraf@suse.de>
Subject: Re: cpufreq and QEMU guests
Date: Mon, 16 Sep 2013 09:39:10 -0500
Message-ID: <8668D877-8B37-48E3-97B8-CE36DB884E54@suse.de>
References: <20130916121545.GH5105@irqsave.net>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130916121545.GH5105@irqsave.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?Q?Beno=C3=AEt_Canet?= <benoit.canet@irqsave.net>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "rjw@sisk.pl" <rjw@sisk.pl>, "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "gleb@redhat.com" <gleb@redhat.com>



Am 16.09.2013 um 07:15 schrieb Beno=C3=AEt Canet <benoit.canet@irqsave.=
net>:

>=20
> Hello,
>=20
> I know a cloud provider worried about the fact that the /proc/cpuinfo=
 of his
> guests give a bogus frequency to his customer.
>=20
> QEMU and the guests kernel currently have no way to reflect the host =
frequency
> changes to the guests.
>=20
> The customer compute intensive application then read this information=
 and take
> wrong decisions.

Why do they care about the frequency? Is it for scheduling workloads? T=
he only other case I can think of would be the TSC and that should be f=
ixed frequency these days.

If it's scheduling, you could maybe expose the unavailable compute time=
 as steal time to the guest. Exposibg frequency in a virtual environmen=
t feels backwards.

Alex

>=20
> I looked at the various Linux cpufreq drivers and they all seems to b=
e table
> based. Is it true ?
>=20
> For example the acpi cpufreq driver have 16 differents pstates at han=
d to lookup
> in the pstate table and get the frequency.
>=20
> Given that guests can migrate from one hardware to a slightly differe=
nt hardware
> the table may become wrong after live migration.
>=20
> What would be the best hardware to emulate in order to pass an arbitr=
ary
> frequency to the guest ?
>=20
> Would a pvfreq paravirtualized QEMU hardware and a guest driver imple=
menting
> only the callbacks needed to read the frequency be a good idea ?
>=20
> Best regards
>=20
> Beno=C3=AEt
>=20
> ps:
> I CC this mail to the other QEMU arch maintainers because the problem=
 must be
> the same everywhere where KVM run.
