From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: Re: Ondemand governor not working with kernel-2.6.12-12mdk
Date: Mon, 10 Oct 2005 23:24:56 +0200
Message-ID: <434ADC28.5020707@tremplin-utc.net>
References: <20051008173032.52611.qmail@web32704.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20051008173032.52611.qmail@web32704.mail.mud.yahoo.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Alex Simonov <a_simonov@yahoo.com>
Cc: cpufreq@lists.linux.org.uk

08.10.2005 19:30, Alex Simonov wrote/a =E9crit:
> Hello Eric,
:
>=20
> Your patch did the trick, thanks! The only draw
> back is that the responsiveness is not=20
> so good - it takes at least 2-3 seconds to=20
> switch  to  the highest frequency and back, when
> thie high load is over. Is it supposed to be like
> that by design, or this latency could be changed?
>=20
>=20
That's strange, it's supposed to be faster (although it could be even=20
faster). IIRC, on 2.6.12, it should be every 100 milliseconds. You can=20
check the sampling frequency of the ondemand governor by doing a
cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate

It will give the period between each frequency update in microseconds.=20
In general, it should change from low to high in a tenth of a second.=20
You can check it with a stupid shell command like this (when nothing=20
else is running), this is only one line:

# date +%T.%N; while test $(cat=20
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq) !=3D $(cat=20
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq)  ; do true ; done=20
; date +%T.%N

By doing the difference between the two times displayed you'll know how=20
long it takes for the ondemand governor to change to the high frequency.

Here (pentium III), it takes about 0.08s .

Eric
