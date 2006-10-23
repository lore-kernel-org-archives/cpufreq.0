From: Krzysztof Oledzki <olel@ans.pl>
Subject: Re: 3.2GHz cpus with cpufreq become 2.8GHz
Date: Mon, 23 Oct 2006 15:53:33 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0610231550570.8201@bizon.gios.gov.pl>
References: <Pine.LNX.4.64.0610182133130.29935@bizon.gios.gov.pl>
 <4537A582.4020406@felter.org> <Pine.LNX.4.64.0610200022320.30089@bizon.gios.gov.pl>
 <453800C1.8050409@felter.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-187430788-1738232621-1161611613=:8201"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751182AbWJWNxr@vger.kernel.org>
In-Reply-To: <453800C1.8050409@felter.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
To: Wes Felter <wesley@felter.org>
Cc: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---187430788-1738232621-1161611613=:8201
Content-Type: TEXT/PLAIN; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE



On Thu, 19 Oct 2006, Wes Felter wrote:

> Krzysztof Oledzki wrote:
>
>> Hm... speedstep-centrino on Xeon? AFAIK speedstep-centrino requires "est=
"=20
>> and /proc/cpuinfo does not mention this flag:
>>  fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36=
=20
>> clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc pni=
=20
>> monitor ds_cpl cid cx16 xtpr
>
> Odd; I have a similar processor and it has est and uses the=20
> speedstep-centrino driver. But I am using an old kernel (2.6.5) and the f=
lag=20
> detection has changed since then.

Anyway, I have just tested speedstep-centrino, but it does not work.

>> BTW: what wrong is with p4-clockmod? I was not able to find any informat=
ion=20
>> that it is broken and should not be used?
>
> It makes the processor slower but only reduces power consumption slightly=
,=20
> making the processor less power-efficient. You probably don't want your=
=20
> processor to be less efficient.

I also tested ACPI Processor P-States driver (X86_ACPI_CPUFREQ), but it=20
does not work either.

Any other ideas?

Best regards,

 =09=09=09=09Krzysztof Ol=EAdzki
---187430788-1738232621-1161611613=:8201--
