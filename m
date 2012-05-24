From: "Leandro Scott R.Z. Jacques" <lsrzj@yahoo.com>
Subject: Problems with scaling with Core i7 2670QM
Date: Thu, 24 May 2012 06:41:05 -0700 (PDT)
Message-ID: <1337866865.17692.YahooMailNeo@web140302.mail.bf1.yahoo.com>
Reply-To: "Leandro Scott R.Z. Jacques" <lsrzj@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1337866865; bh=Z0XVA3bIyL9W4/lzmcrrv5zBcP1kNigeoRyehfk15uA=; h=X-YMail-OSG:Received:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=jqf9WIJZy0gUFAdl8Qn6V6wchH0w5tfWJ0YbZI4YOYRo4+WkV2DJkcCGNYPYL6RzoCLIbjAKvWOdfEeeZoJ05ZmZIIMRDy2wDwX7V8HfctheMeaE1YbOoKugcZVsr82PtEy/1fo1MMB4XjRXu8A6ykJZbL56Inw9qF/4XKcK1yQ=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Hello, I'm using Ubuntu 12.04 and I noticed a strange behaviour when I =
compile a kernel from sou rce. I tried kernel 3.3.7 and made a make old=
config of my stock kernel from ubuntu and defaulted all the new options=
, so I was guarateeing that all th e configs of the stock kernel were b=
eing imported to the newly compiled and that scaling would work as it s=
hould. The problem is the scaling frequency reported by cpuinfo_cur_fre=
q and scaling_cur_freq as shown below, I compar ed those from compiled =
and stock kernels. What am I missing? Or it's a kind of bug?

/proc/cpuinfo
processor : 0
vendor_id : GenuineIntel
cp u family : 6
model : 42
model name : Intel( R) Core(TM) i7-2670QM CPU @ 2.20GHz
stepping : 7
microco de : 0C39723
cpu MHz : 800.000
cache size=A0 : 6144 KB
physical id : 0
siblings : 8
core id : 0
cpu cores : 4
apicid : 0
init ial apicid : 0
fpu : yes
fpu_exception : yes
=A0cpuid level : 13
wp : yes
flags : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov p=
at pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx rdt=
scp lm co nstant_tsc arch_perfmon pebs bts nopl xtopology nonstop_tsc a=
perfmperf p ni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 x=
tpr pdcm pcid sse4_1 sse4_2 x2apic popcnt tsc_deadline_timer aes xsave =
avx lahf_lm id a arat epb xsaveopt pln pts dts tpr_shadow vnmi flexprio=
rity ept vpidbogomips : 4390.25
clflush size : 64
cache_alignm ent : 64
address sizes : 36 bits physical, 48 bits virtual
po wer management:

WITH COMPILED KERNEL:
What I detected is this. I have two different readings for the same pro=
 cessor but one comes from cpuinfo_cur_freq and the other one comes fro=
m=A0 scaling_cur_freq as seen below:

sudo cat scaling_cur_freq; sud o cat cpuinfo_cur_freq
800000
1800000


What's the true reading? Why with stock kernel it doesn't=A0 happen the=
 frequencies match!


cat scaling_driver; cat scaling_governor
acpi-cpufreq
ondemand

cat time_in_state
2201000 57624
2200000 2875
2 000000 2297
1900000 631
1800000 620
1700000 709
160 0000 659
1500000 789
1400000 793
1300000 822
120000 0 801
1100000 977
1000000 1142
900000 705
800000 84 2189


WITH STOCK KERNEL:

With stock kernel, just for comparison, as you can see it's more logica=
l a nd the readings match, even the one that shows the time_in_state.
=A0

sudo cat scaling_cur_freq; sudo cat cpuinfo_cur_freq
800000
800000


cat scaling_driver;=A0 cat scaling_governor
acpi-cpufreq
ondemand


cat time_in_state
2201000 22259
2200000 50
200000 0 28
1900000 57
1800000 42
1700000 53
1600000 551500000 112
1400000 241
1300000 280
1200000 355
=A01100000 296
1000000 403
900000 1642
800000 145615
=A0

Leandro Scott

