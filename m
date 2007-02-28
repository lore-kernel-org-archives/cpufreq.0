From: "stefano ferri" <ferriste@libero.it>
Subject: Re: [Bug 8081] Conservative governor sets wrong and too high
	sampling rates
Date: Wed, 28 Feb 2007 14:34:23 +0100
Message-ID: <JE6DPB$D8C8A1031208A0FAD41055B8B282C327@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: rafalbilski <rafalbilski@interia.pl>
Cc: cpufreq <cpufreq@lists.linux.org.uk>

> So now, if I have a default sampling rate of 199000, the min will be 19=
900... good

Oops.. wrong calculus. With the original code of the kernel default is 19=
90000, min with your patch will be 1/10, so 199000. Could you please alig=
n the min values with that of ondemand? (for my processor is 99500). It s=
hould be 1/20 of the default, and the min sampling rate that one can set =
would be about 1/10 of second.

Thanks
Stefano
=0A=0A=0A------------------------------------------------------=0APassa a=
 Infostrada. ADSL e Telefono senza limiti e senza canone Telecom=0Ahttp:/=
/click.libero.it/infostrada28eb07=0A
