From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: 3.10-rcX: cpu governor ondemand doesn't scale well after s2ram
Date: Fri, 28 Jun 2013 20:56:43 +0200
Message-ID: <1875598.7eDhd0iuMQ@vostro.rjw.lan>
References: <51C08370.4050906@gmx.de> <CAKohponp7JbQeeC7D=X7+DBcWtUr2NhRKz7spxKA=+K8SAY+Og@mail.gmail.com> <51CDC518.8030907@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <51CDC518.8030907@gmx.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Toralf =?ISO-8859-1?Q?F=F6rster?= <toralf.foerster@gmx.de>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>

On Friday, June 28, 2013 07:17:12 PM Toralf F=C3=B6rster wrote:
> On 06/28/2013 05:44 AM, Viresh Kumar wrote:
> > Can you give dumps of complete cpufreq directories for all cpus bef=
ore
> > and after s2r. That may give us some hint about the problem.
>=20
> Because CPU0 is not affected I somehow arguing about nohz patches ...

Do you have CONFIG_NO_HZ_FULL set by chance?

Rafael

