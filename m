From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - I missed that
Date: Fri, 7 Jul 2006 02:53:30 -0400
Message-ID: <20060707065330.GB27347@redhat.com>
References: <44AE03BA.5040901@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44AE03BA.5040901@interia.pl>
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

On Fri, Jul 07, 2006 at 08:48:26AM +0200, Rafa=C5=82 Bilski wrote:
 > This should be in "Use hardware support". Without this=20
 > longhaul will always fail when compiled into kernel.=20
 > I lost this when I was splitting patches. Sorry.

Ah yes, because the acpi processor module won't have initialised
I assume ?

Applied, thanks.

		Dave

--=20
http://www.codemonkey.org.uk
