From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] Longhaul - Fix multipliers table
Date: Fri, 14 Jul 2006 18:24:05 -0400
Message-ID: <20060714222405.GP24705@redhat.com>
References: <44B7D605.2060603@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44B7D605.2060603@interia.pl>
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

On Fri, Jul 14, 2006 at 07:36:05PM +0200, Rafa=C5=82 Bilski wrote:
 > This patch fix multiplier table. Some values are swaped
 > and 9.0*133MHz processor is incorrecly reported as=20
 > 5.0*133MHz.

Wow, not sure what happened there. Looks like there was some
confusion over which CPU this table was for.

Care to rename multipliers to ezra_t_multipliers or c5m_multipliers
at the same time to ease the confusion?

		Dave

--=20
http://www.codemonkey.org.uk
