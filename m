From: Jean Delvare <jdelvare@suse.de>
Subject: Re: Move of powerpc/cell cpufreq drivers
Date: Sat, 29 Mar 2014 15:35:23 +0100
Message-ID: <1396103723.23070.0.camel@chaos.site>
References: <20140328102616.20b45a0a@endymion.delvare>
	 <201403281902.33169.arnd@arndb.de> <1396032289.8076.22.camel@chaos.site>
	 <201403290346.17069.arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201403290346.17069.arnd@arndb.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Arnd Bergmann <arnd@arndb.de>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, cpufreq@vger.kernel.org

Hi Arnd,

Le Saturday 29 March 2014 =C3=A0 03:46 +0100, Arnd Bergmann a =C3=A9cri=
t :
> On Friday 28 March 2014, Jean Delvare wrote:
> > Thanks for pointing this out. I don't know much about powerpc hardw=
are
> > so I didn't realize that. We indeed ended up disabling this driver
> > altogether in our default ppc kernel config. Which was the easiest =
way
> > to solve our problem after all :-)
>=20
> You probably want to disable all of PPC_CELL anyway, which implies
> disabling this driver. There are a few hacks that get enabled if you
> want Cell support that have a small impact on performance on other
> platforms, and I don't expect anyone to run distro kernels on
> these machines any more.

That's exactly what we did.

Thanks,
--=20
Jean Delvare
SUSE L3 Support

