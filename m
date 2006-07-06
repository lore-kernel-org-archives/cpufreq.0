From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - There are limits
Date: Thu, 6 Jul 2006 15:46:46 -0400
Message-ID: <20060706194646.GN13168@redhat.com>
References: <44AA8E61.7030807@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44AA8E61.7030807@interia.pl>
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
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk

On Tue, Jul 04, 2006 at 05:50:57PM +0200, Rafa=C5=82 Bilski wrote:
 > Hello!
 >=20
 > There is no need to worry about local APIC.
 > There is need to worry about I/O APIC, because I/O APIC=20
 > is replacing good old 8259. Acording to Nehemiah datasheet VIA is=20
 > using 3-wire bus to connect local APIC to I/O APIC.
 >=20
 > "[...] When IA32_APIC_BASE[11] is set to 0, processor APICs based on the=
 3-wire APIC
 >  bus cannot be generally re-enabled until a system hardware reset. The 3=
-wire bus
 >  looses track of arbitration that would be necessary for complete re-ena=
bling. Certain
 >  (local) APIC functionality can be enabled. [...]"
 >=20
 > So we must set disable bit for each interrupt in I/O APIC registers.=20
 > Same situation as for PIC - we must poke registers direcly.
 > How to do this? I don't know. So at the moment it is better=20
 > to fail.

Ok, I'll merge this up. We can revisit the APIC stuff later.

Thanks,

		Dave

--=20
http://www.codemonkey.org.uk
