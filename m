From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH 4/4] minor optimizations to ondemand governor
Date: Fri, 30 Jun 2006 22:00:30 +0200
Message-ID: <44A582DE.6080606@interia.pl>
References: <CFF307C98FEABE47A452B27C06B85BB6E16653@hdsmsx411.amr.corp.intel.com>
	<20060630191119.GB11520@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060630191119.GB11520@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Dominik Brodowski napisa=B3(a):
> On Fri, Jun 30, 2006 at 03:33:39AM -0400, Brown, Len wrote:
>> =20
>>> Longer term, I'd really like to see conservative & ondemand
>>> sharing more code as a separate helper .o file. They're similar
>>> in so many ways, it seems silly to duplicate so much code.
>> What value does cpufreq_conservative.c add over ondemand?
>>
>> Are there some workloads we can measure to prove that
>> cpufreq_conservative.c should, or should-not exist?
>=20
> IIRC it's less a matter of workload than of which CPU you have -- not all
> do support fast jumps to the highest frequency? Or do they now?
>=20
> 	Dominik

Not all users want governor reaction on glitches in CPU usage.

Rafa=B3


------------------------------------------------------------------------
Interaktywne mapy miast na http://map24.interia.pl
