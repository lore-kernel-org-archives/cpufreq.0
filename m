From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [Bug 8081] Conservative governor sets wrong and too high
 sampling rates
Date: Sun, 25 Feb 2007 21:29:59 +0100
Message-ID: <45E1F1C7.4010007@interia.pl>
References: <200702251637.l1PGbKho022062@fire-2.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200702251637.l1PGbKho022062@fire-2.osdl.org>
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
Content-Type: text/plain; charset="iso-8859-9"
To: ferriste@libero.it
Cc: cpufreq@lists.linux.org.uk

> ------- Additional Comments From ferriste@libero.it  2007-02-25 08:37 ---=
----
> Created an attachment (id=3D10530)
>  --> (http://bugzilla.kernel.org/attachment.cgi?id=3D10530&action=3Dview)
> This is a simple patch to fix the bug. Apply it at conservative.c
NACK from me. Current values are working for me. If these values are=20
not good for You then write patch to Kconfig which will allow user to=20
change sampling rate during "make config". Later "make oldconfig" will=20
preserve Your values.

Rafa=B3


----------------------------------------------------------------------
Przedluz domene.PL za 75 z=B3 >> http://link.interia.pl/f1a19
