From: Bradley Coleman <bradley@proxydemocracy.org>
Subject: i think powernow-k8 is hiding a speed step on my Athlon Dual-Core QL-60
Date: Mon, 15 Aug 2011 12:44:24 -0700
Message-ID: <CACuyBz0JABKPw4Vap_wXB3Y7VyqBwQKcgtenVLb_wFUJu61NjQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:date:x-google-sender-auth:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=lup586P+E/9H79v1LClXnXgtIFjWSU+PLAz9/maonzw=;
        b=GaOm1jFCb3DR0zbWedtOT/6TPVPc2dRbrz8guSm3QVd5cV9vBsu+C1sP4GlLFgv4Zt
         2mXTTRewlkX6kx2cMEtGg6kNGUMONgkW6CGyMT6upgTny+mwboobGhnwiFosNri9rP65
         A8xyuCGu/GnYAbg5MbnDse4AsGd2Qm8sQtXdE=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

thanks in advance!

i just killed ubuntu and installed crunchbang linux, which didnt
install=A0cpufrequtils by default, so my computer just burnt up a few
times and shut off in the middle of sensitive updating, oops! =A0i
started watching the freq of my cpu through conky and realized it
wasn't moving,=A0so that's how i found you :-).

cpufreq-info=A0says this: "available frequency steps: 1.90 GHz, 950
MHz". =A0but i'm nearly sure it's missing something in the middlle. =A0=
at
least on ubuntu, there was at least one step in the middle. =A0i
included my cpuinfo below as well.

the cpu is actually still very hot, about 80C with a browser and
without flash. =A0what can i do about that besides open up my compaq
shitbox laptop and clean it out? =A0i could use a more conservative
governor. =A0crunchbang is certainly way lighter than ubuntu, thought i=
t
would make a big difference?



brad@crunchbang:~$ cpufreq-info
cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to=A0cpufreq@vger.kernel.org, please.
analyzing CPU 0:
=A0=A0driver: powernow-k8
=A0=A0CPUs which run at the same hardware frequency: 0
=A0=A0CPUs which need to have their frequency coordinated by software: =
0
=A0=A0maximum transition latency: 1000 ns.
=A0=A0hardware limits: 950 MHz - 1.90 GHz
=A0=A0available frequency steps: 1.90 GHz, 950 MHz
=A0=A0available cpufreq governors: powersave, userspace, conservative,
ondemand, performance
=A0=A0current policy: frequency should be within 950 MHz and 1.90 GHz.
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0The governor "ondemand" may decid=
e which speed to use
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0within this range.
=A0=A0current CPU frequency is 950 MHz.
=A0=A0cpufreq stats: 1.90 GHz:11.85%, 950 MHz:88.15% =A0(2181)
analyzing CPU 1:
=A0=A0driver: powernow-k8
=A0=A0CPUs which run at the same hardware frequency: 1
=A0=A0CPUs which need to have their frequency coordinated by software: =
1
=A0=A0maximum transition latency: 1000 ns.
=A0=A0hardware limits: 950 MHz - 1.90 GHz
=A0=A0available frequency steps: 1.90 GHz, 950 MHz
=A0=A0available cpufreq governors: powersave, userspace, conservative,
ondemand, performance
=A0=A0current policy: frequency should be within 950 MHz and 1.90 GHz.
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0The governor "ondemand" may decid=
e which speed to use
=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0within this range.
=A0=A0current CPU frequency is 950 MHz.
=A0=A0cpufreq stats: 1.90 GHz:11.13%, 950 MHz:88.87% =A0(1941)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

brad@crunchbang:~$ less /proc/cpuinfo
processor : 0
vendor_id : AuthenticAMD
cpu family : 17
model : 3
model name : AMD Athlon Dual-Core QL-60
stepping : 1
cpu MHz : 950.000
cache size : 512 KB
physical id : 0
siblings : 2
core id : 0
cpu cores : 2
apicid : 0
initial apicid : 0
fpu : yes
fpu_exception : yes
cpuid level : 1
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt
rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl nonstop_tsc
extd_apicid pni cx16 lahf_lm cmp_legacy svm extapic cr8_legacy
3dnowprefetch osvw skinit lbrv svm_lock nrip_save
bogomips : 3799.97
TLB size : 1024 4K pages
clflush size : 64
cache_alignment : 64
address sizes : 40 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate


processor : 1
vendor_id : AuthenticAMD
cpu family : 17
model : 3
model name : AMD Athlon Dual-Core QL-60
stepping : 1
cpu MHz : 950.000
cache size : 512 KB
physical id : 0
siblings : 2
core id : 1
cpu cores : 2
apicid : 1
initial apicid : 1
fpu : yes
fpu_exception : yes
cpuid level : 1
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt
rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl nonstop_tsc
extd_apicid pni cx16 lahf_lm cmp_legacy svm extapic cr8_legacy
3dnowprefetch osvw skinit lbrv svm_lock nrip_save
bogomips : 3800.11
TLB size : 1024 4K pages
clflush size : 64
cache_alignment : 64
address sizes : 40 bits physical, 48 bits virtual
power management: ts ttp tm stc 100mhzsteps hwpstate
