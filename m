From: Jean Delvare <jdelvare@suse.de>
Subject: Re: Move of powerpc/cell cpufreq drivers
Date: Fri, 28 Mar 2014 19:44:49 +0100
Message-ID: <1396032289.8076.22.camel@chaos.site>
References: <20140328102616.20b45a0a@endymion.delvare>
	 <201403281902.33169.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201403281902.33169.arnd@arndb.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, cpufreq@vger.kernel.org

Hi Arnd,

Thanks for the quick reply.

Le Friday 28 March 2014 =C3=A0 19:02 +0100, Arnd Bergmann a =C3=A9crit =
:
> On Friday 28 March 2014, Jean Delvare wrote:
>=20
> > The current situation is kind of odd, because CPU_FREQ_CBE_PMI (boo=
l)
> > depends on CPU_FREQ_CBE (tristate) so it is possible to have
> > CPU_FREQ_CBE=3Dm and CPU_FREQ_CBE_PMI=3Dy. If ppc_cbe_cpufreq_pmi r=
eally
> > depends on ppc_cbe_cpufreq, then that will fail, as ppc_cbe_cpufreq=
 as
> > a module may not be loaded when ppc_cbe_cpufreq_pmi is initialized.=
 The
> > compiler would complain about missing symbols. So I suspect this
> > dependency doesn't actually exist, otherwise after one year someone
> > would have noticed the build breakage, right?
>=20
> I believe CPU_FREQ_CBE can be built with support for CPU_FREQ_CBE_PMI
> or without, but if the PMI code is a module, then CPU_FREQ_CBE
> cannot be 'y'.=09
>=20
> > As a conclusion I believe the following changes should be applied:
> > * CPU_FREQ_CBE_PMI should be changed to a tristate.
> > * CPU_FREQ_CBE_PMI should not depend on CPU_FREQ_CBE.
> >=20
> > I can write and submit the patches once it is confirmed that this
> > changes are the right way to fix the problem.
>=20
> If you do this, you should also add
>=20
> 	depends on CPU_FREQ_CBE_PMI || !CPU_FREQ_CBE_PMI
>=20
> to the CPU_FREQ_CBE option, to correctly handle the dependency.

Ah, my bad, I thought both modules were more or less independent, I
didn't realize ppc_cbe_cpufreq_pmi was actually a helper "module" for
ppc_cbe_cpufreq when enabled.

Thinking about it some more, I think this would be much more simple to
build ppc_cbe_cpufreq_pmi.c as an object that would part of
ppc_cbe_cpufreq.ko. That is, build everything as a single module in the
end. That would solve the cross-dependency issue, and the code in
ppc_cbe_cpufreq_pmi would no longer have to be built-in.

But well, I don't really have the time to look into this, especially as
I don't even have a powerpc machine at hand to test the changes. So if
nobody cares, things will have to stay the way they are.

> I don't actually see a problem with the current code, other than
> that CPU_FREQ_CBE_PMI could in theory be a module. This code is
> used only for an IBM machine that has been end-of-service for
> a couple of years. If anyone still wants to build kernels for
> it, they probably want it built-in anyway, and not have
> the same kernel run on other machines.

Thanks for pointing this out. I don't know much about powerpc hardware
so I didn't realize that. We indeed ended up disabling this driver
altogether in our default ppc kernel config. Which was the easiest way
to solve our problem after all :-)

--=20
Jean Delvare
SUSE L3 Support

