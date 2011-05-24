From: =?ISO-8859-1?Q?Kert=E9sz_Csaba?= <csaba.kertesz@gmail.com>
Subject: Bug in cpufreq?
Date: Tue, 24 May 2011 23:41:49 +0300
Message-ID: <BANLkTimdaYTbSKg_RF75v_W3r0bWNnLCtg@mail.gmail.com>
References: <BANLkTintiDnTWxfpxUXJq0+rCsg10nW2Lw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type:content-transfer-encoding;
        bh=El+3ly9y59GDpkM/bqXYVDcQF8efEYYEWVGKkDzImJ4=;
        b=IePjy9m/WepRE/RqWxhooqrVSYNfVYHI0My3vtHyzUsRbx+DTxs9MtOia2kBf4t3mT
         Su0b9/8CmFUq98jJZ9/etmMW/Cpmp+LKy4n/QNE9NaspCppVPPOVCqT2UwvpauJLavWu
         cEMtHjuu/G2nKD3FYHOYeXIBrOjO1osiIQv+0=
In-Reply-To: <BANLkTintiDnTWxfpxUXJq0+rCsg10nW2Lw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

Hi,

a bug drives me crazy on my laptop. Sometimes the CPU drops the
frequency to 800 Mhz, the CPU gets full overload and the machine is
almost unresponsive. Several processes (daemons, programs) eat the CPU
at the same time without any sane reason (e.g Amarok, Xorg, kwin,
pulseaudio, firefox...), if I run the oprofile during these
conditions, it reports >50 % spend in the kernel. (I will try to run
oprofile to profile the kernel also tomorrow.)
No temperature problems, but cpufreq-info shows something unusual, is
this possible?:

cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
=A0driver: acpi-cpufreq
=A0CPUs which run at the same hardware frequency: 0 1
=A0CPUs which need to have their frequency coordinated by software: 0
=A0maximum transition latency: 10.0 us.
=A0hardware limits: 800 MHz - 2.27 GHz
=A0available frequency steps: 2.27 GHz, 2.27 GHz, 1.60 GHz, 800 MHz
=A0available cpufreq governors: conservative, ondemand, userspace,
powersave, performance
=A0current policy: frequency should be within 2.27 GHz and 2.27 GHz.
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0The governor "performance" may decid=
e which speed to use
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0within this range.
=A0current CPU frequency is 800 MHz (asserted by call to hardware).
=A0cpufreq stats: 2.27 GHz:18.57%, 2.27 GHz:24.97%, 1.60 GHz:6.82%, 800
MHz:49.64% =A0(295)
analyzing CPU 1:
=A0driver: acpi-cpufreq
=A0CPUs which run at the same hardware frequency: 0 1
=A0CPUs which need to have their frequency coordinated by software: 1
=A0maximum transition latency: 10.0 us.
=A0hardware limits: 800 MHz - 2.27 GHz
=A0available frequency steps: 2.27 GHz, 2.27 GHz, 1.60 GHz, 800 MHz
=A0available cpufreq governors: conservative, ondemand, userspace,
powersave, performance
=A0current policy: frequency should be within 2.27 GHz and 2.27 GHz.
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0The governor "performance" may decid=
e which speed to use
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0within this range.
=A0current CPU frequency is 800 MHz (asserted by call to hardware).
=A0cpufreq stats: 2.27 GHz:76.79%, 2.27 GHz:1.63%, 1.60 GHz:2.69%, 800
MHz:18.89% =A0(25)

My laptop is a Dell Latitude E4300. I run Ubuntu Natty 32 bit with the
shipped kernel 2.6.38-8-generic-pae. lshw shows:

=A0 =A0 =A0 =A0 =A0description: CPU
=A0 =A0 =A0 =A0 =A0product: Intel(R) Core(TM)2 Duo CPU =A0 =A0 P9300 =A0=
@ 2.26GHz
=A0 =A0 =A0 =A0 =A0vendor: Intel Corp.
=A0 =A0 =A0 =A0 =A0physical id: 400
=A0 =A0 =A0 =A0 =A0bus info: cpu@0
=A0 =A0 =A0 =A0 =A0version: 6.7.6
=A0 =A0 =A0 =A0 =A0serial: 0001-0676-0000-0000-0000-0000
=A0 =A0 =A0 =A0 =A0slot: Microprocessor
=A0 =A0 =A0 =A0 =A0size: 800MHz
=A0 =A0 =A0 =A0 =A0capacity: 800MHz
=A0 =A0 =A0 =A0 =A0width: 64 bits
=A0 =A0 =A0 =A0 =A0clock: 266MHz
=A0 =A0 =A0 =A0 =A0capabilities: x86-64 fpu fpu_exception wp vme de pse=
 tsc msr
pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx
fxsr sse sse2 ss ht tm pbe nx constant_tsc arch_perfmon pebs bts
aperfmperf pni dtes64 monitor ds_cpl vmx smx est tm2 ssse3 cx16 xtpr
pdcm sse4_1 lahf_lm tpr_shadow vnmi flexpriority cpufreq
=A0 =A0 =A0 =A0 =A0configuration: cores=3D2 enabledcores=3D2 id=3D0 thr=
eads=3D2

Thanks,
=A0 Csaba
