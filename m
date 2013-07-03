From: =?UTF-8?B?VG9yYWxmIEbDtnJzdGVy?= <toralf.foerster@gmx.de>
Subject: Re: 3.10-rcX: cpu governor ondemand doesn't scale well after s2ram
Date: Wed, 03 Jul 2013 21:46:56 +0200
Message-ID: <51D47FB0.5090604@gmx.de>
References: <51C08370.4050906@gmx.de> <CAKohpok1gThXL925Yz5UgC54vTVQgymBA1cLGER_g-dgZu0JLA@mail.gmail.com> <51CF1E53.6060902@gmx.de> <8029836.CFiJCXmRQ0@vostro.rjw.lan> <51D05DF4.50704@linux.vnet.ibm.com> <51D06556.7080204@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <51D06556.7080204@gmx.de>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>

On 06/30/2013 07:05 PM, Toralf F=C3=B6rster wrote:
> On 06/30/2013 06:33 PM, Srivatsa S. Bhat wrote:
>> Toralf, can you please
>> try out the below patch and see if it improves anything? (Don't reve=
rt anything,
>> just apply the below diff on a problematic kernel and see if it solv=
es your
>> issue).
>=20
> applied on top of a66b2e5 - issue went away (either fixed or hidden n=
ow)
>=20
> Thx
>=20
But if I do apply that patch on top of kernel 3.10 then it has no effec=
t
- 3.10 shows the same issue.


--=20
MfG/Sincerely
Toralf F=C3=B6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3
