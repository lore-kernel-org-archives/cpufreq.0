From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] Cpufreq: Change sysfs interface cpuinfo_cur_freq access privilege
Date: Mon, 25 Nov 2013 13:14:54 +0100
Message-ID: <1521595.q8BSAikk1K@vostro.rjw.lan>
References: <1385348018-30525-1-git-send-email-tianyu.lan@intel.com> <5074010.ha99UACE9S@vostro.rjw.lan> <52933AB5.9060409@intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <52933AB5.9060409@intel.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Lan Tianyu <tianyu.lan@intel.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, hg197@gmx.de, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Monday, November 25, 2013 07:55:33 PM Lan Tianyu wrote:
> On 11/25/2013 07:26 PM, Rafael J. Wysocki wrote:
> > On Monday, November 25, 2013 01:33:39 PM Lan Tianyu wrote:
> >> On 2013=E5=B9=B411=E6=9C=8825=E6=97=A5 12:30, Viresh Kumar wrote:
> >>> On 25 November 2013 08:23, Lan Tianyu <tianyu.lan@intel.com> wrot=
e:
> >>>> Currently, cpuinfo_cur_freq is only accessible for root user whi=
le
> >>>> other cpufreq sysfs interfaces(E,G scaling_cur_freq) are availab=
le
> >>>> to ordinary user. This seems make no sense. This patch is to cha=
nge
> >>>> it.
> >>>
> >>> There is nothing wrong with the code and so this is more of a des=
ign
> >>> change..
> >>>
> >>> Probably Rafael can help us here as cpufreq_cur_freq will read st=
uff
> >>> directly from hardware instead of using cached value in software.
> >>
> >> I think so, too. I also tried to checking the reason of the privil=
ege by
> >> git log but the code was there before linux kernel being migrated =
to git
> >> repository.
> >
> > And it has always behaved in the same way?  Then I wouldn't change =
it.
> >
>=20
> It has been there since 2.6.12-rc2 or more early. But the=20
> cpuinfo_cur_freq is read-only and seems no harmful.

If it reads things directly from hardware, it may not be totally neutra=
l.

Thanks!

--=20
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
