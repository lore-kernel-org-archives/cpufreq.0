From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: [BUG] cpufreq on SMP with CPUs present but not online
Date: Tue, 18 Jan 2005 19:08:09 +0000
Message-ID: <20050118190809.C18102@flint.arm.linux.org.uk>
References: <20050117223827.D31178@flint.arm.linux.org.uk>
	<20050118180630.GB24734@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050118180630.GB24734@dominikbrodowski.de>;
	from linux@dominikbrodowski.de on Tue, Jan 18, 2005 at 07:06:30PM
	+0100
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
To: Dominik Brodowski <linux@dominikbrodowski.de>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: cpufreq@zenII.linux.org.uk

On Tue, Jan 18, 2005 at 07:06:30PM +0100, Dominik Brodowski wrote:
> On Mon, Jan 17, 2005 at 10:38:27PM +0000, Russell King wrote:
> > ... causes the cpufreq driver init method to be called for each CPU.
> > However, this causes something of a dilema on ARM/SMP - if the CPU
> > is not online (because we failed to bring it up via __cpu_up which
> > correctly returned an error), we can't read the current clock rate
> > settings, so we can't initialise policy->{cur,min,max} fields.
>=20
> Do I understand you correctly that this CPU will be brought up later?

Possibly - though I'm wondering whether it's really correct to register
the struct cpu for not-currently-online but possible CPUs.=A0 I think this
may make sense, but I'd want to get it confirmed by some SMP folk first.

> > Returning an error from the cpufreq driver init method means that
> > cpufreq completely forgets about this particular CPU, which also
> > isn't desirable.
> >=20
> > Ideas?
>=20
> Yes. I had tried to integrate cpufreq better with the CPU hotplug core a =
few
> months ago, but got delayed because of other hotplug-related issues which
> hopefully will be sorted out very soon. Stay tuned.
>=20
> 	Dominik
>=20
> PS: should we all use cpufreq@zenII.linux.org.uk or @lists.linux.org.uk?

lists.linux.org.uk please.  Unfortunately, when mailservers see the
CNAME for lists.linux.org.uk, they rewrite all addresses to the result
of the CNAME.  Alan - can you change CNAME into:

lists		IN	A	195.92.249.252
		IN	AAAA	2002:c35c:f9fc::1

please?  Thanks.

--=20
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core
