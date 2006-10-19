From: Krzysztof Oledzki <olel@ans.pl>
Subject: Re: 3.2GHz cpus with cpufreq become 2.8GHz
Date: Fri, 20 Oct 2006 00:25:48 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0610200022320.30089@bizon.gios.gov.pl>
References: <Pine.LNX.4.64.0610182133130.29935@bizon.gios.gov.pl>
 <4537A582.4020406@felter.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-187430788-1520145228-1161296748=:30089"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1946585AbWJSW0A@vger.kernel.org>
In-Reply-To: <4537A582.4020406@felter.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
To: Wes Felter <wesley@felter.org>
Cc: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---187430788-1520145228-1161296748=:30089
Content-Type: TEXT/PLAIN; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Thu, 19 Oct 2006, Wes Felter wrote:

> Krzysztof Oledzki wrote:
>> Hello,
>>=20
>> I have just noticed that enabling cpufreq on my Dell PowerEdge 1425SC=20
>> changes my secondary cpu clock to 2.8GHz.
>
> [snip]
>
>> # cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver
>> p4-clockmod
>
> You shouldn't be using this driver. Use speedstep-centrino or

Hm... speedstep-centrino on Xeon? AFAIK speedstep-centrino requires "est"=
=20
and /proc/cpuinfo does not mention this flag:
  fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 c=
lflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc pni monit=
or ds_cpl cid cx16 xtpr

> acpi-cpufrreq.

I will check this, thank you. BTW: what wrong is with p4-clockmod? I was=20
not able to find any information that it is broken and should not be=20
used?

Best regards,


 =09=09=09=09Krzysztof Ol=EAdzki
---187430788-1520145228-1161296748=:30089--
