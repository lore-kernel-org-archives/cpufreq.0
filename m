From: Tim Weippert <weiti@security.tds.de>
Subject: Re: Bad page state on AMD Opteron Dual System with kernel
	2.6.13-rc6-git13
Date: Mon, 29 Aug 2005 07:24:55 +0200
Message-ID: <20050829052454.GA8172@pbkg4>
References: <20050826165342.GA11796@pbkg4> <43110363.7020808@gentoo.org>
Reply-To: Tim Weippert <weiti@security.tds.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <43110363.7020808@gentoo.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Daniel Drake <dsd@gentoo.org>
Cc: akpm@osdl.org, cpufreq@lists.linux.org.uk, discuss@x86-64.org, linux-kernel@vger.kernel.org, davej@codemonkey.org.uk

On Sun, Aug 28, 2005 at 01:20:51AM +0100, Daniel Drake wrote:
> Hi,
>=20
> Tim Weippert wrote:
> >i have read some postings concerning the following Kernel Messages:
> >
> >Aug 26 18:04:01 montdsnsu3 kernel: grep[11619] general protection
> >rip:2aaaaaaaed43 rsp:7fffff9c0740 error:0
> >Aug 26 18:08:02 montdsnsu3 kernel: ping[14867] general protection
> >rip:2aaaaaaaed43 rsp:7fffffdbf300 error:0
> >Aug 26 18:08:03 montdsnsu3 kernel: grep[14987] general protection
> >rip:2aaaaaaaed43 rsp:7fffffdbfce0 error:0
> >Aug 26 18:08:03 montdsnsu3 kernel: grep[15041] general protection
> >rip:2aaaaaaaed43 rsp:7fffff9bf550 error:0
> >
> >And the Bad Page State Messages:
> >
> >Bad page state at prep_new_page (in process 'sh', page ffff8100011a69c=
8)
> >flags:0x0100000000000014 mapping:0000000000000000 mapcount:-3 count:0
> >Backtrace:
> >
> >Call Trace:<ffffffff8015a653>{bad_page+99}
> ><ffffffff8015aa31>{prep_new_page+65}
> >       <ffffffff8015b1e2>{buffered_rmqueue+306}
> ><ffffffff8015b425>{__alloc_pages+261}
> >       <ffffffff8015b7c5>{get_zeroed_page+37}
> ><ffffffff801691b7>{__pmd_alloc+55}
> >       <ffffffff8016614e>{copy_page_range+462}
> ><ffffffff80131da4>{copy_mm+820}
> >       <ffffffff80132cba>{copy_process+2282}
> ><ffffffff80133407>{do_fork+215}
> >       <ffffffff8010db7a>{system_call+126}
> ><ffffffff8010deeb>{ptregscall_common+103}
> >      =20
> >Trying to fix it up, but a reboot is needed
>=20
> Seems to be an identical problem as was filed here:
>=20
> 	http://bugs.gentoo.org/show_bug.cgi?id=3D103497
>=20
> This bug report seems to suggest that the ondemand scaling governor may=
 be=20
> at fault. Does your setup use this too?
>=20
> (CC'ing some extra people to make sure problem is known)
>=20

As this is an Server, i don't even use cpufreq on this machine. So it
think this isn't the same problem ...

Kind regards,=20

    weiti

p.s: Please CC me, cause i am not subscribed on lkml.

--=20

Interpunktion und Orthographie dieser Email ist frei erfunden.
Eine =DCbereinstimmung mit aktuellen oder ehemaligen Regeln
w=E4re rein zuf=E4llig und ist nicht beabsichtigt.

Tim Weippert <weiti@topf-sicret.org>
http://www.topf-sicret.org/
