From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 05 May 2007 07:40:20 +0200
Message-ID: <463C18C4.7030304@interia.pl>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>	<200705042320.41278.dj@david-web.co.uk> <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754653AbXEEFkl@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: David Johnson <dj@david-web.co.uk>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

Jan,

Can You send output of x86info program and output of=20
lspci command? Longhaul wasn't working for You since 2.6.18 right?
I'm going to work now, but I will be available after 14:00 UTC.

If You have problem with longhaul+powersave there may be one thing=20
related. When I started to change Longhaul it was causing lockups=20
on Epia 800. I added transition protection. Helped, but not for=20
long. After one or two hours machine locked up anyway. I found=20
datasheet in Google and changed "disable BMDMA bit on PCI device" to=20
northbridge support. Problem fixed. Somehow CLE133 chipset didn't=20
like touching "BMDMA master" bits.
Second: I didn't get answer from VIA why they are blocking ACPI C3 on C=
PU's=20
faster then 1GHz. I don't know if it is standard practice and if
Intel and AMD are doing it too.

Things worth checking: disable PREEMPT, change it to "Voluntary preempt=
ion".=20
Check if using conservative governor makes any difference. I know that=20
this may sound strange, but transition latency is directly proportional=
 to=20
difference between current and destination frequency. Maybe for faster=20
processors it isn't allowed to change frequency directly from min to ma=
x?

Rafa=B3



----------------------------------------------------------------------
NIE KUPUJ!!!
=2E..zanim nie porownasz cen >> http://link.interia.pl/f1a5e


