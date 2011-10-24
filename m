From: sabrina chang <sabrinaytchang@gmail.com>
Subject: Fwd: question about scailing CPU frequency
Date: Mon, 24 Oct 2011 14:18:26 +0800
Message-ID: <CABgotTJ9+Tce1b0Bh5oqvPJ1=cq79aRyVn7wi7A+4zKZFvHrfA@mail.gmail.com>
References: <CABgotTJO-_PppTW_1cqmsgV-0VQcK=BdQ76jXWg-M2gTxNOVgA@mail.gmail.com>
	<CABgotT+TnOikBe5jwsy_+bPPto42OYS5Mq5=wpzAmaKmv+4raw@mail.gmail.com>
	<201110200648.43552.trenn@suse.de>
	<CABgotTKRyXA=SVogC0qBTu+8L3QKPsJg_KecY3CLMGMz_jXnxA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=JHhueO0htRN2nZmOlqSeHr+AGQ/zKNBFlSGDAwTQPnY=;
        b=q8Abev3RrPirxf5fQ0xetw3OrbQRF9aI9vzgpXQOKq9ipCULuzGd2nqnhs2onn/k8B
         Jk4R6yinjPxtcJAngIrRWiOr7IfW2V7kFjAEfNdgaJnRlS8hUpk4J4tiTUnx5ZgTGkaO
         g6yxg1TFDIlmerargVfXoEALvximJ+FZDhxdw=
In-Reply-To: <CABgotTKRyXA=SVogC0qBTu+8L3QKPsJg_KecY3CLMGMz_jXnxA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

Hi, Thomas
thanks for your reply!
Yes, I want an environment like: one 2GHz and three 1GHz.
in this function:=A0acpi_cpufreq_cpu_init
my computer did not go through
if (policy->shared_type =3D=3D CPUFREQ_SHARED_TYPE_ALL ||
=A0 =A0 =A0 =A0 =A0 =A0policy->shared_type =3D=3D CPUFREQ_SHARED_TYPE_A=
NY) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cpumask_copy(policy->cpus, perf->shared_=
cpu_map);
}

the policy's shared_type has 4 possibility:
#define CPUFREQ_SHARED_TYPE_NONE (0) /* None */
#define CPUFREQ_SHARED_TYPE_HW (1) /* HW does needed coordination */
#define CPUFREQ_SHARED_TYPE_ALL (2) /* All dependent CPUs should set fr=
eq */
#define CPUFREQ_SHARED_TYPE_ANY (3) /* Freq can be set from any depende=
nt CPU*/
I guess my environment's=A0policy->shared_type may be=A0CPUFREQ_SHARED_=
TYPE_HW ?
I set the government to userspace, and change the frequency.
this function, acpi_cpufreq_target, is use to change the frequency.
my environment will enter the if loop
if (policy->shared_type !=3D CPUFREQ_SHARED_TYPE_ANY)
cmd.mask =3D policy->cpus;
else
cmd.mask =3D cpumask_of(policy->cpu);
so the mask is set to the=A0CPUs requiring sw coordination
hence, when I setting the frequency of core 0, only core 0 will do
cpufreq_notify_transition
then, change the frequency.
I use printk to debug, the result is like what I think.
My problem is:
now, all cores' government are userspace
all cores'=A0frequency is 1.6 GHz
when I set core 0 to 2 GHz, my debugging msg tell me only core 0 go
through=A0acpi_cpufreq_target's=A0cpufreq_notify_transition
But the others will become=A02 GHz!
is this because my=A0policy->shared_type is=A0CPUFREQ_SHARED_TYPE_HW??
is this function=A0acpi_processor_get_psd to set the=A0shared_type?
you mention about=A0BIOS (_PSD ACPI func)?
what is this? may I change the=A0shared_type?
sry my expression is not good...
BR,
Sabrina
2011/10/20 Thomas Renninger <trenn@suse.de>
>
> On Tuesday 18 October 2011 04:30:01 sabrina chang wrote:
> > hello,
> > I have some questions about scailing CPU frequency.
> > I want to create an environment with 1 higher CPU frequency and 3
> > lower CPU frequency on Fedora system(linux kernel 2.6.32) with
> > acpi-cpufreq driver (Intel Core i7-920 Processor).
> > *******************************************************************=
*********************************
> > this is the cpufreq-info report:
> > cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
> > Report errors and bugs to cpufreq@vger.kernel.org, please.
> > analyzing CPU 0:
> > =A0 driver: acpi-cpufreq
> > =A0 CPUs which run at the same hardware frequency: 0 1 2 3
> > =A0 CPUs which need to have their frequency coordinated by software=
: 0
> > =A0 maximum transition latency: 10.0 us.
> > =A0 hardware limits: 1.60 GHz - 2.67 GHz
> > =A0 available frequency steps: 2.67 GHz, 2.53 GHz, 2.40 GHz, 2.27 G=
Hz,
> > 2.13 GHz, 2.00 GHz, 1.87 GHz, 1.73 GHz, 1.60 GHz
> > =A0 available cpufreq governors: ondemand, userspace, performance
> > =A0 current policy: frequency should be within 1.60 GHz and 2.67 GH=
z.
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 The governor "userspace" may de=
cide which speed to use
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 within this range.
> > =A0 current CPU frequency is 2.67 GHz (asserted by call to hardware=
).
> ...
> > *******************************************************************=
*********************************
> > When I want to create the environment I want, the lower freq. alway=
s
> > sync with the higher freq.
> So you want, if for example cpufreq subsystem currently would set:
> =A0 1.2G
> =A0 2.0G
> like to have both cores set to 2.0G?
> This is what would really happen on an AMD core where HW frequency de=
pendencies
> exist and different freqs are applied and I expect it's same/similar =
on Intel.
>
> I do not think it's very useful, but you could hardcode to add all co=
res
> to the software cpumask (acpi-cpufreq.c):
> =A0 =A0 =A0 =A0if (policy->shared_type =3D=3D CPUFREQ_SHARED_TYPE_ALL=
 ||
> =A0 =A0 =A0 =A0 =A0 =A0policy->shared_type =3D=3D CPUFREQ_SHARED_TYPE=
_ANY) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cpumask_copy(policy->cpus, perf->share=
d_cpu_map);
> =A0 =A0 =A0 =A0}
> Instead of perf->shared_cpu_map you could use all online cpus (cpu_on=
line_mask).
>
> Due to possible HW dependencies and to make sure they got correctly e=
xported by
> BIOS (_PSD ACPI func) and due to the fact that latest CPUs can boost =
which you
> cannot control, which you even can only measure over a period of time=
 (you don't
> know at which freq your currently are) you should use mperf (in cpufr=
equtils)
> or better latest cpupower monitor feature.
> They show you the frequency your cores were really in.
> Real HW frequency might behave rather different than you'd expect it.
>
> =A0Thomas
>
> > It means that as long as one CPU frequency is higher, the rest lowe=
r
> > freq will adjust to the higher freq. even I set them to the lower
> > freq.
> > From the cpufreq-info report, it seems they are using hardware
> > coordination, not software coordination.
> > I saw some other articles talking about we can choose which coordin=
ation to use.
> > Do you know how to setting to software coordination, even if the po=
wer
> > do not save any consumption is ok.
> > I want the different speed of CPU for experiment.
> > Thanks for your listening!
