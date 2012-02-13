From: Dave Jones <davej@redhat.com>
Subject: Re: speed throttle to 800 cpufreq Ocelot
Date: Mon, 13 Feb 2012 14:34:26 -0500
Message-ID: <20120213193425.GA2455@redhat.com>
References: <CAPKGfw_Ab9p4Kh+EbPRCw+7xC5e=iZj7g3DH+_dvJHvVnxGPmw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPKGfw_Ab9p4Kh+EbPRCw+7xC5e=iZj7g3DH+_dvJHvVnxGPmw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: J Webster <jw.jwebster@gmail.com>
Cc: cpufreq@vger.kernel.org

On Mon, Feb 13, 2012 at 07:11:30PM +0000, J Webster wrote:
 > This problem first occurred 1 year ago on Maverick Meerkat.
 > I just upgraded and now it has appeared again.
 > I cannot get the indicator-cpufreq to start either.
 > I added the ignore_ppc =3D 1 to the grub but whilst that fixed it in
 > Meerkat, it does not in Ocelot.
 >=20
 > j@j-Inspiron-9300:~$ cpufreq-info
 > cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
 > Report errors and bugs to [email]cpufreq@vger.kernel.org[/email], pl=
ease.
 > analyzing CPU 0:
 > =A0 driver: p4-clockmod

don't use this driver. it's nothing but disappointment and doesn't save=
 you power.

I see the inspiron 9300 has a pentium M. Some of these lacked EST iirc,
so you're probably completely out of luck, and can't scale clock speed.

	Dave

