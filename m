From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: cpufreq longhaul locks up
Date: Fri, 4 May 2007 20:48:27 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705042042270.18504@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
	<463B687D.1020600@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <463B687D.1020600@interia.pl>
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
To: =?UTF-8?B?UmFmYcWCIEJpbHNraQ==?= <rafalbilski@interia.pl>
Cc: Dave Jones <davej@codemonkey.org.uk>, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk


On May 4 2007 19:08, Rafa=C5=82 Bilski wrote:
>
>Btw. I've been writting many times: if You want to use ondemand with=20
>Longhaul You don't need cpufreq at all.

Does VIA Nehemiah do hardware-driven autoregulation like Transmeta
Crusoe too? (I suspect no, have not seen that happen.)

>It is just one another cool gadget for You.
>Longhaul wasn't designed to change frequency often.=20

Is there a way I can start with a specific governor (powersave) right
from the start so that all devices that Linux will initialize assume
the CPU runs at <choose something> MHz?

>It has big latency and requires so much preparation that it isn't worth=20
>if You don't need to save power or cool down CPU.=20

I found frequency switching on my VIA to be fast enough.


Jan
--=20
