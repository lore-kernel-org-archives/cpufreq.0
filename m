From: Dave Jones <davej@redhat.com>
Subject: Re: Longhaul - infrastructure(?) proposal
Date: Thu, 29 Jun 2006 15:28:09 -0400
Message-ID: <20060629192809.GC2067@redhat.com>
References: <44A3EC2F.7040909@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44A3EC2F.7040909@interia.pl>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: Dave Jones <davej@codemonkey.org.uk>, cpufreq@lists.linux.org.uk

On Thu, Jun 29, 2006 at 05:05:19PM +0200, Rafa=C5=82 Bilski wrote:
 > Hello!
 >=20
 > In case that flushing and disabling caches will not work.
 > It is possible that I do above in wrong way.
 > Would this code below be acceptable as infrastructure?
 > Is this infrastructure or maybe hack?
 > This is draft/proposal.
 > Can I continue in this way or I shouldn't?

I suggest to keep talking with Greg, as any work on quiescing dma will
need cooperation from both USB & PCI layers, and he's one of the
more knowledgable people in the area of the driver model.

		Dave

--=20
http://www.codemonkey.org.uk
