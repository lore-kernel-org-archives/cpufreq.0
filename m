From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 1/2] cpufreq: use dynamic debug instead of custom
 infrastructure
Date: Mon, 25 Apr 2011 12:28:20 -0400
Message-ID: <20110425162820.GA18401@redhat.com>
References: <20110327130446.GA6759@comet.dominikbrodowski.net>
 <20110425140218.GA27378@comet.dominikbrodowski.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110425140218.GA27378@comet.dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@vger.kernel.org

On Mon, Apr 25, 2011 at 04:02:18PM +0200, Dominik Brodowski wrote:
 > ping... any chance to get this and the second patch into 2.6.40?
=20
This looks like it needs a bit more work..

arch/x86/kernel/cpu/cpufreq/longhaul.c: In function =E2=80=98longhaul_s=
etstate=E2=80=99:
arch/x86/kernel/cpu/cpufreq/longhaul.c:275: error: implicit declaration=
 of function =E2=80=98print_speed=E2=80=99
arch/x86/kernel/cpu/cpufreq/longhaul.c:275: warning: format =E2=80=98%s=
=E2=80=99 expects type =E2=80=98char *=E2=80=99, but argument 6 has typ=
e =E2=80=98int=E2=80=99
arch/x86/kernel/cpu/cpufreq/longhaul.c: In function =E2=80=98longhaul_g=
et_ranges=E2=80=99:
arch/x86/kernel/cpu/cpufreq/longhaul.c:465: warning: format =E2=80=98%s=
=E2=80=99 expects type =E2=80=98char *=E2=80=99, but argument 4 has typ=
e =E2=80=98int=E2=80=99
arch/x86/kernel/cpu/cpufreq/longhaul.c:465: warning: format =E2=80=98%s=
=E2=80=99 expects type =E2=80=98char *=E2=80=99, but argument 5 has typ=
e =E2=80=98int=E2=80=99

arch/x86/kernel/cpu/cpufreq/powernow-k7.c: In function =E2=80=98get_ran=
ges=E2=80=99:
arch/x86/kernel/cpu/cpufreq/powernow-k7.c:209: error: =E2=80=98mobile_v=
id_table=E2=80=99 undeclared (first use in this function)
arch/x86/kernel/cpu/cpufreq/powernow-k7.c: In function =E2=80=98powerno=
w_acpi_init=E2=80=99:
arch/x86/kernel/cpu/cpufreq/powernow-k7.c:401: error: =E2=80=98mobile_v=
id_table=E2=80=99 undeclared (first use in this function)

arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c: In function =E2=80=98pcc_get=
_freq=E2=80=99:
arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c:178: warning: format =E2=80=98=
%x=E2=80=99 expects type =E2=80=98unsigned int=E2=80=99, but argument 4=
 has type =E2=80=98void *=E2=80=99
arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c: In function =E2=80=98pcc_cpu=
freq_target=E2=80=99:
arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c:212: warning: format =E2=80=98=
%x=E2=80=99 expects type =E2=80=98unsigned int=E2=80=99, but argument 5=
 has type =E2=80=98void *=E2=80=99

arch/x86/kernel/cpu/cpufreq/powernow-k8.c: In function =E2=80=98powerno=
w_k8_cpu_init_acpi=E2=80=99:
arch/x86/kernel/cpu/cpufreq/powernow-k8.c:852: warning: format =E2=80=98=
%x=E2=80=99 expects type =E2=80=98unsigned int=E2=80=99, but argument 3=
 has type =E2=80=98u64=E2=80=99
arch/x86/kernel/cpu/cpufreq/powernow-k8.c:852: warning: format =E2=80=98=
%x=E2=80=99 expects type =E2=80=98unsigned int=E2=80=99, but argument 4=
 has type =E2=80=98u64=E2=80=99

arch/x86/kernel/cpu/cpufreq/speedstep-smi.c: In function =E2=80=98speed=
step_init=E2=80=99:
arch/x86/kernel/cpu/cpufreq/speedstep-smi.c:407: warning: format =E2=80=
=98%.8lx=E2=80=99 expects type =E2=80=98long unsigned int=E2=80=99, but=
 argument 3 has type =E2=80=98__u32=E2=80=99
arch/x86/kernel/cpu/cpufreq/speedstep-smi.c:407: warning: format =E2=80=
=98%.8lx=E2=80=99 expects type =E2=80=98long unsigned int=E2=80=99, but=
 argument 4 has type =E2=80=98__u32=E2=80=99
arch/x86/kernel/cpu/cpufreq/speedstep-smi.c:407: warning: format =E2=80=
=98%.8lx=E2=80=99 expects type =E2=80=98long unsigned int=E2=80=99, but=
 argument 5 has type =E2=80=98__u32=E2=80=99
arch/x86/kernel/cpu/cpufreq/speedstep-smi.c:407: warning: format =E2=80=
=98%.8lx=E2=80=99 expects type =E2=80=98long unsigned int=E2=80=99, but=
 argument 6 has type =E2=80=98__u32=E2=80=99


