From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: Enhanced PowerSaver driver
Date: Sun, 28 Jan 2007 17:53:52 +0100
Message-ID: <45BCD520.4080308@interia.pl>
References: <45BC9E94.6080701@interia.pl> <20070128142543.GA1676@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070128142543.GA1676@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-9"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

> On Sun, Jan 28, 2007 at 02:01:08PM +0100, Rafa=B3 Bilski wrote:
>  > Hello,
>  >=20
>  > Looks like VIA have add support for C7 processors to Longhaul patch=20
>  > available from www.viaarena.com. It is done using hardcoded tables=20
>  > with P-states. I wasn't aware that driver for C7 already exists=20
>  > when I posted my patch. Please ignore it.
>=20
> I wish they'd send patches upstream instead of creating their own
> world to live in.  It's not just cpufreq patches either, I've just
> had to sift through a 6.7MB AGP patch they released just to fish
> out some additional PCI IDs.
>=20
> Annoying.
>=20
> Are you going to sift through their C7 driver and send diffs, or shall
> I add to my todo ?
>=20
> thanks,
>=20
> 		Dave

Well, this driver is based on 2.6.16 Longhaul. I have a couple of=20
small patches for C3 which I would like to send first. I would like=20
to help, but I don't have access to any motherboard with C7 CPU.=20
I can't test it. I just think that there is no need to add my version=20
to kernel when there is official VIA driver available.

Regards
Rafa=B3


----------------------------------------------------------------------
Zalety czapki niewidki. Zobacz >> http://link.interia.pl/f19e3
