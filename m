From: Clayborne Arevalo <clayborne.arevalo@gmail.com>
Subject: Re: cpufreq doesn't work with AMD E-350 (Fusion)
Date: Thu, 16 Jun 2011 19:43:32 +0000 (UTC)
Message-ID: <loom.20110616T213517-210@post.gmane.org>
References: <423945.47085.qm@web121206.mail.ne1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

Star Sweeper <starsweeper <at> yahoo.com> writes:

> I have an ASRock E350M1/USB3, which appears to be unsupported by cpuf=
req:
>=20
> /usr/sbin/dmidecode | grep -i processor
> Processor Information
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Type: Central Processor
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 Version: AMD E-350 Processor=C2=A0
>=20
> /usr/bin/cpufreq-info=C2=A0
> cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
> Report errors and bugs to cpufreq <at> vger.kernel.org, please.
> analyzing CPU 0:
> =C2=A0 no or unknown cpufreq driver is active on this CPU
> =C2=A0 maximum transition latency: 4294.55 ms.
> analyzing CPU 1:
> =C2=A0 no or unknown cpufreq driver is active on this CPU
> =C2=A0 maximum transition latency: 4294.55 ms.

This appears to be related to Debian bug #627811
("cpufrequtils: loadcpufreq does not support AMD E-350 cpus").
The automagic script /etc/init.d/cpufrequtil fails to recognize
the cpu family of the newer Fusion CPUs:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D627811



