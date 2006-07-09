From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Use information from Longhaul
Date: Sun, 9 Jul 2006 15:00:28 -0400
Message-ID: <20060709190027.GB10044@redhat.com>
References: <44B0D22D.2030805@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44B0D22D.2030805@interia.pl>
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
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk

On Sun, Jul 09, 2006 at 11:53:49AM +0200, Rafa=C5=82 Bilski wrote:
 > First. I lost very important line in do_powersaver. Again. Sorry.

So why is this diff longer than one line ? :-)

 > Longhaul don't report minimum multiplier. It reports minimum frequency.
 > So not always minimum multiplier at minimum FSB is really minimum.

I don't follow your logic.  How can lowest mult * lowest fsb not be
lowest frequency ?  The MSRs most definitly only report the multipliers.

 > This is most important for Nehemiah witch allows FSB 66MHz, 100MHz and=20
 > 133MHz. Ezra seems to support only 100MHz and 133MHz so in this case=20
 > minimum multiplier at min FSB reported is in fact minimum PLL multiplier.

Note, that we don't (and won't) do FSB scaling even the hardware in some
variants of longhaul claim to support it. The reality is that there are
very few boards out there that can do it, and it's impossible to detect
at runtime which boards they are.  Given this, all boards should always boot
up at the fastest FSB, so the FSB we read at startup should remain constant.

 > Looks like all VIA CPUs allow to read FSB frequency from EBL_CR_POWERON.
 > Only some have 66MHz reserved.

ISTR there was at least one (Ezra maybe?) that didn't.

 > More precise speed calculations. This is bad when kernel first reports=20
 > 999MHz and we are saying later that max is 997MHz.

I'd rather keep the code readable and lose a tiny bit of accuracy here.
The tables match the descriptions in the datasheets exactly, which makes
it easier to review.

		Dave


--=20
http://www.codemonkey.org.uk
