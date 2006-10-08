From: Luca <morpheus@ferrara.linux.it>
Subject: Re: Cpufreq on kernel 2.6.18
Date: Sun, 8 Oct 2006 19:36:37 +0200
Message-ID: <20061008193637.7cf052c7.morpheus@ferrara.linux.it>
References: <EB12A50964762B4D8111D55B764A8454B2E59D@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A8454B2E59D@scsmsx413.amr.corp.intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk

On Fri, 6 Oct 2006 16:08:22 -0700
"Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com> wrote:

> =20
>=20
> >-----Original Message-----
> >From: cpufreq-bounces@lists.linux.org.uk=20
> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Luca
> >Sent: Friday, October 06, 2006 1:01 PM
> >To: cpufreq@lists.linux.org.uk
> >Subject: Cpufreq on kernel 2.6.18
> >
> >Hello,
> >I just updated the kernel from 2.6.15.2 to 2.6.18 and the=20
> >frequency scaling of my Centrinlo Laptop stopped working=20
> >(keeping the same configuration).
> >The dir /sys/devices/system/cpu/cpu0/ is empty and I don't=20
> >know which other tests I could make.
> >I also tried to move CONFIG_X86_ACPI_CPUFREQ from builtin to=20
> >module: loading the module does not give any information nor any error.
> >I need 2.6.18 for other drivers, so it would be really nice if=20
> >I could solve this problem that seems to be the only driver=20
> >that's not working properly (and my battery would be much happier :) )
> >If you need more informations just tell me.
> >
>=20
> Can you enable CPU_FREQ_DEBUG in your config and pass "cpufreq.debug=3D3"
> in kernel parameter and send in the dmesg log.

I found something, and maybe I have to ask excuse, because now it's working=
..
Anyway something has changed and that's the reason that fooled me: on my ol=
d logs, with the old kernel I had:
 acpi-cpufreq: CPU0 - ACPI performance management activated.
So I focused my attention on the module acpi-cpufreq. Inserting it, even wi=
th debug activated (cpufreq.debug=3D3 forgot to pass it at boot, but now se=
ems not so important...) doesn't tell anything at all (and doesn't work).
I was playing with other modules, and I found that loading the module speed=
step-centrino enables cpufreq (even if on kernel log doesn't print anything=
).
So something has changed in the software support for my hardware. I'm sorry=
 for not having understood earlyer. Since I'm writing here, can I kindly as=
k you a short explanation on this difference between two different kernels,=
 on the same hardware.

Thanks for the fast answer,
				Luca.


PS: thanks for the work on cpufreq: with the moderm pcs with cpu pull to th=
e limit I think it's really useful to be able to force lower frequency, whe=
n you don't need all the computeing power.

> Thanks,
> Venki


--=20
       .-------------------------------------.
  -=3D<(=A7  Luca <morpheus AT ferrara.linux.it>  =A7)>=3D-
       =B0-------------------------------------=B0
