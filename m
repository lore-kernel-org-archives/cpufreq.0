From: Lars =?ISO-8859-15?Q?T=E4uber?= <taeuber@bbaw.de>
Subject: longhaul
Date: Mon, 3 May 2004 10:27:06 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040503102706.147649c3.taeuber@bbaw.de>
Reply-To: Lars =?ISO-8859-15?Q?T=E4uber?= <taeuber@informatik.hu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk

Hallo,

i got the address from the MAINTAINER file from Linux kernel source.

If this address is a list I'm not subscribed.

We've got two computers with the VIA Samuel2 CPU - one in revision 2 and on=
e in revision 3.

The revision 2 works with the longaul v1 driver on 2.6.5 very good.
(It's a Elitegroup A900 Desknote)
The other one doesn't work, it says that the max cpufreq (6??) is higher th=
an the one at boot time (598). This cpu is a 600MHz on an Epia CL6000. It r=
uns 24x7 and is passively cooled end therefor we want it to slow down when =
nothing is to do.

There is a driver that works but only for the 2.4.x kernels.
http://www3.sympatico.ca/howlettfamily/epia/longhaul.html

Is there a solution for our problem?


Best Regards
Lars T=E4uber
