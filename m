From: Dave Jones <davej@redhat.com>
Subject: Re: Enhanced PowerSaver driver
Date: Sun, 28 Jan 2007 09:25:43 -0500
Message-ID: <20070128142543.GA1676@redhat.com>
References: <45BC9E94.6080701@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <45BC9E94.6080701@interia.pl>
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

On Sun, Jan 28, 2007 at 02:01:08PM +0100, Rafa=C5=82 Bilski wrote:
 > Hello,
 >=20
 > Looks like VIA have add support for C7 processors to Longhaul patch=20
 > available from www.viaarena.com. It is done using hardcoded tables=20
 > with P-states. I wasn't aware that driver for C7 already exists=20
 > when I posted my patch. Please ignore it.

I wish they'd send patches upstream instead of creating their own
world to live in.  It's not just cpufreq patches either, I've just
had to sift through a 6.7MB AGP patch they released just to fish
out some additional PCI IDs.

Annoying.

Are you going to sift through their C7 driver and send diffs, or shall
I add to my todo ?

thanks,

		Dave

--=20
http://www.codemonkey.org.uk
