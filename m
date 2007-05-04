From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Fri, 4 May 2007 23:03:46 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705042303030.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
	<463B687D.1020600@interia.pl>
	<Pine.LNX.4.61.0705042042270.18504@yvahk01.tjqt.qr>
	<463B9380.5090503@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <463B9380.5090503@interia.pl>
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
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Cc: Dave Jones <davej@codemonkey.org.uk>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk


On May 4 2007 22:11, Rafa=C5=82 Bilski wrote:
>>=20
>>> It has big latency and requires so much preparation that it isn't worth=
=20
>>> if You don't need to save power or cool down CPU.=20
>>=20
>> I found frequency switching on my VIA to be fast enough.
>
>Timer frequency equal to 1000Hz?=20

The regular irq0 timer ticks at 250. What I meant is that I do not have
to wait more than 0.5 seconds for cpufreq-set to finish.


Jan
--=20
