From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq on ARM broken
Date: Wed, 2 Jun 2004 14:21:53 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040602122153.GB8781@dominikbrodowski.de>
References: <20040529170151.B3799@flint.arm.linux.org.uk>
	<1086109894.27727.24.camel@delerium.codemonkey.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1086109894.27727.24.camel@delerium.codemonkey.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Tue, Jun 01, 2004 at 06:11:34PM +0100, Dave Jones wrote:
> Thoughts ?
> I've forgotten why we introduced this flag, it appears that this
> would be the first thing in the tree to actually use it,
> which makes me sceptical.

This flag was introduced when I added the "fail if no proper CPU found"
feature, which is helpful for the ACPI P-States driver and some other x86
drivers which only check whether they can run on _any_ CPU in the
cpu-specific initialization call. To assert backwards-compatibility, this
flag avoids "automatic unregistration" -- I wasn't aware some drivers do
need this backwards compatibility, but obviously ARM needs it. So Russell's 
patch looks to be what's needed, from my perspective.

	Dominik
