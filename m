From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Sat, 5 May 2007 11:37:51 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705051114130.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
 <200705042320.41278.dj@david-web.co.uk> <Pine.LNX.4.61.0705050132410.18504@yvahk01.tjqt.qr>
 <463C18C4.7030304@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1423228AbXEEJjw@vger.kernel.org>
In-Reply-To: <463C18C4.7030304@interia.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Cc: David Johnson <dj@david-web.co.uk>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org


On May 5 2007 07:40, Rafa=C5=82 Bilski wrote:
>Jan,
>
>Can You send output of x86info program and output of=20

Where do I find this?

>lspci command? Longhaul wasn't working for You since 2.6.18 right?

# lspci
00:00.0 Host bridge: VIA Technologies, Inc. CN400/PM880 Host Bridge
00:00.1 Host bridge: VIA Technologies, Inc. CN400/PM880 Host Bridge
00:00.2 Host bridge: VIA Technologies, Inc. CN400/PM880 Host Bridge
00:00.3 Host bridge: VIA Technologies, Inc. CN400/PM880 Host Bridge
00:00.4 Host bridge: VIA Technologies, Inc. CN400/PM880 Host Bridge
00:00.7 Host bridge: VIA Technologies, Inc. CN400/PM880 Host Bridge
00:01.0 PCI bridge: VIA Technologies, Inc. VT8237 PCI Bridge
00:0d.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL-8139/8=
139C/8139C+ (rev 10)
00:0e.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL-8139/8=
139C/8139C+ (rev 10)
00:0f.0 IDE interface: VIA Technologies, Inc. VT82C586A/B/VT82C686/A/B/=
VT823x/A/C PIPC Bus Master IDE (rev 06)
00:10.0 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 C=
ontroller (rev 81)
00:10.1 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 C=
ontroller (rev 81)
00:10.2 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 C=
ontroller (rev 81)
00:10.3 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 C=
ontroller (rev 81)
00:10.4 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 86)
00:11.0 ISA bridge: VIA Technologies, Inc. VT8237 ISA bridge [KT600/K8T=
800/K8T890 South]
00:11.5 Multimedia audio controller: VIA Technologies, Inc. VT8233/A/82=
35/8237 AC97 Audio Controller (rev 60)
01:00.0 VGA compatible controller: VIA Technologies, Inc. S3 Unichrome =
Pro VGA Adapter (rev 02)

# dmidecode
Handle 0x0000, DMI type 0, 20 bytes
BIOS Information
        Vendor: Phoenix Technologies, LTD
        Version: 6.00 PG
        Release Date: 11/30/2005
        Address: 0xE0000
        Runtime Size: 128 kB
        ROM Size: 512 kB
        Characteristics:


>I'm going to work now, but I will be available after 14:00 UTC.

2.6.20.2 (2.6.20.2-ccj45-default, slightly different config
than openSUSE 10.2), no preemption, lockup.

2.6.21 (openSUSE 10.3 Alpha 3 2.6.21-3-default), voluntary
preemption, lockup.

If I shall try more combinations, let me know.

>If You have problem with longhaul+powersave there may be one thing=20
>related. When I started to change Longhaul it was causing lockups=20
>on Epia 800. I added transition protection. Helped, but not for=20
>long. After one or two hours machine locked up anyway. I found=20
>datasheet in Google and changed "disable BMDMA bit on PCI device" to=20
>northbridge support. Problem fixed. Somehow CLE133 chipset didn't=20
>like touching "BMDMA master" bits.
>Second: I didn't get answer from VIA why they are blocking ACPI C3 on =
CPU's=20
>faster then 1GHz. I don't know if it is standard practice and if
>Intel and AMD are doing it too.
>
>Things worth checking: disable PREEMPT, change it to "Voluntary preemp=
tion".=20
>Check if using conservative governor makes any difference. I know that=
=20
>this may sound strange, but transition latency is directly proportiona=
l to=20
>difference between current and destination frequency. Maybe for faster=
=20
>processors it isn't allowed to change frequency directly from min to m=
ax?

I'll try that .. too.


Thanks,
Jan
--=20
